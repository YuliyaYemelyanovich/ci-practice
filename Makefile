GOCACHE := $(CURDIR)/bin/go-cache

.PHONY: build
build:
	@GOCACHE=$(CURDIR)/bin/go-cache go build -v -o bin/binary ./... 

.PHONY: test
test:
	@go test -v -coverprofile=coverage.out ./...

.PHONY: coverage
coverage:
	@go tool cover -func=coverage.out -o coverage.txt && go tool cover -html=coverage.out -o coverage.html
