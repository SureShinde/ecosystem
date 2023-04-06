# AArtIntelligent : Docker App Symfony

@todo description

---

### Usage

```shell
docker build . -t aartintelligent/app-symfony:latest
```

```shell
docker build . -t aartintelligent/app-symfony:6.2
```

```shell
docker run -d --net host --name app-symfony aartintelligent/app-symfony:latest
```

```shell
docker run -d --net host --name app-symfony aartintelligent/app-symfony:6.2
```

```shell
docker container logs app-symfony
```

```shell
docker exec -it app-symfony supervisorctl status
```

```shell
docker exec -it app-symfony supervisorctl stop server:server-fpm_00
```

```shell
until docker exec -it app-symfony /docker/d-health.sh >/dev/null 2>&1; do (echo >&2 "Waiting..."); sleep 2; done
```

```shell
docker exec -it app-symfony supervisorctl start server:server-fpm_00
```

```shell
docker exec -it app-symfony bash
```

```shell
docker stop app-symfony
```

```shell
docker rm app-symfony
```
