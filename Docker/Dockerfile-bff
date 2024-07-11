FROM golang:alpine AS build
RUN apk update && \
    apk add --no-cache curl openssl make bash
WORKDIR /app
COPY . .
RUN make build

FROM alpine
COPY --from=build /app/output/bin /bin