from django.urls import path

from . import views

urlpatterns = [
    path('all', views.all_view),
    path('by', views.get_good_by_gid),
    path('add_goods', views.add_view),
    path('shoppingCart', views.add_shopping_cart_view),
    path('userGoods', views.user_goods_view),
    path('userShoppingCart', views.user_shoppingCart_view),
    path('deleteShopping', views.deleteShopping_view),
    path('deleteGoods', views.deleteGoods_view),
]