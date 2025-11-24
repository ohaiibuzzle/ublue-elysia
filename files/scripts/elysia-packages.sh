#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

git clone https://github.com/ElysiaOS/elysiaos-bar.git build/ && \
    cd build/ && \
    make && \
    install -D -m 755 elysiaos-bar /usr/bin && \
    cd .. && \
    rm -r build

git clone https://github.com/ElysiaOS/elysia-welcome-elysiaos.git build/ && \
    cd build/ && \
    make && \
    install -D -m 755 elysia-welcome /usr/bin && \
    cd .. && \
    rm -r build

git clone https://github.com/ElysiaOS/elysia-settings-elysiaos.git build/ && \
    pushd build/ && \
    make && \
    install -D -m 755 elysettings /usr/bin && \
    popd && \
    rm -r build

git clone https://github.com/ElysiaOS/signet-workspaces-elysiaos.git build/ && \
    pushd build/ && \
    make && \
    install -D -m 755 ely-workspace /usr/bin && \
    popd && \
    rm -r build

git clone https://github.com/ElysiaOS/elysia-launcher.git build/ && 
    pushd build/ && 
    make && 
    install -D -m 755 elysia-launcher /usr/bin &&
    install -D -m 755 ely_launcher /usr/bin &&
    popd && 
    rm -r build

git clone https://github.com/ElysiaOS/elysia-downloader.git build/ && \
    pushd build/ && \ 
    ./build.sh && \
    install -D -m 755 build/ElysiaDownloader /usr/bin/ && \
    install -D -m 755 elysia-downloader.desktop /usr/share/applications && \
    popd && \
    rm -r build

# widgets
git clone https://github.com/ElysiaOS/elysiaos-widgets.git build/ && \
pushd build/

# aboutpage
pushd aboutpage/
make && make install
popd

# clock
pushd clock/
./build.sh
install -D -m 755 clock_widget /usr/bin
popd

# visualizer
pushd visualizer/
./build.sh
install -D -m 755 visualizer /usr/bin
install -D -m 755 visualizer_dark /usr/bin
popd

# elysia-widgets
pushd elysia-widgets/
make
install -D -m 755 elysia-widget-client /usr/bin
install -D -m 755 elysia-widget-daemon /usr/bin
popd 

popd
rm -r build/