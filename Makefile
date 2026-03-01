.PHONY: dev build serve serve-build

dev:
	@./scripts/dev-serve.sh

build:
	@./scripts/build-local.sh

serve: serve-build

serve-build:
	@./scripts/serve-build.sh
