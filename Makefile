run_compose:
	docker compose up

install_front:
	cd frontend && npm install 

build_front: install_front
	cd frontend && npm run build

start_front: build_front
	cd frontend && npm run start

start_back:
	cd scheduler && go run cmd/server/*.go