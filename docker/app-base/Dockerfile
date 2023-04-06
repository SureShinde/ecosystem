FROM debian:stable-slim

ARG UID=1000
ARG GID=1000
ARG GIT_SHA
ARG APP_NAME
ARG APP_VERSION
ARG APP_ENVIRONMENT
ARG APP_SOLUTION
ARG APP_USAGE
ARG APP_URL
ARG APP_NAMESPACE
ARG APP_WORKLOAD
ARG APP_NODE
ARG APP_POD

ENV \
GIT_SHA="${GIT_SHA}" \
APP_NAME="${APP_NAME}" \
APP_VERSION="${APP_VERSION}" \
APP_ENVIRONMENT="${APP_ENVIRONMENT}" \
APP_SOLUTION="${APP_SOLUTION}" \
APP_USAGE="${APP_USAGE}" \
APP_URL="${APP_URL}" \
APP_NAMESPACE="${APP_NAMESPACE}" \
APP_WORKLOAD="${APP_WORKLOAD}" \
APP_NODE="${APP_NODE}" \
APP_POD="${APP_POD}" \
SUPERVISOR_USERNAME="rootless" \
SUPERVISOR_PASSWORD="nopassword" \
SUPERVISOR_LOG_LEVEL="warn" \
SUPERVISOR_LOG_FILE="/dev/stdout" \
SUPERVISOR_INCLUDE_FILES="/etc/supervisor/conf.d/*.conf" \
SSTMP_MAIL_HUB="" \
SSTMP_REWRITE_DOMAIN="" \
SSTMP_HOSTNAME="" \
SSTMP_FROM_LINE_OVERRIDE="" \
SSTMP_ROOT="" \
SSTMP_AUTH_USER="" \
SSTMP_AUTH_PASSWORD="" \
SSTMP_AUTH_METHOD="" \
SSTMP_USE_TLS="" \
SSTMP_START_TLS=""

RUN set -eux; \
apt-get update; \
apt-get install -y --no-install-recommends \
software-properties-common \
apt-transport-https \
apt-utils \
ca-certificates \
lsb-release \
supervisor \
ssmtp \
cron \
systemd \
patch \
unzip \
git \
gnupg \
gnupg1 \
gnupg2 \
wget \
curl

RUN set -eux; \
adduser -h /home/rootless -g "rootless" -D -u ${UID} rootless; \
echo "rootless:${UID}:${GID}" >> /etc/subuid; \
echo "rootless:${UID}:${GID}" >> /etc/subgid; \
echo "rootless:rootless:${UID}:${GID}:/rootless:/usr/bin" >> /etc/passwd; \
echo "rootless::${GID}:rootless" >> /etc/group

COPY --chown=rootless:rootless system /

RUN set -eux; \
mkdir -p \
/etc/supervisor \
/var/pid \
/var/run \
/var/lock \
/var/log \
/var/cache \
/var/lib \
/var/www; \
chmod 777 -R \
/etc/supervisor \
/var/pid \
/var/run \
/var/lock \
/var/log \
/var/cache \
/var/lib \
/var/www; \
chown rootless:rootless \
/etc/supervisor \
/var/pid \
/var/run \
/var/lock \
/var/log \
/var/cache \
/var/lib \
/var/www; \
chmod +x \
/docker/d-bootstrap.sh \
/docker/d-bootstrap-sstmp.sh \
/docker/d-bootstrap-supervisor.sh \
/docker/d-cleanup.sh \
/docker/d-entrypoint.sh \
/docker/d-health.sh \
/docker/d-notify.sh \
/docker/d-start.sh \
/docker/d-stop.sh; \
echo "/docker/d-bootstrap-supervisor.sh" >> /docker/d-bootstrap.list; \
echo "/docker/d-bootstrap-sstmp.sh" >> /docker/d-bootstrap.list; \
echo "/docker/d-bootstrap.sh" >> /docker/d-entrypoint.list; \
echo "/docker/d-cleanup.sh" >> /docker/d-entrypoint.list; \
echo "/docker/d-start.sh" >> /docker/d-entrypoint.list; \
echo "/docker/d-notify.sh" >> /docker/d-entrypoint.list

ENTRYPOINT ["/docker/d-entrypoint.sh"]

WORKDIR /var/www

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
