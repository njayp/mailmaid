# run "make gen" first
.PHONY: build
build:
	./find-run.sh main.go "go build -o output/bin/{{DIR}} {{PATH}}"

.PHONY: gen
gen: proto
	go get -u ./...
	go mod tidy
	go generate ./...
	go test -v ./...

# grpc
.PHONY: proto
proto:
	rm -rf ./pkg/grpc/pb
	mkdir -p ./pkg/grpc/pb
	protoc \
    	-I=./proto \
    	--proto_path=./proto \
    	--go_opt=paths=source_relative \
    	--go_out=./pkg/grpc/pb \
    	--go-grpc_opt=paths=source_relative \
    	--go-grpc_out=./pkg/grpc/pb \
    	$(shell find ./proto -iname "*.proto") 2>&1 > /dev/null

REGISTRY=njpowell
.PHONY: image
image:
	docker build -t ${REGISTRY}/mailmaid-bff .