# run "make gen" first
.PHONY: build
build:
	./build.sh

.PHONY: gen
gen: proto
	go get -u ./...
	go mod tidy
	go generate ./...
	go test -v ./...

# grpc
PROTOCIN=./proto
PROTOCOUT=./pkg/grpc/pb
.PHONY: proto
proto:
	rm -rf ${PROTOCOUT}
	mkdir -p ${PROTOCOUT}
	protoc \
    	-I=${PROTOCIN} \
    	--proto_path=${PROTOCIN} \
    	--go_opt=paths=source_relative \
    	--go_out=${PROTOCOUT} \
    	--go-grpc_opt=paths=source_relative \
    	--go-grpc_out=${PROTOCOUT} \
    	$(shell find ${PROTOCIN} -iname "*.proto")

REGISTRY=njpowell
.PHONY: image
image:
	docker build -t ${REGISTRY}/mailmaid-bff .