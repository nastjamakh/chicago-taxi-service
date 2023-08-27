#!/bin/bash
API_KEY=foo PYTHONPATH=${PWD}/src uvicorn api:app --reload --port 8030 --host 0.0.0.0
