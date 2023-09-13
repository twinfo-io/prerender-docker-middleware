# from nginx:1
from nginx:latest

copy ./default.conf.template /etc/nginx/conf.d/
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# RUN  [ "/bin/bash", "-c", "envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" ]

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80/tcp
