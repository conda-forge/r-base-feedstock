#!/usr/bin/env sh
R CMD javareconf > /dev/null 2>&1 || true

# store existing RSTUDIO_WHICH_R
if [[ ! -z ${RSTUDIO_WHICH_R+x} ]]; then
  export RSTUDIO_WHICH_R_PREV="$RSTUDIO_WHICH_R"
fi
export RSTUDIO_WHICH_R="$CONDA_PREFIX/bin/R"

# store existing R_LIBS_USER if the user has not set CONDA_KEEP_R_LIBS_USER
if [[ ! -z ${R_LIBS_USER+x} && -z ${CONDA_KEEP_R_LIBS_USER+x} ]]; then
  export R_LIBS_USER_PREV="$R_LIBS_USER"
fi
unset R_LIBS_USER

# store existing R_LIBS if the user has not set CONDA_KEEP_R_LIBS
if [[ ! -z ${R_LIBS+x} && -z ${CONDA_KEEP_R_LIBS+x} ]]; then
  export R_LIBS_PREV="$R_LIBS"
fi
unset R_LIBS
