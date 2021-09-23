GO_DOCKER_ENV = CGO_ENABLED=0 GOOS=linux GOARCH=amd64
IMAGE_REGISTRY = /mailtokun/yutu-go-example
IMAGE_TAG = $(shell git log -1 --pretty=%h)
clean:
	docker stop yutu-go-example || true
	docker rm yutu-go-example -f || true
build:
	go env -w GO111MODULE=on
	go env -w GOPROXY=https://goproxy.cn,direct
	$(GO_DOCKER_ENV) go build -ldflags "-s -w" -o ./main main.go
	docker build -t $(IMAGE_REGISTRY):$(IMAGE_TAG) .
run: clean
	docker run -d --name=yutu-go-example --restart=always $(IMAGE_REGISTRY):$(IMAGE_TAG) /yutu-go-example/main
