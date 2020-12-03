export R=$BUILD_PREFIX/bin/R
export R_ARGS="--library=$PREFIX/lib/R/library --no-test-load"
echo "R_HOME=$PREFIX/lib/R"     > $BUILD_PREFIX/lib/R/etc/Makeconf
cat $PREFIX/lib/R/etc/Makeconf >> $BUILD_PREFIX/lib/R/etc/Makeconf
