export PKG_CONFIG_PATH=${BUILD_PREFIX}/lib/pkgconfig
./configure --prefix=${PREFIX} --without-readline --without-tcltk --without-cairo --without-libpng --without-jpeglib --without-libtiff --without-x --without-libdeflate-compression --disable-R-profiling --disable-memory-profiling --disable-nls --without-ICU
cd src/nmath
make
cp *.h ${PREFIX}/include
cp *.a ${PREFIX}/lib
cd standalone
make
cp *.so ${PREFIX}/lib
