FROM debian:testing
MAINTAINER yus4ku <yus4ku@gmail.com>

# Get packages
RUN apt-get update
RUN apt-get install -y git golang

# Create golang environment
ENV GOPATH /usr/local/src/go
RUN mkdir -p "${GOPATH}"
RUN go get -v github.com/go-martini/martini

# Run httpd
ADD httpd.go /root/httpd.go
EXPOSE 3000
CMD ["go", "run", "/root/httpd.go"]
