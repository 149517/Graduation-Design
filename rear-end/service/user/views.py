import json
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
            # 从用户模型中获取 friends 和 pic 信息
            friends = list(user.friends.all().values())  # 获取用户的所有朋友，转换为字典列表
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
                'friends': friends,
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
    expiration_time = datetime.now() + timedelta(hours=12)
    payload = {
        'uid': user.uid,
        'username': user.username,
        'exp': expiration_time
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
