#!/usr/bin/env bash

MAIN_PATH=$(pwd)

export PA_DIR="$HOME/.pa"
export PKG_CONFIG_PATH="$PA_DIR/lib/pkgconfig"
export LD_LIBRARY_PATH="$PA_DIR/lib:/usr/local/lib"

function setup() {
    rm -Rf "$PA_DIR"
    cd setup && git clone https://github.com/PortAudio/portaudio.git ; \
    cd portaudio && ./configure --prefix="$PA_DIR" && make && make install

    go build play_audio.go
    go build record_audio.go
}

# setup

cd $MAIN_PATH

{ ./record_audio teste.aiff & PID=$!; }; sleep 8 && kill $PID

./play_audio teste.aiff
