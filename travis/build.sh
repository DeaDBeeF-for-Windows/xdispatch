case "$TRAVIS_OS_NAME" in
    windows)
        git submodule update
        mkdir bb
        $mingw64 cmake -G "MSYS Makefiles" -B bb/ -D CMAKE_C_COMPILER=clang -D CMAKE_CXX_COMPILER=clang++ || exit 1
        $mingw64 make -C bb/
        mkdir -p xdispatch_ddb/lib
        cp -v bb/bin/* xdispatch_ddb/lib
        cp -rv libdispatch/include xdispatch_ddb/
        $msys2 zip -q -r ddb-xdispatch-win-latest.zip xdispatch_ddb/
    ;;
esac
