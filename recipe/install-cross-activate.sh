if [[ "${build_platform}" != linux-ppc64le ]] ; then
  shellcheck --shell=sh --severity=style --enable=check-unassigned-uppercase \
    "${RECIPE_DIR}/activate-cross-r-base.sh"
fi
mkdir -p  $PREFIX/etc/conda/activate.d/
cp $RECIPE_DIR/activate-cross-r-base.sh $PREFIX/etc/conda/activate.d/activate-cross-r-base.sh
