from django.http import JsonResponse

import jwt
from django.conf import settings
from django.contrib.auth.models import User
import json
from django.core.files.base import ContentFile
import base64
from datetime import datetime

from activity.models import Activity, Images, Discuss
from user.models import UserInfo


# Create your views here.
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

        all_activity = Activity.objects.all()
        # 查询所有的帖子数据
        # 创建一个空列表，用于存储求助帖子的数据
        data = []

        # 遍历每个帖子，获取帖子及其关联数据，并添加到 helps_data 列表中
        for activity in all_activity:
            # 获取帖子数据
            activity_data = {
                'aid': activity.aid,
                'content': activity.content,
                'time': activity.time,
                "type": activity.type,
                'number': activity.number
            }

            # 获取帖子关联的图片数据
            images_data = list(activity.image_set.values('image', 'description', 'upload_time'))
            # 处理每个图片的路径，在路径前添加特定的字符串
            for image_data in images_data:
                image_data['image'] = "http://localhost:8000/" + image_data['image']  # 在图片路径前添加 "http://"

            # 将帖子及其关联数据打包到 help_data 字典中
            activity_data['images'] = images_data

            # 将帖子数据添加到 helps_data 列表中
            data.append(activity_data)

        # 返回 JSON 响应
        return JsonResponse({'status': 'success', 'data': data}, status=200)
    else:
        return JsonResponse({'status': 'error', 'message': 'Method not allowed'}, status=405)


