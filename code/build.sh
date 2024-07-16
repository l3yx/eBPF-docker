cmake -DCMAKE_EXE_LINKER_FLAGS="-static" -S . -B build
if [ "$1" ];then
    cmake --build build --target $1
else
    cmake --build build --target all
fi
