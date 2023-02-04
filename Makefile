MAIL_BINARY=mailer-service

## up_build: stops docker-compose (if running), builds all projects and starts docker compose
up_build: build_mail
	@echo "Stopping docker images (if running...)"
	docker-compose down
	@echo "Building (when required) and starting docker images..."
	docker-compose up --build -d
	@echo "Docker images built and started!"

## down: stop docker compose
down:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"

## build_mail: builds the mail binary as a linux executable
build_mail:
	@echo "Building mail binary..."
	env GOOS=linux CGO_ENABLED=0 go build -o ${MAIL_BINARY} ./
	@echo "Done!"