IMAGE=mriosalido/k8s-hostpath-provisioner:latest

build:
	CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o hostpath-provisioner .

dep:
	go mod tidy

image:
	docker build -t $(IMAGE) -f Dockerfile.scratch .

docker-image:
	docker build -t $(IMAGE) -f Dockerfile .

image-push:
	docker image push $(IMAGE)

all: dep build

clean:
	rm -rf hostpath-provisioner
