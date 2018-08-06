set -x

(make deps || dep ensure) && \
go install ./... && \
go test ./... && \
go vet ./... && \
gosimple ./... && \
find . -type d -not -path '*/vendor*' -not -path '*.git*' -exec gotype -t {} \; && \
gometalinter.v2 --fast --deadline=300s --vendor --line-length=100 --enable=lll  --enable=gofmt --enable=staticcheck  ./...
