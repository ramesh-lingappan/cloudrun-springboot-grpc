# Pass the following environment variables while calling the command \
GCP_PROJECT - the gcp project name \
SERVICE_NAME - the name of the service to be deployed

# build
 .PHONY: build
build:
	@echo "🍳 Building docker image using Cloud build"
	gcloud builds submit --tag gcr.io/$(GCP_PROJECT)/$(SERVICE_NAME):0.1 --project $(GCP_PROJECT)

# deploy the app to firebase
.PHONY: deploy
deploy:
	make build
	@echo "🎁 Deploying to cloud run service - demo-grpc-server"
	gcloud run deploy $(SERVICE_NAME) --image gcr.io/$(GCP_PROJECT)/$(SERVICE_NAME):0.1 \
	--project $(GCP_PROJECT) \
	--platform managed \
	--allow-unauthenticated