
* FFmpeg for Android compiled without text relocations. 
* For use with [TarsosDSP](https://github.com/JorenSix/TarsosDSP): audio support only.
* Based upon [FFmpeg Android](https://github.com/hiteshsondhi88/ffmpeg-android)

Supported Architecture
----
* armv7
* armv7-neon
* arm64
* x86-64

Instructions
----
* Install Android NDK on linux

  Download [Android NDK](https://developer.android.com/ndk/index.html). I am using Android NDK r10e.

* Clone git repository

  `git clone --recursive https://github.com/koendv/FFmpeg-Audio-Android`
  
* Set environment variable

  `export ANDROID_NDK={Android NDK Base Path}`
  
  Example:
  
  `export ANDROID_NDK=/opt/android-ndk-r10e/`
  
* Run following commands to compile ffmpeg

  `sudo apt-get --quiet --yes install build-essential git autoconf libtool pkg-config gperf gettext yasm python-lxml zip`
  
  `./android_build.sh`
  
* Find the executable binary in build directory. Find a zip of executables for various architectures in the release directory.

* You can also download [prebuilt-binaries](https://github.com/koendv/FFmpeg-Audio-Android/raw/master/release/ffmpeg_android_binary.zip) (Compiled with android-ndk-r10e)

License
----
  See files LICENSE.GPLv3 and LICENSE

