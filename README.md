android-curl
============

Curl compiled with OpenSSL for Android (Supports Android L)

Original project: https://github.com/hiteshsondhi88/android-curl

Supported Architecture
----
* arm
* mipsel
* x86

Instructions
----
* Edit settings.sh and set ANDROID_NDK_ROOT_PATH according to your NDK root path
* Run following commands to compile curl
  1. git submodule update --init
  2. ./android_build.sh
* Find the executable binary in build directory.
* For working example check this repository - https://github.com/hiteshsondhi88/androidcurlsample

License
----
  check files LICENSE.GPLv3 and LICENSE
