# AArtIntelligent : Docker Ops Composer

@todo description

---

### Usage

```shell
docker build . -t aartintelligent/ops-composer:latest
```

```shell
docker build . -t aartintelligent/ops-composer:8.2 --build-arg 'PHP_VERSION=8.2'
```

```shell
docker build . -t aartintelligent/ops-composer:8.1 --build-arg 'PHP_VERSION=8.1'
```

```shell
docker run -it --rm -u $(id -u):$(id -g) -v $(pwd):/src aartintelligent/ops-composer:latest -v
```

```shell
docker run -it --rm -u $(id -u):$(id -g) -v $(pwd):/src aartintelligent/ops-composer:8.2 -v
```

```shell
docker push aartintelligent/ops-composer:8.1
```

```shell
docker push aartintelligent/ops-composer:8.2
```

```shell
docker push aartintelligent/ops-composer:latest
```
