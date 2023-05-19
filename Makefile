# Concise introduction to GNU Make:
# https://swcarpentry.github.io/make-novice/reference.html
#include .env

# Taken from https://www.client9.com/self-documenting-makefiles/
help : ## Print this help
	@awk -F ':|##' '/^[^\t].+?:.*?##/ {\
		printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
	}' $(MAKEFILE_LIST)
.PHONY : help
.DEFAULT_GOAL := help

setup : ## Set up git handling
	@pre-commit install --hook-type pre-commit --hook-type commit-msg
.PHONY : setup
