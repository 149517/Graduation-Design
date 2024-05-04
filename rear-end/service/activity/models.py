from django.db import models
from user.models import UserInfo


def default_image_path():
    return 'static/activity_pics/base.jpg'


# Create your models here.
class Images(models.Model):
    activity = models.ForeignKey('Activity', on_delete=models.CASCADE, related_name='image_set')
    image = models.ImageField(upload_to='static/activity_img/', default=default_image_path, blank=True,
                              null=True)  # 存储图片文件
    description = models.TextField(blank=True)  # 图片描述，可以为空
    upload_time = models.DateTimeField(auto_now_add=True)  # 图片上传时间


class Activity(models.Model):
    aid = models.AutoField(primary_key=True)
    content = models.TextField()
    time = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE)
    images = models.ManyToManyField(Images, related_name='helps', blank=True)
    number = models.IntegerField(default=2)
    contact_info = models.TextField(blank=True, default=None)
    TYPE_CHOICES = [
        (0, '活动'),
        (1, '游戏'),
    ]
    type = models.IntegerField(choices=TYPE_CHOICES, default=0)

    def __str__(self):
        return f"{self.aid} - {self.content}"


class Discuss(models.Model):
    activity = models.ForeignKey(Activity, on_delete=models.CASCADE, related_name='discuss')
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, related_name='discuss_activity')
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
