#!/bin/bash

(
    source .env
    SCRIPT_DIR=$(readlink -f $(dirname "$0"))
    
    cmake -S $SCRIPT_DIR/Prerequisite -B $SCRIPT_DIR/build/Prerequisite -DBOOST_VERSION="$BOOST_VERSION"
    cmake --build $SCRIPT_DIR/build/Prerequisite

    cmake -S $SCRIPT_DIR/Compile -B $SCRIPT_DIR/build/Compile -DBOOST_VERSION="$BOOST_VERSION"
    cmake --build $SCRIPT_DIR/build/Compile

    cmake -S $SCRIPT_DIR/Package -B $SCRIPT_DIR/build/Package -DBOOST_VERSION="$BOOST_VERSION" -DPACKAGE_NAME="boost-linux-clang.zip"
    cmake --build $SCRIPT_DIR/build/Package
)
