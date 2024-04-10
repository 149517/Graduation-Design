from django.db import models

# Create your models here.
from django.db import models
from django.contrib.auth.models import AbstractUser


def default_avatar_path():
    return 'static/user_pics/base.jpg'


class UserInfo(AbstractUser):
    career = models.CharField(max_length=24, default="学生", blank=True, null=True)
    uid = models.AutoField(primary_key=True)
    pic = models.ImageField(upload_to='static/user_pics/', default=default_avatar_path, blank=True, null=True)
    url = models.URLField(max_length=200, blank=True, null=True)
    name = models.CharField(max_length=30, blank=True, null=True)
    friends = models.ManyToManyField('self', blank=True)

    def __str__(self):
        return self.username
