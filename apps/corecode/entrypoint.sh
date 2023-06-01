#!/bin/bash
# pipenv shell
pipenv run python3 /apps/manage.py migrate
pipenv run python3 /apps/manage.py runserver 0.0.0.0:8000
exec "$@