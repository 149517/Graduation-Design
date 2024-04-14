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
    path('userPost', views.user_posts_view),
    path('userLike', views.user_liked_posts_view),
    path('userCollect', views.user_collected_posts_view),
    path('deletePost', views.delete_post_by_pid),
    path('hot', views.hot_view),
]
