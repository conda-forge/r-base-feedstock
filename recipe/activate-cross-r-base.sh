if [[ "$CONDA_BUILD_STATE" != "test" && "$build_platform" != "$target_platform" ]]; then
  export R=$BUILD_PREFIX/bin/R
  export R_ARGS="--library=$PREFIX/lib/R/library --no-test-load"
  echo "R_HOME=$PREFIX/lib/R"     > $PREFIX/lib/R/etc/Makeconf
  cat $PREFIX/lib/R/etc/Makeconf >> $PREFIX/lib/R/etc/Makeconf
fi

if [[ "$CONDA_BUILD" == "" ]]; then
  echo "This package can only be used in conda-build"
  exit 1
fi
