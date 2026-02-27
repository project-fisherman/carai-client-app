.PHONY: run build_runner

build_runner:
	fvm dart run build_runner build --delete-conflicting-outputs

run:
	./scripts/run_app.sh
