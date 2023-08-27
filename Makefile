PROJECT_NAME=chicago-taxi-service

remove:
	./bin/dev/docker-remove.sh

build:
	docker build --no-cache -t $(PROJECT_NAME):latest .

start:
	./bin/dev/docker-start.sh

server:
	./bin/dev/docker-exec.sh ./bin/dev/webserver-start.sh

notebook:
	./bin/dev/notebook-start.sh

ssh:
	./bin/dev/docker-ssh.sh

stop:
	./bin/dev/docker-stop.sh

test:
	docker run -it --rm $(PROJECT_NAME) bash -c "\
		pytest tests/unit_tests --showlocals  --verbose"

lint:
	docker run -it --rm $(PROJECT_NAME) bash -c "\
		poetry run flake8 --max-line-length=90 src && \
		poetry run black src --line-length=90 && \
		poetry run mypy --config-file pyproject.toml ./src --follow-imports=skip --ignore-missing-imports --disallow-untyped-defs && \
		poetry run pydocstyle"

load-data:
	./bin/dev/docker-exec.sh poetry run python -m entrypoint load_data

train:
	./bin/dev/docker-exec.sh poetry run python -m entrypoint train

eval:
	./bin/dev/docker-exec.sh poetry run python -m entrypoint evaluate