include Makefile.variables

prepare: tmp/dev_image_id
tmp/dev_image_id:
	@mkdir -p tmp
	@docker rmi -f ${DEV_IMAGE} > /dev/null 2>&1 || true
	@docker build -t ${DEV_IMAGE} -f Dockerfile.dev .
	@docker inspect -f "{{ .ID }}" ${DEV_IMAGE} > tmp/dev_image_id
clean:
	@rm -rf tmp
format: prepare
	${DOCKRUN} bash ./scripts/format.sh
check: prepare
	${DOCKRUN} bash ./scripts/check.sh
build:
	bash ./scripts/build.sh
test: db_start check create_db
	${DOCKTEST} bash ./scripts/test.sh
db_start: db_stop
	bash ./scripts/db_start.sh
db_stop:
	bash ./scripts/db_stop.sh
create_db:
	@docker exec -i idP-db mysql -uroot -pmyproject123 -e "CREATE DATABASE IF NOT EXISTS myschema;"
help:
	@echo
	@echo 'Usage: make COMMAND'
	@echo
	@echo 'Commands:'
	@echo '  build           		Compile project.'
	@echo '  check           		Run linters.'
	@echo '  format          		Format source code.'
	@echo '  codegen         		Generate code.'
	@echo '  test            		Run test case'
	@echo '  prepare         		build dev container'
	@echo '  clean       			remove dev temp folder'
	@echo