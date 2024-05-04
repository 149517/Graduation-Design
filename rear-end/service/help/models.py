from django.db import models
from user.models import UserInfo


# Create your models here.
class Images(models.Model):
    help = models.ForeignKey('Help', on_delete=models.CASCADE, related_name='image_set')
    image = models.ImageField(upload_to='static/help_img/')  # 存储图片文件
    description = models.TextField(blank=True)  # 图片描述，可以为空
    upload_time = models.DateTimeField(auto_now_add=True)  # 图片上传时间


class Help(models.Model):
    hid = models.AutoField(primary_key=True)
    content = models.TextField()
    time = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE)
    images = models.ManyToManyField(Images, related_name='helps', blank=True)
    STATUS_CHOICES = [
        (-1, '已完成'),
        (0, '进行中'),
        (1, '未完成'),
    ]
    status = models.IntegerField(choices=STATUS_CHOICES, default=1)
    contact_info = models.TextField(blank=True, default=None)

    def __str__(self):
        return f"{self.hid} - {self.content}"
