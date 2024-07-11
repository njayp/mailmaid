.PHONY: dist
dist:
	npm i
	npm run build

.PHONY: start
start: dist
	npm run dev

REGISTRY=njpowell
.PHONY: images
images:
	docker build -t ${REGISTRY}/mailmaid-app -f Docker/Dockerfile-app .
	docker build -t ${REGISTRY}/mailmaid-bff -f Docker/Dockerfile-bff .
		
.PHONY: build
build:
	go build -o output/bin/mailmaid cmd/mailmaid/main/main.go

.PHONY: gen
gen:
	go get -u ./...
	go mod tidy
	go generate ./...
	go test -v ./...
