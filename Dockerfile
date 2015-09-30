FROM golang:latest

RUN mkdir -p $GOPATH/src/github.com/mesosphere/mesos-dns
RUN go get github.com/kr/godep

COPY . $GOPATH/src/github.com/mesosphere/mesos-dns
WORKDIR $GOPATH/src/github.com/mesosphere/mesos-dns
RUN godep go build
RUN ln -s $GOPATH/src/github.com/mesosphere/mesos-dns/mesos-dns $GOPATH/bin/mesos-dns

ENTRYPOINT ["/go/bin/mesos-dns"]
