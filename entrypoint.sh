#!/bin/sh

echo "Substuindo as variáveis de ambiente"
envsubst '$SECONDARY_DOMAIN $PRERENDER_API_KEY $PRERENDER_HOST $PRIMARY_DOMAIN' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

echo "Subindo o NGINX"
nginx -g "daemon off;"
