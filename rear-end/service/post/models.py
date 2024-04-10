from django.db import models
from user.models import UserInfo


# Create your models here.


class Images(models.Model):
    post = models.ForeignKey('Post', on_delete=models.CASCADE, related_name='image_set')
    image = models.ImageField(upload_to='static/post_img/')  # 存储图片文件
    description = models.TextField(blank=True)  # 图片描述，可以为空
    upload_time = models.DateTimeField(auto_now_add=True)  # 图片上传时间


class Post(models.Model):
    pid = models.AutoField(primary_key=True)
    content = models.TextField()
    time = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE)
    images = models.ManyToManyField(Images, related_name='posts', blank=True)

    def __str__(self):
        return f"{self.pid} - {self.content}"


class Like(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='likes')
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, related_name='liked_posts')
    created_at = models.DateTimeField(auto_now_add=True)


class Collect(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='collects')
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, related_name='collected_posts')
    created_at = models.DateTimeField(auto_now_add=True)


class Comment(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='comments')
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, related_name='comment_posts')
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
