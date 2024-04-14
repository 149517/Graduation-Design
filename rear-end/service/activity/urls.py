from django.urls import path

from . import views

urlpatterns = [
    path('all', views.all_view),
    path('by', views.get_activity_by_aid),
    path('add_activity', views.add_view),
    path('discuss', views.get_activity_discuss),
    path('add_discuss', views.add_discuss),
    path('userActivity', views.user_activity_view),
    path('deleteActivity', views.delete_activity_by_aid),
]
