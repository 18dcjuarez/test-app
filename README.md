[![Flutter](https://badgen.net/badge/Flutter/v3.3.9/0e83cd)](https://flutter.dev/docs/development/tools/sdk/releases)
# Mobile App Demo

A new Flutter project developed by David Cruz Juarez.

## Info ##

* [Flutter][1] as mobile development framework
* [MobX][2] as state manager

## Setup ##

For this project the `.env` file is in the repo, it only contains the public API url

Then, for install packages:

```
flutter pub get
```

To start the application in development mode:
```
flutter run
```

Generated files are included, but if you want to re-build them:

```
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

## Contribution guidelines ##

The rules to submit a contribution are:

* Write only on English
* Don't make push on the main branch nor develop
* Do a rebase before merge request
* Request a review before merge
* Limit your text lines to 80 characters or fewer
* Add a break of line on any file
* Make atomic commits
* Create a new branch before uploading any change, using the regex:

```
((feature)|((hot)?fix))\/([a-z]+(-?[a-z0-9]*)*)([a-z0-9])$
```

## Contact ##

[![David Cruz](https://badgen.net/badge/Contact/David%20Cruz/e24329?icon=github&color=black)](https://github.com/18dcjuarez)

## TODO ##

- [ ] Test

## Useful links

* [MobX Docs](https://mobx.netlify.app)

[1]: https://flutter.dev
[2]: https://pub.dev/packages/get