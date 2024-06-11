run_compose:
	docker compose up

run_sa_compose:
	docker compose -f sa-compose.yml up

install_sa_backend:
	cp scheduler/bin/sa_backend sa

# --------------
# to run locally
# --------------

install_front:
	cd frontend && npm install 

build_front: install_front
	cd frontend && npm run build

start_front: build_front
	cd frontend && npm run start

start_back:
	cd scheduler && go run cmd/server/*.go