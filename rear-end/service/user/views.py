import base64
import json

from django.contrib.auth.models import User
from django.core.files.base import ContentFile
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate, login, logout
from user.models import UserInfo

# 生成token
import jwt
from datetime import datetime, timedelta
from django.conf import settings


@csrf_exempt
def login_view(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data.get('username')
        password = data.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            # 生成JWT Token
            token = generate_jwt_token(user)
            # 从用户模型中获取pic 信息
            pic_url = user.pic.url if user.pic else None  # 获取用户的图片路径
            if pic_url is not None:
                pic_url = 'http://localhost:8000' + pic_url
            # 构造返回给客户端的数据
            response_data = {
                'status': 'success',
                'message': '登录成功',
                'career': user.career,
                'uid': user.uid,
                'pic': pic_url,
                'url': user.url,
                'name': user.username,
                'Token': token
            }
            return JsonResponse(response_data, status=200)
        else:
            return JsonResponse({'status': 'error', 'message': '用户名或密码不正确'}, status=400)


@csrf_exempt
def register_view(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data.get('username')
        password = data.get('password')
        # 检查用户名是否已经存在
        if UserInfo.objects.filter(username=username).exists():
            return JsonResponse({'status': 'error', 'message': '用户名已经存在'}, status=400)
        else:
            # 创建用户
            UserInfo.objects.create_user(username=username, password=password)
            return JsonResponse({'status': 'success', 'message': '用户创建成功'}, status=200)


# 生产Token
def generate_jwt_token(user):
    # 设置过期时间为12小时
    # expiration_time = datetime.now() + timedelta(hours=12)
    payload = {
        'uid': user.uid,
        'username': user.username,
        # 'exp': expiration_time
    }
    token = jwt.encode(payload, settings.SECRET_KEY, algorithm='HS256')
    return token


def logout_view(request):
    # 如果用户已经通过认证，则执行退出登录操作
    if request.user.is_authenticated:
        # 清除用户的认证会话
        logout(request)
        return JsonResponse({'status': 'success', 'message': '退出登录成功'}, status=200)
    else:
        return JsonResponse({'status': 'error', 'message': '用户未登录'}, status=400)


# 返回所有用户
def user_list_view(request):
    # 获取所有用户
    users = UserInfo.objects.all()
    # 将用户信息序列化为JSON格式
    users_data = [{'id': user.uid, 'username': user.username} for user in users]
    # 返回用户列表
    return JsonResponse({'users': users_data})


def update_user_info(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        account = data.get('data').get('account')
        password = data.get('data').get('password')
        image_data = data.get('data').get('image')  # Assuming image is sent as base64 encoded string
        # print(data)
        print('image_data', image_data)
        user_data = parse_jwt_token(request)

        if not user_data:
            return JsonResponse({'status': 'error', 'message': '没有Token'}, status=401)

        uid = user_data.get('uid')
        if uid or account or password:
            user = UserInfo.objects.get(uid=uid)
            if account:
                user.username = account
            if password:
                user.set_password(password)
            user.save()

            if image_data:
                try:
                    # 解码 Base64 编码的图片数据
                    base64_data = image_data.split(';base64,')[1]
                    image_binary_data = base64.b64decode(base64_data)
                    # 生成图片文件名，格式为 uid_时间戳.jpg
                    image_filename = f"{user.uid}_{datetime.now().strftime('%Y%m%d%H%M%S%f')}.jpg"
                    # 保存图片文件
                    user.pic.save(image_filename, ContentFile(image_binary_data), save=True)
                except Exception as e:
                    return JsonResponse({'status': 'error', 'message': f'图片上传失败: {str(e)}'}, status=400)

            return JsonResponse({'status': 'success', 'message': '用户信息更新成功'})
        else:
            return JsonResponse({'status': 'error', 'message': '缺少必要参数'}, status=400)
    else:
        return JsonResponse({'status': 'error', 'message': '不允许的请求方法'}, status=405)


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
