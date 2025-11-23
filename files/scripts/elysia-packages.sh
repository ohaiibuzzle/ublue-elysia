#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

git clone https://github.com/ElysiaOS/elysiaos-bar.git build/ && cd build/ && make && make install && cd .. && rm -r build
git clone https://github.com/ElysiaOS/elysia-welcome-elysiaos.git build/ && cd build/ && make && make install && cd .. && rm -r build
git clone https://github.com/ElysiaOS/elysia-settings-elysiaos.git build/ && cd build/ && make && make install && cd .. && rm -r build
git clone https://github.com/ElysiaOS/elysia-launcher.git build/ && cd build/ && make && make install && cd .. && rm -r build
git clone https://github.com/ElysiaOS/elysia-downloader.git build/ && cd build/ && make && make install && cd .. && rm -r build
git clone https://github.com/ElysiaOS/signet-workspaces-elysiaos.git build/ && cd build/ && make && make install && cd .. && rm -r build
