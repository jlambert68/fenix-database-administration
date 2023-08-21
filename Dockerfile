# Compile stage
FROM golang:1.19 AS build-env

ADD . /dockerdev
WORKDIR /dockerdev

COPY go.* ./
RUN go mod tidy

RUN go build -o /fenixDatabasesAdministration ./src


# Final stage
FROM debian:latest

RUN apt-get update \
 && apt-get install -y --force-yes --no-install-recommends \
      apt-transport-https \
      curl \
      ca-certificates \
 && apt-get clean \
 && apt-get autoremove \
 && rm -rf /var/lib/apt/lists/*

#FROM golang:1.13.8

EXPOSE 6670
#FROM golang:1.13.8
WORKDIR /

#ADD ca-certificates.crt /etc/ssl/certs/

COPY --from=build-env /fenixDatabasesAdministration /
#Add data/ data/

#CMD ["/simpleGrpcServer"]
ENTRYPOINT ["/fenixDatabasesAdministration"]

