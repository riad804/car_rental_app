pub:
	fvm flutter clean && fvm flutter pub get

screen:
	fvm flutter pub global run get_cli:get create page:${name}

locale:
	fvm flutter pub global run get_cli:get generate locales assets/locales

icons:
	fvm dart run flutter_launcher_icons -f flutter_launcher_icons.yaml

builds:
	fvm dart pub run build_runner build --delete-conflicting-outputs

watch:
	fvm flutter packages pub run build_runner watch

splash:
	fvm dart run flutter_native_splash:create

apk:
	fvm flutter clean && fvm flutter build apk --release

PHONY: pub screen locale icons builds watch splash apk