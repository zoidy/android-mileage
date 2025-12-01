# Mileage
Classic Android app to track fuel economy. 

Known issues:
- The three-dot menu button stops working sometimes (restart the app to get it to work again)
- charts don't work. 

## Changes in This Fork
Add a script for setting up the build environment in GitHub Codespaces

## Environment Setup

Create a GitHub Codespace.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/zoidy/android-mileage?quickstart=1)

In the VSCode terminal
```
bash codespaces-setupenv.sh
source ~/.bashrc
```
This will install the necessary dependencies and set up the necessary environment variables. This only needs to be done once.

## Build
```
./gradlew build
```
The apk will be in `./app/build/outputs/apk/release/app-release.apk` which can be downloaded manually from the VSCode Explorer and transferred to the phone.
