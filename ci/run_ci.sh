#!/bin/bash

VENV_DIR="ci_venv"

path=${1:-.}

if [ ! -d $VENV_DIR ]; then
    ./ci/ci_venv.sh
else
    echo ===== USING EXISTING CI_VENV =====
fi

source "$VENV_DIR/bin/activate"

black $path --exclude "ci_venv/"

echo ===== BLACK AUTOFORMATER COMPLETE =====

find $path -name "*.py" -print0 | xargs -0 pylint --disable=

echo ===== PYLINT COMPLETE =====
