#!/bin/bash
: "${PROJECT_NAME:=chicago-taxi-service}"

docker exec -i -t ${PROJECT_NAME} \
  poetry run dotenv run jupyter notebook \
  --ip="0.0.0.0" \
  --port=1346 \
  --allow-root \
  --NotebookApp.token='' \
  --NotebookApp.custom_display_url=http://localhost:1346
