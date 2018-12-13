#!/usr/bin/env sh

# restore pre-existing RSTUDIO_WHICH_R
if [[ ! -z ${RSTUDIO_WHICH_R_PREV+x} ]]; then
  export RSTUDIO_WHICH_R="$RSTUDIO_WHICH_R_PREV"
  unset RSTUDIO_WHICH_R_PREV
else
  unset RSTUDIO_WHICH_R
fi

# restore pre-existing R_LIBS_USER
if [[ ! -z ${R_LIBS_USER_PREV+x} ]]; then
  export R_LIBS_USER="$R_LIBS_USER_PREV"
  unset R_LIBS_USER_PREV
fi
