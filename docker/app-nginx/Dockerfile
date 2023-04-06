FROM aartintelligent/app-base:latest

USER root

ARG NGINX_WORKER_PROCESSES="5"
ARG NGINX_WORKER_CONNECTIONS="1024"
ARG NGINX_CONFIGS="/etc/nginx/conf.d/*.conf"
ARG NGINX_SITE_ENABLED="/etc/nginx/sites-enabled/*.conf"
ARG NGINX_SERVER_NAME="_"
ARG NGINX_PORT_UNSECURE="8080"
ARG NGINX_PORT_SECURE="8443"

ENV \
NGINX_WORKER_PROCESSES="${NGINX_WORKER_PROCESSES}" \
NGINX_WORKER_CONNECTIONS="${NGINX_WORKER_CONNECTIONS}" \
NGINX_CONFIGS="${NGINX_CONFIGS}" \
NGINX_SITE_ENABLED="${NGINX_SITE_ENABLED}" \
NGINX_SERVER_NAME="${NGINX_SERVER_NAME}" \
NGINX_PORT_UNSECURE="${NGINX_PORT_UNSECURE}" \
NGINX_PORT_SECURE="${NGINX_PORT_SECURE}"

RUN set -eux; \
apt-get update; \
apt-get install -y --no-install-recommends \
nginx

RUN set -eux; \
mkdir -p \
/etc/nginx \
/var/log/nginx \
/var/lib/nginx; \
chmod 777 -R \
/etc/nginx \
/var/log/nginx \
/var/lib/nginx; \
chown rootless:rootless \
/etc/nginx \
/var/log/nginx \
/var/lib/nginx; \
rm -rf \
/var/www/* \
/etc/nginx/sites-available/* \
/etc/nginx/sites-enabled/*

COPY --chown=rootless:rootless system /

RUN set -eux; \
echo "/docker/d-bootstrap-nginx.sh" >> /docker/d-bootstrap.list; \
chmod +x /docker/d-bootstrap-nginx.sh

COPY --chown=rootless:rootless src /var/www/

EXPOSE ${NGINX_PORT_UNSECURE} ${NGINX_PORT_SECURE}

USER rootless
