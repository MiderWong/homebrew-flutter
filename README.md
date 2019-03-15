# Flutter

Homebrew shell for Flutter in flutter/flutter github (https://github.com/flutter/flutter)

## Installation:

### ①、Install stable channel:

```shell
$ brew tap MiderWong/flutter
$ brew install flutter
```

### ②、Install devel channel:

```shell
$ brew tap MiderWong/flutter
$ brew install --devel flutter
```

## Upgrade

### ①、Upgrade stable channel:
```shell
$ brew reinstall flutter
```

### ②、Upgrade devel channel:

```shell
$ brew reinstall --devel flutter
```

## Change channel

### ①、Change stable to dev:

```shell
$ brew uninstall --force flutter
$ rm -rf "$(brew --cache)/flutter--git"
$ brew install --devel flutter
```

### ②、Change dev to stable:

```shell
$ brew uninstall --force flutter
$ rm -rf "$(brew --cache)/flutter--git"
$ brew install flutter
```
     
## Uninstallation:

```shell
$ brew uninstall --force flutter
$ rm -rf "$(brew --cache)/flutter--git"
$ brew untap MiderWong/flutter
```

## Post-Installation:

flutter path will be

  `/usr/local/opt/flutter`

dart-sdk path will be

  `/usr/local/opt/flutter/bin/cache/dart-sdk`

If you're located in China, please follow：

  https://github.com/flutter/flutter/wiki/Using-Flutter-in-China

After installed , please set `PUB_HOSTED_URL` & `FLUTTER_STORAGE_BASE_URL`

You may wish to add the flutter-ROOT install location to your PATH:

```shell
$ echo 'export PATH="/usr/local/opt/flutter/bin:$PATH"' >> ~/.zshrc
```

You can use the following command to show flutter version:

```shell
$ flutter --version
```

Run the following command to see if there are any platform dependencies you need to complete the setup:

```shell
$ flutter doctor
```
  
