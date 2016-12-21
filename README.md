# Locust Docker
Docker image for the [Locust](http://locust.io/) load testing tool and sample Kubernetes configuration files for distributed deployment.

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

1. Create a ConfigMap containing your locustfile and its dependencies. The command below creates a config map containing files placed in the local directory `locust-tasks`.

	```bash
	kubectl create configmap locust-configmap --from-file=locust-tasks/
	```

2. Edit the deployment configuration files and set environment variables `LOCUST_LOCUSTFILE_PATH` and `LOCUST_TARGET_HOST`

3. Deploy the master and slave deployments

	```bash
    kubectl create -f ./locust-master.yaml
    kubectl create -f ./locust-slave.yaml
    ```

## License

MIT License - see the [LICENSE](LICENSE) file for details
