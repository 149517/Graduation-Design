from django.urls import path

from . import views

urlpatterns = [
    path('login', views.login_view),
    path('register', views.register_view),
    path('logout', views.logout_view),
    path('user_list', views.user_list_view),
    path('update_info', views.update_user_info)
]
