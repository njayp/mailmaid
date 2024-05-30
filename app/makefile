.PHONY: dist
dist:
	npm i
	npm run build

.PHONY: start
start: dist
	npm run dev

REGISTRY=njpowell
.PHONY: image
image:
	docker build -t ${REGISTRY}/mailmaid-app .