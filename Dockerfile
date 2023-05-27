FROM python:3.10

ENV PYTHONUNBUFFERED 1
WORKDIR /code/djangoblog/

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt-get clean && apt-get update
RUN apt-get  install nginx  default-libmysqlclient-dev -y && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
ADD requirements.txt requirements.txt
RUN pip install --upgrade pip   -i https://pypi.tuna.tsinghua.edu.cn/simple && \
        pip install -Ur requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple  && \
        pip install gunicorn[gevent] -i https://pypi.tuna.tsinghua.edu.cn/simple  && \
        pip cache purge
RUN pip install django-simpleui -i https://pypi.tuna.tsinghua.edu.cn/simple
ADD . .
RUN chmod +x /code/djangoblog/bin/docker_start.sh
ENTRYPOINT ["/code/djangoblog/bin/docker_start.sh"]
