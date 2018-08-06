set -x

dep ensure && \
go install ./... && \
go test ./... && \
gometalinter.v2 --fast --deadline=300s --vendor --line-length=100 --enable=lll  --enable=gofmt --enable=staticcheck  ./...
