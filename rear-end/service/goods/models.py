from django.db import models
from user.models import UserInfo


def default_image_path():
    return 'static/goods_pics/base.jpg'


class ShoppingCart(models.Model):
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE)
    goods = models.ForeignKey('Goods', on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    timestamp = models.DateTimeField(auto_now_add=True)


# Create your models here.
class Images(models.Model):
    goods = models.ForeignKey('Goods', on_delete=models.CASCADE, related_name='image_set')
    image = models.ImageField(upload_to='static/goods_pics/', default=default_image_path, blank=True,
                              null=True)  # 存储图片文件
    description = models.TextField(blank=True)  # 图片描述，可以为空
    upload_time = models.DateTimeField(auto_now_add=True)  # 图片上传时间


class Goods(models.Model):
    gid = models.AutoField(primary_key=True)
    content = models.TextField()
    time = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE)
    images = models.ManyToManyField(Images, related_name='helps', blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    active = models.BooleanField(default=True)
    contact_info = models.TextField(blank=True, default=None)
    def __str__(self):
        return f"{self.gid} - {self.content}"
