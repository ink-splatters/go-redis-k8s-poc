
FROM google/golang:stable
# Godep for vendoring
RUN go get github.com/tools/godep
# Recompile the standard library without CGO
RUN CGO_ENABLED=0 go install -a std

MAINTAINER ink.splatters@pm.me
ENV APP_DIR $GOPATH/Users/r2d2/dev/go-redis-k8s-poc
 
# Set the entrypoint 
ENTRYPOINT ["/opt/app/go-redis-k8s-poc"]
ADD . $APP_DIR

# Compile the binary and statically link
RUN mkdir /opt/app
RUN cd $APP_DIR
RUN cd $APP_DIR && CGO_ENABLED=0 godep go build -o /opt/app/go-redis-k8s-poc -ldflags '-d -w -s'

EXPOSE 8080
