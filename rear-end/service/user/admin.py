from django.contrib import admin

# Register your models here.
from .models import UserInfo

from post.models import Post
from help.models import Help

admin.site.register(UserInfo)
admin.site.register(Post)
admin.site.register(Help)