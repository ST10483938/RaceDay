name: Validate Repository Structure

on:
push:
branches: [ main ]
pull_request:
branches: [ main ]

jobs:
validate:
runs-on: ubuntu-latest
steps:
- name: Checkout repository
uses: actions/checkout@v4

- name: Check /docs folder exists
run: |
if [ ! -d "docs" ]; then
echo "ERROR: docs folder is missing"
exit 1

fi
echo "docs folder found"
