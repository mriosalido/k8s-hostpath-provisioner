FROM golang:1.16 as builder
WORKDIR /usr/src
COPY . .
RUN make all

FROM debian:buster-slim
COPY --from=builder /usr/src/hostpath-provisioner /usr/local/bin/hostpath-provisioner
CMD ["hostpath-provisioner"]
