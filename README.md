# Cloud Run with gRPC using Spring Boot

A Demo Cloud Run gRPC server using Spring Boot based on the Medium article, [Google Cloud Run service with gRPC using Spring Boot]()

## How to use?

### Running the app 

Start the server by running the following command, 
```shell script
./gradlew bootRun
```

### Making a client call, 
If you like to test the grpc service, install the [bloomRPC](https://github.com/uw-labs/bloomrpc) GUI Client,

![grpc_demo](grpc_local_demo.gif)

### Deploying

I have created a small `Makefile` to build the docker image and deploy to cloud run service, simply run the following command,

```makefile
 make deploy GCP_PROJECT=greeting-project SERVICE_NAME=greeting-service 
```

replace `GCP_PROJECT` & `SERVICE_NAME` with your desired project & service name.