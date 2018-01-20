To set ANDROID_API_VERSION and NDK_TOOLCHAIN_ABI_VERSION look at the ndk.
e.g. 

user@debian:~/src/FFmpeg-Audio-Android$ ls /opt/android-ndk/platforms/
android-14  android-16  android-18  android-21  android-23  android-26  NOTICE
android-15  android-17  android-19  android-22  android-24  android-27  repo.prop

This means valid values for ANDROID_API_VERSION are 14 up to 27. 
To compile for as compatibility with as many android ABI's as possible, choose the lowest, 14.
ANDROID_API_VERSION=14

user@debian:~/src/FFmpeg-Audio-Android$ ls /opt/android-ndk/toolchains/
aarch64-linux-android-4.9  llvm                        mipsel-linux-android-4.9  x86-4.9
arm-linux-androideabi-4.9  mips64el-linux-android-4.9  renderscript              x86_64-4.9

This means a valid value for NDK_TOOLCHAIN_ABI_VERSION is 4.9.
NDK_TOOLCHAIN_ABI_VERSION=4.8

If compilation runs fine but when linking you get "error: undefined reference to" 
you probably need to add additional libraries to --extra-libs="-lm" in ffmpeg_build.sh
