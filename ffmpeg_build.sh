#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd ffmpeg

case $1 in
  armeabi-v7a | armeabi-v7a-neon)
    CPU='cortex-a8'
  ;;
  x86)
    CPU='i686'
  ;;
  x86_64)
    CPU='x86_64'
  ;;
esac

make clean

./configure \
--target-os="$TARGET_OS" \
--cross-prefix="$CROSS_PREFIX" \
--arch="$NDK_ABI" \
--cpu="$CPU" \
--enable-runtime-cpudetect \
--sysroot="$NDK_SYSROOT" \
--enable-pic \
--disable-libx264 \
--disable-libass \
--disable-libfreetype \
--disable-libfribidi \
--disable-libmp3lame \
--disable-fontconfig \
--enable-pthreads \
--disable-debug \
--enable-rdft \
--disable-avdevice \
--disable-swscale \
--disable-ffserver \
--enable-version3 \
--enable-hardcoded-tables \
--disable-ffplay \
--disable-ffprobe \
--enable-gpl \
--enable-yasm \
--disable-doc \
--disable-shared \
--enable-static \
\
--disable-protocols \
--enable-protocol='file,pipe,tcp' \
--disable-demuxers \
--disable-muxers \
--enable-demuxer='aac,aiff,matroska,mp3,ogg,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,wav' \
--enable-muxer='aiff,flac,matroska,matroska_audio,mp3,oga,ogg,opus,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,wav' \
--disable-filters \
--enable-filter='abuffer,abuffersink,acompressor,acontrast,acopy,acrossfade,acrusher,adelay,aecho,aemphasis,aeval,aevalsrc,afade,afftfilt,afir,aformat,agate,aiir,alimiter,allpass,aloop,amerge,amix,anequalizer,anoisesrc,anull,anullsink,anullsrc,apad,aphaser,apulsator,aresample,areverse,asetnsamples,asetrate,ashowinfo,astats,atempo,atrim,bandpass,bandreject,bass,biquad,bs2b,channelmap,channelsplit,chorus,compand,compensationdelay,crossfeed,crystalizer,dcshift,dynaudnorm,earwax,equalizer,extrastereo,firequalizer,flanger,flite,haas,hdcd,headphone,highpass,hilbert,join,ladspa,loudnorm,lowpass,lv2,mcompand,pan,replaygain,resample,rubberband,sidechaincompress,sidechaingate,silencedetect,silenceremove,sine,sofalizer,stereotools,stereowiden,superequalizer,surround,treble,tremolo,vibrato,volume,volumedetect' \
--disable-parsers \
--enable-parser='aac,aac_latm,flac,vorbis' \
--disable-encoders \
--disable-decoders \
--enable-encoder='aac,aac_at,alac,alac_at,flac,libmp3lame,libopus,libshine,libvorbis,opus,pcm_alaw,pcm_alaw_at,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_mulaw_at,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s64be,pcm_s64le,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,wmav1,wmav2' \
--enable-decoder='aac,aac_at,aac_fixed,aac_latm,alac,alac_at,flac,libopus,libvorbis,mp3,mp3_at,mp3adu,mp3adufloat,mp3float,mp3on4,mp3on4float,pcm_alaw,pcm_alaw_at,pcm_f16le,pcm_f24le,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_lxf,pcm_mulaw,pcm_mulaw_at,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s64be,pcm_s64le,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,wmalossless,wmapro,wmav1,wmav2,wmavoice' \
--disable-bsfs \
--disable-indevs \
--disable-outdevs \
--disable-devices \
\
--pkg-config="${2}/ffmpeg-pkg-config" \
--prefix="${2}/build/${1}" \
--extra-cflags="-I${TOOLCHAIN_PREFIX}/include $CFLAGS" \
--extra-ldflags="-L${TOOLCHAIN_PREFIX}/lib $LDFLAGS" \
--extra-libs="-lm" \
--extra-cxxflags="$CXX_FLAGS" || exit 1

make -j${NUMBER_OF_CORES} && make install || exit 1

popd
