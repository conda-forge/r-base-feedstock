#!/usr/bin/env sh
R CMD javareconf > /dev/null 2>&1 || true

# store existing RSTUDIO_WHICH_R
if [[ ! -z ${RSTUDIO_WHICH_R+x} ]]; then
  export RSTUDIO_WHICH_R_PREV="$RSTUDIO_WHICH_R"
fi
export RSTUDIO_WHICH_R="$CONDA_PREFIX/bin/R"

# store existing R_LIBS_USER
if [[ ! -z ${R_LIBS_USER+x} ]]; then
  export R_LIBS_USER_PREV="$R_LIBS_USER"
fi
unset R_LIBS_USER
