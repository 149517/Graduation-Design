from django.urls import path

from . import views

urlpatterns = [
    path('all', views.all_view),
    path('by', views.get_post_by_pid),
    path('add_post', views.add_view),
    path('like', views.like_post),
    path('collect', views.collect_post),
    path('comment', views.get_post_comments),
    path('add_comment', views.add_comment),
]
