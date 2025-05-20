APP_NAME = ./release/village-craft-server
SRC = ./cmd/main.go

swag:
	swag init -g ./cmd/main.go

build:
	go build -o $(APP_NAME) $(SRC)
	GOOS=windows GOARCH=amd64 go build -o $(APP_NAME).exe $(SRC)
	tar -czvf village-craft-server.tar.gz -C release .

run:
	go run $(SRC)

test:
	go test ./tests/...

clean:
	rm -f $(APP_NAME) $(APP_NAME)
	rm -f $(APP_NAME) $(APP_NAME).exe
	rm -f village-craft-server.tar.gz