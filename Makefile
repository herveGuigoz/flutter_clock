.PHONY: setup
setup: ## setup project
	flutter channel stable
	flutter upgrade
	flutter pub get
	cd ios/ && pod install && cd ..

.PHONY: dependencies
dependencies: ## update dependencies
	flutter pub get

.PHONY: clean
clean: ## clear cache
	flutter clean

.PHONY: analyze
analyze: ## run code analyzer
	flutter analyze

.PHONY: format 
format: ## format code
	flutter format lib/

.PHONY: format-analyze
format-analyze: ## run code analyzer && format code
	flutter format --set-exit-if-changed --dry-run lib/
	flutter analyze

.PHONY: generate
generate: ## update generated files
	flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: run-dev
run-dev: ## run app in debug mode
	flutter run --target lib/main.dart

.PHONY: run-prd
run-prd: ## run app in production mode
	flutter run --release --target lib/main.dart

.PHONY: build-android
build-android: ## build android release
	flutter build apk --release --split-per-abi --target lib/main.dart

.PHONY: build-ios
build-ios: ## build ios release
	cd ios/ && pod install && cd ..
	flutter build ios --release --target lib/main.dart

.PHONY: unit-test
unit-test: ## run unit tests
	flutter test

.DEFAULT_GOAL := help
.PHONY: help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
