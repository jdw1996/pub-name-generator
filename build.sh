#!/usr/bin/env bash

mkdir -p build/
cd src/
dart2js -m main.dart -o ../build/main.js
