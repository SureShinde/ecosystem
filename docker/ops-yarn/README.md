# AArtIntelligent : Docker Ops Yarn

@todo description

---

### Usage

```shell
docker build . -t aartintelligent/ops-yarn:latest
```

```shell
docker build . -t aartintelligent/ops-yarn:1.22 --build-arg NODE_VERSION=18
```

```shell
docker run -it --rm -u $(id -u):$(id -g) -v $(pwd):/src aartintelligent/ops-yarn:latest -v
```
