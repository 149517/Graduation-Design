from django.http import JsonResponse

import jwt
from django.conf import settings
from django.contrib.auth.models import User
import json
from django.core.files.base import ContentFile
import base64
from datetime import datetime

from help.models import Help, Images
from user.models import UserInfo


# Create your views here.

# 获取所有的 post
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

        all_helps = Help.objects.all()
        # 查询所有的帖子数据
        # 创建一个空列表，用于存储求助帖子的数据
        data = []

        # 遍历每个帖子，获取帖子及其关联数据，并添加到 posts_data 列表中
        for help in all_helps:
            # 获取帖子数据
            help_data = {
                'hid': help.hid,
                'content': help.content,
                'time': help.time,
                "status": help.status,
                'user': {
                    'uid': help.user.uid,
                    'username': help.user.username,
                    'pic': "http://localhost:8000" + help.user.pic.url if help.user.pic else None  # 拼接字符串获取用户头像图片路径
                }
            }

            # 获取帖子关联的图片数据
            images_data = list(help.image_set.values('image', 'description', 'upload_time'))
            # 处理每个图片的路径，在路径前添加特定的字符串
            for image_data in images_data:
                image_data['image'] = "http://localhost:8000/" + image_data['image']  # 在图片路径前添加 "http://"

            # 将帖子及其关联数据打包到 post_data 字典中
            help_data['images'] = images_data

            # 将帖子数据添加到 posts_data 列表中
            data.append(help_data)

        # 返回 JSON 响应
        return JsonResponse({'status': 'success', 'data': data}, status=200)
    else:
        return JsonResponse({'status': 'error', 'message': 'Method not allowed'}, status=405)


# 返回单个帖子信息
# @csrf_exempt
def get_post_by_pid(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        # 获取 pid 参数
        pid = data.get('pid')
        user_data = parse_jwt_token(request)
        uid = None
        if user_data:
            uid = user_data['uid']
            username = user_data['username']
            # print(uid, username)

        try:
            post = Post.objects.get(pid=pid)

            # 获取帖子关联的图片数据
            images_data = list(post.image_set.values('image', 'description', 'upload_time'))
            # 处理每个图片的路径，在路径前添加特定的字符串
            for image_data in images_data:
                image_data['image'] = "http://localhost:8000/" + image_data['image']  # 在图片路径前添加 "http://"

            # 统计like表中的数量
            like_count = Like.objects.filter(post=post).count()

            # 统计collect表中的数量
            collect_count = Collect.objects.filter(post=post).count()

            # 查询当前用户在当前帖子中是否有点赞记录
            user_liked = Like.objects.filter(post=post, user_id=uid).exists() if user_data else False

            # 查询当前用户在当前帖子中是否有收藏记录
            user_collected = Collect.objects.filter(post=post, user_id=uid).exists() if user_data else False

            # 获取帖子关联的评论数据
            comments_data = list(post.comments.values('user_id', 'content', 'created_at'))

            # 构造返回给客户端的数据
            response_data = {
                'status': 'success',
                'pid': post.pid,
                'content': post.content,
                'time': post.time,
                'user': {
                    'uid': post.user.uid,
                    'username': post.user.username,
                    'pic': 'http://localhost:8000' + post.user.pic.url if post.user.pic else None
                },
                'images': images_data,
                'likes': like_count,
                'collects': collect_count,
                'liked': user_liked,
                "collected": user_collected,
                'comments': comments_data
            }
            return JsonResponse(response_data, status=200)
        except Post.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': '帖子不存在'}, status=404)
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
