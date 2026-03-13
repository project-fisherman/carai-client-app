.PHONY: build_web build_runner run_web run_android run_ios deploy_web deploy_functions

build_runner:
	fvm dart run build_runner build --delete-conflicting-outputs

run_web: build_runner
	fvm flutter run -d chrome --web-browser-flag "--disable-web-security"

run_android: build_runner
	fvm flutter run -d android --debug

run_ios: build_runner
	fvm flutter run -d ios --debug

deploy_web: build_runner
	fvm flutter build web --release
	firebase deploy --only hosting

deploy_functions:
	cd functions && firebase deploy --only functions


