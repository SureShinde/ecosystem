# AArtIntelligent : Docker Ops Phing

@todo description

---

### Usage

```shell
docker build . -t aartintelligent/ops-phing:latest
```

```shell
docker run -it --rm -u $(id -u):$(id -g) -v $(pwd):/src aartintelligent/ops-phing:latest -v
```

```shell
docker run -it --rm -u $(id -u):$(id -g) -v $(pwd):/src aartintelligent/ops-phing:latest --help
```
