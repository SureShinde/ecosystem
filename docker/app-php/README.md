# AArtIntelligent : Docker App PHP

@todo description

---

### Usage

```shell
docker build . -t aartintelligent/app-php:latest
```

```shell
docker build . -t aartintelligent/app-php:8.2 --build-arg 'PHP_VERSION=8.2'
```

```shell
docker build . -t aartintelligent/app-php:8.1 --build-arg 'PHP_VERSION=8.1'
```

```shell
docker run -d --net host --name app-php aartintelligent/app-php:latest
```

```shell
docker run -d --net host --name app-php aartintelligent/app-php:8.2
```

```shell
docker run -d --net host --name app-php aartintelligent/app-php:8.1
```

```shell
docker container logs app-php
```

```shell
docker exec -it app-php supervisorctl status
```

```shell
docker exec -it app-php supervisorctl stop server:server-fpm_00
```

```shell
until docker exec -it app-php /docker/d-health.sh >/dev/null 2>&1; do (echo >&2 "Waiting..."); sleep 2; done
```

```shell
docker exec -it app-php supervisorctl start server:server-fpm_00
```

```shell
docker exec -it app-php bash
```

```shell
docker stop app-php
```

```shell
docker rm app-php
```
