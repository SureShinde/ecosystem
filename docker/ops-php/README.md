# AArtIntelligent : Docker Ops PHP

@todo description

---

### Usage

```shell
docker build . -t aartintelligent/ops-php:latest
```

```shell
docker build . -t aartintelligent/ops-php:8.2 --build-arg PHP_VERSION=8.2
```

```shell
docker build . -t aartintelligent/ops-php:8.1 --build-arg PHP_VERSION=8.1
```

```shell
docker run -it --rm -v $(pwd):/src aartintelligent/ops-php:latest -v
```

```shell
docker run -it --rm -v $(pwd):/src aartintelligent/ops-php:8.2 -v
```

```shell
docker run -it --rm -v $(pwd):/src aartintelligent/ops-php:8.1 -v
```

