# AArtIntelligent : Docker Ops Grunt

@todo description

---

### Usage

```shell
docker build . -t aartintelligent/ops-grunt:latest
```

```shell
docker build . -t aartintelligent/ops-grunt:1.4.3 --build-arg NODE_VERSION=18
```

```shell
docker run -it --rm -u $(id -u):$(id -g) -v $(pwd):/src aartintelligent/ops-grunt:latest -v
```

```shell
docker push aartintelligent/ops-grunt:1.4.3
```

```shell
docker push aartintelligent/ops-grunt:latest
```
