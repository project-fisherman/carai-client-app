.PHONY: build_web build_runner

build_runner:
	fvm dart run build_runner build --delete-conflicting-outputs

run: build_runner
	fvm flutter run -d chrome
