#!/bin/bash
set -x

# install cmdline tools - https://gist.github.com/oliverspryn/e4f4fc055def312274c2cf2d14278817
destination="$HOME/android/"
toolsDownloadUrl=$(curl https://developer.android.com/studio | grep -o "https:\/\/dl.google.com\/android\/repository\/commandlinetools\-linux\-[0-9]*_latest\.zip")

# Download and extract the contents
curl --location -o android.zip $toolsDownloadUrl
unzip -q android.zip -d ./android-temp

mkdir -p "$destination/cmdline-tools/latest"
mv ./android-temp/cmdline-tools/* "$destination/cmdline-tools/latest"
rm -rf ./android-temp
rm android.zip

# Use sdkman to install the needed Java version and gradle. Answer y in the interactive prompts to set default
set +x
source sdkman-init.sh
set -x
sdk install java 17.0.17-ms # for sdkm install command
sdk default java 17.0.17-ms
sdk install gradle 7.4.1

# Android SDK env
export ANDROID_HOME=$HOME/android
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$gbin
sdkm="sdkmanager --sdk_root=$ANDROID_HOME"
export ANDROID_SDK_ROOT=$ANDROID_HOME

$sdkm --install 'build-tools;30.0.2' 'platforms;android-30' 'sources;android-30' 'add-ons;addon-google_apis-google-24'

sdk install java 8.0.472-tem # for compiling the apk
sdk default java 8.0.472-tem

# Add env vars to load when codespace is started
cat << 'EOF' >> ~/.bashrc

# Android SDK env
export ANDROID_HOME=$HOME/android
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export ANDROID_SDK_ROOT=$ANDROID_HOME
EOF
