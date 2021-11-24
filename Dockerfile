from nginx:1

copy ./default.conf.template /etc/nginx/conf.d/

ENV SECONDARY_DOMAIN=www2.example.com
ENV PRERENDER_API_KEY=XXXXXX
ENV PRERENDER_HOST=service.prerender.io
ENV PRIMARY_DOMAIN=www.example.com

RUN  [ "/bin/bash", "-c", "envsubst '$SECONDARY_DOMAIN $PRERENDER_API_KEY $PRERENDER_HOST $PRIMARY_DOMAIN' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" ]

EXPOSE 80/tcp
