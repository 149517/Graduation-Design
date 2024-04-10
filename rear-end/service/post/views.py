from django.http import JsonResponse

import jwt
from django.conf import settings
from django.contrib.auth.models import User
import json
from django.core.files.base import ContentFile
import base64
from datetime import datetime

from post.models import Post, Images, Like, Collect, Comment
from user.models import UserInfo


# Create your views here.

# 获取所有的 post
def all_view(request):
    if request.method == 'GET':
        # 返回部分帖子，未登录时候
        return None
    if request.method == 'POST':
        # print("aaa")
        # 获取用户信息
        user_data = parse_jwt_token(request)
        uid = None
        if user_data:
            uid = user_data['uid']
            username = user_data['username']
            # print(uid, username)
            # 用户id将用来查询当前用户的交互记录

        all_posts = Post.objects.all()
        # 查询所有的帖子数据
        # 创建一个空列表，用于存储每个帖子的数据
        posts_data = []

        # 遍历每个帖子，获取帖子及其关联数据，并添加到 posts_data 列表中
        for post in all_posts:
            # 获取帖子数据
            post_data = {
                'pid': post.pid,
                'content': post.content,
                'time': post.time,
                'user': {
                    'uid': post.user.uid,
                    'username': post.user.username,
                    'pic': "http://localhost:8000" + post.user.pic.url if post.user.pic else None  # 拼接字符串获取用户头像图片路径
                }
            }

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

            # 将帖子及其关联数据打包到 post_data 字典中
            post_data['images'] = images_data
            post_data['likes'] = like_count
            post_data['collects'] = collect_count
            post_data['liked'] = user_liked
            post_data['collected'] = user_collected

            # 将帖子数据添加到 posts_data 列表中
            posts_data.append(post_data)

        # 返回 JSON 响应
        return JsonResponse({'status': 'success', 'data': posts_data}, status=200)
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


# 添加Post
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
            new_post = Post(content=content, user=current_user)
            new_post.save()

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
                image_filename = f"{new_post.pid}_{current_user.uid}_{datetime.now().strftime('%Y%m%d%H%M%S%f')}.jpg"
                # 创建 Images 对象并将图片数据保存为文件
                image_instance = Images.objects.create(description=f'image_{idx}', post=new_post)
                image_instance.image.save(image_filename, ContentFile(image_data), save=True)

            # 返回添加成功的响应
            return JsonResponse({'status': 'success', 'message': '帖子和图片添加成功'}, status=200)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)
    else:
        return JsonResponse({'status': 'error', 'message': 'Method not allowed'}, status=405)


# 点赞功能
def like_post(request):
    if request.method == "POST":
        data = json.loads(request.body)
        pid = data.get('pid')
        user_data = parse_jwt_token(request)
        print(user_data)
        uid = None
        if user_data:
            uid = user_data['uid']
        else:
            return JsonResponse({'status': 'error', 'message': '没有Token'}, status=401)

        try:
            post = Post.objects.get(pid=pid)
        except Post.DoesNotExist:
            # 帖子不存在，返回错误响应
            return JsonResponse({'status': 'error', 'message': '帖子不存在'}, status=404)

        try:
            like = Like.objects.get(post=post, user_id=uid)
            # 用户已经点赞过，取消点赞
            like.delete()
            liked = False
        except Like.DoesNotExist:
            # 用户未点赞过，进行点赞
            Like.objects.create(post=post, user_id=uid)
            liked = True

        like_count = Like.objects.filter(post=post).count()

        return JsonResponse({'status': 'success', 'data': {'liked': liked, 'like_count': like_count}}, status=200)


# 收藏功能
def collect_post(request):
    if request.method == "POST":
        data = json.loads(request.body)
        pid = data.get('pid')
        user_data = parse_jwt_token(request)
        print(user_data)
        uid = None
        if user_data:
            uid = user_data['uid']
        else:
            return JsonResponse({'status': 'error', 'message': '没有Token'}, status=401)

        try:
            post = Post.objects.get(pid=pid)
        except Post.DoesNotExist:
            # 帖子不存在，返回错误响应
            return JsonResponse({'status': 'error', 'message': '帖子不存在'}, status=404)

        try:
            collect = Collect.objects.get(post=post, user_id=uid)
            # 用户已经点赞过，取消点赞
            collect.delete()
            collected = False
        except Collect.DoesNotExist:
            # 用户未点赞过，进行点赞
            Collect.objects.create(post=post, user_id=uid)
            collected = True

        collect_count = Collect.objects.filter(post=post).count()

        return JsonResponse({'status': 'success', 'data': {'collected': collected, 'collect_count': collect_count}},
                            status=200)


# 查询评论
def get_post_comments(request):
    if request.method == 'POST':
        # 从请求中获取 pid 参数
        data = json.loads(request.body)
        pid = data.get('pid')

        try:
            # 查询获取指定 pid 的帖子
            post = Post.objects.get(pid=pid)
        except Post.DoesNotExist:
            # 如果帖子不存在，返回错误响应
            return JsonResponse({'status': 'error', 'message': '帖子不存在'}, status=404)

        # 查询获取该帖子的评论数据
        comments = Comment.objects.filter(post=post)

        # 构造评论数据的返回形式
        comments_data = []
        for comment in comments:
            comment_data = {
                'user': {
                    'uid': comment.user.uid,
                    'pic': "http://localhost:8000" + comment.user.pic.url if comment.user.pic else None,
                    'name': comment.user.username
                },
                'time': comment.created_at,
                'content': comment.content
            }
            comments_data.append(comment_data)

        # 返回 JSON 响应
        return JsonResponse({'status': 'success', 'data': comments_data}, status=200)
    else:
        # 如果不是 POST 请求，返回错误响应
        return JsonResponse({'status': 'error', 'message': 'Method not allowed'}, status=405)


# 添加评论
def add_comment(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        pid = data.get('pid')
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
            post = Post.objects.get(pid=pid)
            user = UserInfo.objects.get(uid=uid)

        except (Post.DoesNotExist, UserInfo.DoesNotExist):
            # 如果帖子或用户不存在，返回错误响应
            return JsonResponse({'status': 'error', 'message': '帖子或用户不存在'}, status=404)

            # 创建评论对象并保存到数据库中
        comment = Comment.objects.create(post=post, user=user, content=content)

        # 构造成功的响应
        response_data = {
            'status': 'success',
            'message': '评论添加成功',
            'comment_id': comment.id
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
