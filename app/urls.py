"""app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
# from accounts.views import AccountViewSet, LoginView, LogoutView, RegistrationView

from content.views import PageViewSet, BlockViewSet

from rest_framework import routers
router = routers.DefaultRouter()
# router.register(r'account', AccountViewSet)

router.register(r'page', PageViewSet)
#router.register(r'block', BlockViewSet)

from app.settings import API_PATH

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^' + API_PATH, include(router.urls)),
#     url(r'^' + API_PATH + 'logout$', LogoutView.as_view(), name='logout'),
#     url(r'^' + API_PATH + 'login$', LoginView.as_view(), name='login'),
#     url(r'^' + API_PATH + 'register$', RegistrationView.as_view(), name='register'),
]
