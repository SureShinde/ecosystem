# AArtIntelligent : Docker App Base

@todo description

---

### Usage

```shell
docker build . -t aartintelligent/app-base:latest
```

```shell
docker run -d --name app-base aartintelligent/app-base:latest
```

```shell
docker container logs app-base
```

```shell
docker exec -it app-base supervisorctl status
```

```shell
docker exec -it app-base bash
```

```shell
docker stop app-base
```

```shell
docker rm app-base
```

```shell
docker push aartintelligent/app-base:latest
```