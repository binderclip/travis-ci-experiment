#!/usr/bin/env bash

set -e  # 若指令传回值不等于 0，则立即退出 shell


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


export PYTHONPATH="$DIR/..:$PYTHONPATH"
export MY_APP_CONFIG="dev_test_config"


# Clear DB
pipenv run python my_app/tools/drop_database.py

# Init DB
pipenv run python my_app/tools/create_database.py

# Run tests
pipenv run pytest -s tests
