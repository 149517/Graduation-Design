from django.urls import path

from . import views

urlpatterns = [
    path('all', views.all_view),
    path('by', views.get_help_by_hid),
    path('add_help', views.add_view),
    path('userHelp', views.user_help_view),
    path('changeStatus', views.change_status_view),
]
