./configure --prefix=${PREFIX}
cd src/nmath
make
cp *.h ${PREFIX}/include
cp *.a ${PREFIX}/lib
cd standalone
make
cp *.so ${PREFIX}/lib
