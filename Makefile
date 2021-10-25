.PHONY: build clean deploy

build:
	env GOARCH=amd64 GOOS=linux go build -v -ldflags '-d -s -w' -a -tags netgo -installsuffix netgo -o bin/hello hello/main.go
	env GOARCH=amd64 GOOS=linux go build -v -ldflags '-d -s -w' -a -tags netgo -installsuffix netgo -o bin/world world/main.go

clean:
	rm -rf ./bin

deploy: clean build
	sls deploy --verbose
