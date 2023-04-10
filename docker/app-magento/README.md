# AArtIntelligent : Docker App Magento

@todo description

---

### Usage

```shell
docker build . -t aartintelligent/app-magento:latest
```

```shell
docker build . -t aartintelligent/app-magento:2.4
```

```shell
docker run -d --net host --name app-magento aartintelligent/app-magento:latest
```

```shell
docker run -d --net host --name app-magento aartintelligent/app-magento:2.4
```

```shell
docker container logs app-magento
```

```shell
docker exec -it app-magento supervisorctl status
```

```shell
docker exec -it app-magento supervisorctl stop server:server-fpm_00
```

```shell
until docker exec -it app-magento /docker/d-health.sh >/dev/null 2>&1; do (echo >&2 "Waiting..."); sleep 2; done
```

```shell
docker exec -it app-magento supervisorctl start server:server-fpm_00
```

```shell
docker exec -it app-magento bash
```

```shell
docker stop app-magento
```

```shell
docker rm app-magento
```

```shell
docker push aartintelligent/app-magento:2.4
```

```shell
docker push aartintelligent/app-magento:latest
```
