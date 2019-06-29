# Locust Docker
[![](https://images.microbadger.com/badges/image/peterevans/locust.svg)](https://microbadger.com/images/peterevans/locust)
[![CircleCI](https://circleci.com/gh/peter-evans/locust-docker/tree/master.svg?style=svg)](https://circleci.com/gh/peter-evans/locust-docker/tree/master)

Docker image for the [Locust](http://locust.io/) load testing tool and sample Kubernetes configuration files for distributed deployment.

## Supported tags and respective `Dockerfile` links

- [`1.3.0`, `1.3`, `latest`  (*1.3/Dockerfile*)](https://github.com/peter-evans/locust-docker/tree/master)
- [`1.3.0-python2`, `1.3-python2`, `python2`  (*1.3/python2/Dockerfile*)](https://github.com/peter-evans/locust-docker/tree/master/python2)
- [`1.2.3`, `1.2` (*1.2/Dockerfile*)](https://github.com/peter-evans/locust-docker/tree/master/archive/1.2)
- [`1.2.3-python2`, `1.2-python2` (*1.2/python2/Dockerfile*)](https://github.com/peter-evans/locust-docker/tree/master/archive/1.2/python2)
- [`1.1.1`, `1.1` (*1.1/Dockerfile*)](https://github.com/peter-evans/locust-docker/tree/master/archive/1.1)
- [`1.1.1-python2`, `1.1-python2` (*1.1/python2/Dockerfile*)](https://github.com/peter-evans/locust-docker/tree/master/archive/1.1/python2)
- [`1.0.1`, `1.0` (*1.0/Dockerfile*)](https://github.com/peter-evans/locust-docker/tree/master/archive/1.0)

## Usage
The Docker image can be run standalone by passing a URL to your locustfile:

```bash
docker run -d -p 8089:8089 \
-e LOCUST_LOCUSTFILE_URL='https://example.com/locustfile.py' \
-e LOCUST_TARGET_HOST='http://example.com' \
--name locust peterevans/locust:latest
```
Then point your web browser to [http://localhost:8089/](http://localhost:8089/)

## Kubernetes Deployment

1. Create a ConfigMap containing your locustfile.py and its dependencies. The command below creates a ConfigMap containing files placed in the local directory `locust-tasks`.

	```bash
	kubectl create configmap locust-configmap --from-file=locust-tasks/
	```

2. Edit the deployment configuration files and set environment variable `LOCUST_TARGET_HOST`.

3. Deploy the master and slave deployments.

	```bash
    kubectl create -f ./locust-master.yaml
    kubectl create -f ./locust-slave.yaml
    ```

## License

MIT License - see the [LICENSE](LICENSE) file for details
