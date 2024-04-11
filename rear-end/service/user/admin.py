from django.contrib import admin

# Register your models here.
from .models import UserInfo

from post.models import Post
from help.models import Help
from activity.models import Activity
from goods.models import Goods

admin.site.register(UserInfo)
admin.site.register(Post)
admin.site.register(Help)
admin.site.register(Activity)
admin.site.register(Goods)