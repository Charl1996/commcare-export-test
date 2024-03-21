#!/bin/bash -i

# Fail on errors.
set -e

# Make sure .bashrc is sourced
. /root/.bashrc

cd /src

# make sure setuptools is installed
if !pip show setuptools &>/dev/null; then
    pip install setuptools
fi

pip install -e .
pip install -r build_exe/requirements.txt

pyinstaller --clean -y --dist ./dist/linux --workpath /tmp *.spec
