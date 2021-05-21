[![CI](https://github.com/solar05/bookshelf/actions/workflows/CI.yml/badge.svg)](https://github.com/solar05/bookshelf/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/solar05/bookshelf/branch/master/graph/badge.svg?token=7FOK6WMN58)](https://codecov.io/gh/solar05/bookshelf)
# Description
An app that saves information about books you like.
## Setup and development
Firstly, setup ruby 2.7.3, after run `bundle`, therefore use `make setup` for setting up migrations and `make run` to start application, then, visit localhost:3000.
For linting and tests runninng use `make lint` and `make test` correspondingly.
## Docker setup
For docker use `make compose-setup`, and after that run `make compose` to start containers. Use `make compose-lint` and `make compose-test` for linting and test execution accordingly. 
