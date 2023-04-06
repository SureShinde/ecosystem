ARG PHP_VERSION='8.1'

FROM aartintelligent/ops-php:${PHP_VERSION}

COPY d-entrypoint.sh /d-entrypoint.sh

RUN wget -q https://www.phing.info/get/phing-latest.phar; \
mv phing-latest.phar /usr/bin/phing

RUN set -eux; \
mkdir -p \
/src; \
chmod 777 -R \
/src; \
chmod +x \
/d-entrypoint.sh \
/usr/bin/phing

WORKDIR /src

ENTRYPOINT ["/d-entrypoint.sh"]
