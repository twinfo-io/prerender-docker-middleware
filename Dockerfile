# from nginx:1
from nginx:latest

copy ./default.conf.template /etc/nginx/conf.d/

ENV PRERENDER_API_KEY=xxxxxxx
ENV PRERENDER_HOST=service.prerender.io
ENV PRIMARY_DOMAIN=orion.twinfo.io
ENV SECONDARY_DOMAIN=orion2.twinfo.io

RUN  [ "/bin/bash", "-c", "envsubst '$SECONDARY_DOMAIN $PRERENDER_API_KEY $PRERENDER_HOST $PRIMARY_DOMAIN' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" ]

EXPOSE 80/tcp
