imports:
	importblocks ./...

run:
	docker compose -p boards -f docker/local.yaml up --build
