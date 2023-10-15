imports:
	importblocks ./...

run:
	docker compose -p boards-be -f docker/local.yaml up --build
