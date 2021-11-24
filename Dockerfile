from nginx:mainline

copy ./default.conf.template /etc/nginx/conf.d/

ENV BACKEND_HOST=www2.example.com
ENV PRERENDER_API_KEY=XXXXXX
ENV PRERENDER_HOST=service.prerender.io
ENV SERVER_NAME=www.example.com

RUN  [ "/bin/bash", "-c", "envsubst '$BACKEND_HOST $PRERENDER_API_KEY $PRERENDER_HOST $SERVER_NAME' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" ]

EXPOSE 80/tcp
