from django.http import JsonResponse
import jwt
from django.conf import settings
from django.contrib.auth.models import User
import json
from django.core.files.base import ContentFile
import base64
from datetime import datetime

from goods.models import Goods, Images
from user.models import UserInfo


# Create your views here.

# 获取所有的 help
def all_view(request):
    if request.method == 'GET':
        return None
    if request.method == 'POST':
        # 获取用户信息
        user_data = parse_jwt_token(request)
        uid = None
        if user_data:
            uid = user_data['uid']
        else:
            return JsonResponse({'status': 'error', 'message': '没有Token'}, status=401)

        all_goods = Goods.objects.all()
        # 查询所有的帖子数据
        # 创建一个空列表，用于存储求助帖子的数据
        data = []

        # 遍历每个帖子，获取帖子及其关联数据，并添加到 helps_data 列表中
        for good in all_goods:
            # 获取帖子数据
            good_data = {
                'gid': good.gid,
                'content': good.content,
                'time': good.time,
                'price': good.price,
                'number': good.number,
            }

            # 获取帖子关联的图片数据
            images_data = list(good.image_set.values('image', 'description', 'upload_time'))
            # 处理每个图片的路径，在路径前添加特定的字符串
            for image_data in images_data:
                image_data['image'] = "http://localhost:8000/" + image_data['image']  # 在图片路径前添加 "http://"

            # 将帖子及其关联数据打包到 good_data 字典中
            good_data['images'] = images_data

            # 将帖子数据添加到 helps_data 列表中
            data.append(good_data)

        # 返回 JSON 响应
        return JsonResponse({'status': 'success', 'data': data}, status=200)
    else:
        return JsonResponse({'status': 'error', 'message': 'Method not allowed'}, status=405)


# 返回单个互助帖子信息
# @csrf_exempt
def get_good_by_gid(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        # 获取 pid 参数
        gid = data.get('gid')
        user_data = parse_jwt_token(request)
        uid = None
        if user_data:
            uid = user_data['uid']
            username = user_data['username']
            # print(uid, username)

        try:
            good = Goods.objects.get(gid=gid)

            # 获取帖子关联的图片数据
            images_data = list(good.image_set.values('image', 'description', 'upload_time'))
            # 处理每个图片的路径，在路径前添加特定的字符串
            for image_data in images_data:
                image_data['image'] = "http://localhost:8000/" + image_data['image']  # 在图片路径前添加 "http://"

            # 构造返回给客户端的数据
            response_data = {
                'status': 'success',
                'gid': good.gid,
                'content': good.content,
                'time': good.time,
                'price': good.price,
                'number': good.number,
                'user': {
                    'uid': good.user.uid,
                    'username': good.user.username,
                    'pic': 'http://localhost:8000' + good.user.pic.url if good.user.pic else None
                },
                'images': images_data,
            }
            return JsonResponse(response_data, status=200)
        except Goods.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': '内容不存在'}, status=404)
    else:
        return JsonResponse({'status': 'error', 'message': 'Method not allowed'}, status=405)


# 添加互助信息
def add_view(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        # print(data)
        content = data.get('content')
        images_base64 = data.get('images', [])
        # print(images_base64)

        # 获取用户信息
        user_data = parse_jwt_token(request)
        if not user_data:
            return JsonResponse({'status': 'error', 'message': '用户未登录'}, status=401)

        try:
            # 查询获取当前用户对象
            current_user = UserInfo.objects.get(pk=user_data['uid'])

            # 创建帖子对象并保存基本信息
            new_goods = Goods(content=content, user=current_user)
            new_goods.save()

            print("cccc")
            # 保存图片数据
            for idx, image_base64 in enumerate(images_base64):
                print("aaaa")
                print("idx", idx)
                # print("image_base64", image_base64)
                try:
                    # 解码 Base64 编码的图片数据
                    base64_data = image_base64.split(';base64,')[1]
                    image_data = base64.b64decode(base64_data)
                except Exception as e:
                    print(f"Error decoding Base64 image data for index {idx}: {e}")
                    continue  # 跳过当前循环，继续处理下一个图片
                # 生成图片文件名，格式为 pid_uid_时间戳.png
                image_filename = f"{new_goods.gid}_{current_user.uid}_{datetime.now().strftime('%Y%m%d%H%M%S%f')}.jpg"
                # 创建 Images 对象并将图片数据保存为文件
                image_instance = Images.objects.create(description=f'image_{idx}', goods=new_goods)
                image_instance.image.save(image_filename, ContentFile(image_data), save=True)

            # 返回添加成功的响应
            return JsonResponse({'status': 'success', 'message': '商品发布成功'}, status=200)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)
    else:
        return JsonResponse({'status': 'error', 'message': 'Method not allowed'}, status=405)


# 解析Token
def parse_jwt_token(request):
    # 检查请求头中是否存在 Authorization 字段
    if 'HTTP_AUTHORIZATION' in request.META:
        auth_header = request.META['HTTP_AUTHORIZATION']
        # 检查 Authorization 字段是否以 Bearer 开头
        if auth_header.startswith('Bearer '):
            # 从 Authorization 字段中提取JWT令牌
            token = auth_header.split(' ')[1]
            # print(token)
            try:
                # 解析JWT令牌
                payload = jwt.decode(token, settings.SECRET_KEY, algorithms=['HS256'])
                # 从payload中获取用户ID
                uid = payload.get('uid')
                username = payload.get('username')
                # 使用用户ID查找用户

                user = {
                    'uid': uid,
                    'username': username
                }
                return user

            except jwt.ExpiredSignatureError as e:
                print("JWT令牌已过期:", e)
                return None
            except jwt.InvalidTokenError as e:
                print("无效的JWT令牌:", e)
                return None
            except User.DoesNotExist as e:
                print("找不到用户:", e)
                return None
    return None
