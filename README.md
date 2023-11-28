# s3cmd non root docker image

This docker image contains the well known [s3cmd](https://s3tools.org/usage) cli to interact with s3 objct storages.
The image is executed as non root which might be useful for restricted environments

# Usage

1. Run an interactive container in your k8s cluster with the following command:

```bash
kubectl -n <namespace> run shell --rm -i --tty --image eddykaya99/s3cmd-non-root:latest -- sh
```

2. Run s3cmd inside the container:

```bash
s3cmd --access_key $ACCESS_KEY \
  --secret_key $SECRET_KEY \
  --host $S3_HOST \
  --host-bucket $BUCKET_NAME:443 \
  la s3://$BUCKET_NAME
```