def get_activity_by_aid(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        # 获取 pid 参数
        aid = data.get('aid')
        user_data = parse_jwt_token(request)
        uid = None
        if user_data:
            uid = user_data['uid']
            username = user_data['username']
            # print(uid, username)

        try:
            activity = Activity.objects.get(aid=aid)

            # 获取帖子关联的图片数据
            images_data = list(activity.image_set.values('image', 'description', 'upload_time'))
            # 处理每个图片的路径，在路径前添加特定的字符串
            for image_data in images_data:
                image_data['image'] = "http://localhost:8000/" + image_data['image']  # 在图片路径前添加 "http://"

            # 构造返回给客户端的数据
            response_data = {
                'status': 'success',
                'aid': activity.aid,
                'content': activity.content,
                'time': activity.time,
                'number': activity.number,
                'contact_info': activity.contact_info,
                'user': {
                    'uid': activity.user.uid,
                    'username': activity.user.username,
                    'pic': 'http://localhost:8000' + activity.user.pic.url if activity.user.pic else None
                },
                'images': images_data,
            }
            return JsonResponse(response_data, status=200)
        except Activity.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': '内容不存在'}, status=404)
    else:
        return JsonResponse({'status': 'error', 'message': 'Method not allowed'}, status=405)


def add_view(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        # print(data)
        content = data.get('content')
        type = data.get('a_type')
        images_base64 = data.get('images', [])
        contact = data.get('contact_info')
        print("contact_info: ", contact)
        # print(images_base64)

        # 获取用户信息
        user_data = parse_jwt_token(request)
        if not user_data:
            return JsonResponse({'status': 'error', 'message': '用户未登录'}, status=401)

        try:
            # 查询获取当前用户对象
            current_user = UserInfo.objects.get(pk=user_data['uid'])

            # 创建帖子对象并保存基本信息
            new_activity = Activity(content=content, contact_info=contact, user=current_user, type=type)
            new_activity.save()

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
                image_filename = f"{new_activity.aid}_{current_user.uid}_{datetime.now().strftime('%Y%m%d%H%M%S%f')}.jpg"
                # 创建 Images 对象并将图片数据保存为文件
                image_instance = Images.objects.create(description=f'image_{idx}', activity=new_activity)
                image_instance.image.save(image_filename, ContentFile(image_data), save=True)

            # 返回添加成功的响应
            return JsonResponse({'status': 'success', 'message': '活动添加成功'}, status=200)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)
    else:
        return JsonResponse({'status': 'error', 'message': 'Method not allowed'}, status=405)


def get_activity_discuss(request):
    if request.method == 'POST':
        # 从请求中获取 pid 参数
        data = json.loads(request.body)
        aid = data.get('aid')

        try:
            # 查询获取指定 pid 的帖子
            activity = Activity.objects.get(aid=aid)
        except Activity.DoesNotExist:
            # 如果帖子不存在，返回错误响应
            return JsonResponse({'status': 'error', 'message': '帖子不存在'}, status=404)

        # 查询获取该帖子的评论数据
        discuss = Discuss.objects.filter(activity=activity)

        # 构造评论数据的返回形式
        data = []
        for dis in discuss:
            dis_data = {
                'user': {
                    'uid': dis.user.uid,
                    'pic': "http://localhost:8000" + dis.user.pic.url if dis.user.pic else None,
                    'name': dis.user.username
                },
                'time': dis.created_at,
                'content': dis.content
            }
            data.append(dis_data)

        # 返回 JSON 响应
        return JsonResponse({'status': 'success', 'data': data}, status=200)
    else:
        # 如果不是 POST 请求，返回错误响应
        return JsonResponse({'status': 'error', 'message': 'Method not allowed'}, status=405)


# 添加评论
def add_discuss(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        aid = data.get('aid')
        content = data.get('content')
        user_data = parse_jwt_token(request)
        print(user_data)
        uid = None
        if user_data:
            uid = user_data['uid']
        else:
            return JsonResponse({'status': 'error', 'message': '没有Token'}, status=401)

        try:
            # 查询获取对应的帖子和用户
            activity = Activity.objects.get(aid=aid)
            user = UserInfo.objects.get(uid=uid)

        except (Activity.DoesNotExist, UserInfo.DoesNotExist):
            # 如果帖子或用户不存在，返回错误响应
            return JsonResponse({'status': 'error', 'message': '帖子或用户不存在'}, status=404)

            # 创建评论对象并保存到数据库中
        discuss = Discuss.objects.create(activity=activity, user=user, content=content)

        # 构造成功的响应
        response_data = {
            'status': 'success',
            'message': '评论添加成功',
            'discuss_id': discuss.id
        }
        return JsonResponse(response_data, status=201)

    else:
        # 如果不是 POST 请求，返回错误响应
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


def user_activity_view(request):
    if request.method == 'POST':
        # 获取用户信息
        user_data = parse_jwt_token(request)
        if user_data:
            uid = user_data['uid']
            username = user_data['username']
            # 查询指定用户的所有帖子数据
            user_activity = Activity.objects.filter(user_id=uid)
            # 创建一个空列表，用于存储每个帖子的数据
            data = []
            # 遍历用户的每个帖子，获取帖子及其关联数据，并添加到 posts_data 列表中
            for activity in user_activity:
                # 获取帖子数据
                activity_data = {
                    'aid': activity.aid,
                    'content': activity.content,
                    'time': activity.time,
                }
                # 获取帖子关联的第一个图片数据
                images = activity.image_set.filter().first()  # 获取查询集合中的第一个图片对象
                print("images", images)
                if images:
                    # 如果有第一个图片数据，则设置帖子数据中的图片字段
                    image_data = {
                        'image': "http://localhost:8000/" + str(images.image),
                        'description': images.description,
                        'upload_time': images.upload_time
                    }
                    activity_data['image'] = image_data

                # 将帖子数据添加到 data 列表中
                data.append(activity_data)
            # 返回 JSON 响应
            return JsonResponse({'status': 'success', 'data': data}, status=200)
        else:
            return JsonResponse({'status': 'error', 'message': '用户未登录'}, status=401)
    else:
        return JsonResponse({'status': 'error', 'message': 'Method not allowed'}, status=405)


def delete_activity_by_aid(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        # 获取 pid 参数
        aid = data.get('aid')

        user_data = parse_jwt_token(request)
        uid = user_data.get('uid') if user_data else None

        try:
            activity = Activity.objects.get(aid=aid)

            # 只有帖子作者或者管理员才能删除帖子
            if uid == activity.user_id or user_data.get('is_admin'):

                Images.objects.filter(activity=activity).delete()

                # 删除帖子的评论
                Discuss.objects.filter(activity=activity).delete()

                # 删除帖子
                activity.delete()
                # 构造响应数据
                response_data = {
                    'status': 'success',
                    'message': '帖子删除成功'
                }
                return JsonResponse(response_data, status=200)
            else:
                return JsonResponse({'status': 'error', 'message': '没有权限删除该帖子'}, status=403)
        except Activity.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': '帖子不存在'}, status=404)
    else:
        return JsonResponse({'status': 'error', 'message': 'Method not allowed'}, status=405)
