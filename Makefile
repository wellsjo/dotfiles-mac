.DEFAULT_GOAL := help

help: ## Show help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup-interactive: ## Setup development environment interactively
	bash setup

setup: ## Setup development environment
	bash setup --force

.PHONY: help \
	setup-interactive \
	setup
