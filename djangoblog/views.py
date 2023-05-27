import logging
import os
import uuid

from django.conf import settings
from django.views.generic.base import View
from djangoblog.utils import cache, get_blog_setting, get_sha256

logger = logging.getLogger(__name__)

from django.http.response import HttpResponse

class FaviconView(View):
    def get(request):
        path = f"{settings.MEDIA_ROOT}/favicon.ico"
        print(path)
        file_one = open(path, "rb")
        return HttpResponse(file_one.read(), content_type='image/jpg')

