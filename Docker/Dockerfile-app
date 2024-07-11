FROM node:alpine AS build
RUN apk update && \
    apk add --no-cache curl openssl make
WORKDIR /app
COPY . .
RUN npm i
RUN make dist

FROM node:alpine
RUN npm install -g serve
COPY --from=build /app/dist /dist
CMD ["serve", "-s", "-l", "8080", "/dist"]
