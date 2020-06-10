## aws-glue-sparkui-docker
[Link to Docker Image](https://hub.docker.com/repository/docker/jnshubham/glue_sparkui)

This docker image is used to enable the spark history server which in turn will provide access to spark ui for the glue jobs.
This helps in managing and optimizing of glue etl jobs.

You can spin up an EC2 instance and easily view the sparkui for all the glue jobs.

### Build Image Manually
To build the image on your system, follow these steps:
1. Clone the repository to get the latest Dockerfile

```
git clone https://github.com/jnshubham/glue_sparkui_docker.git
```

2. Start Docker

```
system start docker
```

3. Run build command

```
docker build -t jnshubham/glue_sparkui .
```

4. Once the build is successful, run the container using commands in Run section.



### To get the prebuild image directly
Run

```bash
$ docker pull jnshubham/glue_sparkui:latest
```

Check downloaded image by running

```bash
$ docker images
```

### Commands to run the container
To run the container with Access key and secret key

```bash
$ LOG_DIR="s3a://path_to_eventlog/"
$ AWS_ACCESS_KEY_ID="AKIAxxxxxxxxxxxx"
$ AWS_SECRET_ACCESS_KEY="yyyyyyyyyyyyyyy"

$ docker run -itd -e SPARK_HISTORY_OPTS="$SPARK_HISTORY_OPTS -Dspark.history.fs.logDirectory=$LOG_DIR -Dspark.hadoop.fs.s3a.access.key=$AWS_ACCESS_KEY_ID -Dspark.hadoop.fs.s3a.secret.key=$AWS_SECRET_ACCESS_KEY" -p 18080:18080 jnshubham/glue_sparkui
```


To run the container with IAM role configured to your EC2 for accessing s3 bucket

```
$ export LOG_DIR=s3a://bucket_name/logs_path/
$ docker run -itd -e SPARK_HISTORY_OPTS="$SPARK_HISTORY_OPTS -Dspark.history.fs.logDirectory=$LOG_DIR" -p 18080:18080 jnshubham/glue_sparkui
```

To checkout the image visit [Docker page here](https://hub.docker.com/repository/docker/jnshubham/glue_sparkui)

Thanks!
