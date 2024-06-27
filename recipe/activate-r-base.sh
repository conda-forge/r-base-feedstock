# shellcheck shell=sh

R CMD javareconf > /dev/null 2>&1 || true

# store existing RSTUDIO_WHICH_R
if [ -n "${RSTUDIO_WHICH_R+x}" ]; then
  export RSTUDIO_WHICH_R_PREV="${RSTUDIO_WHICH_R}"
fi
# shellcheck disable=SC2154  # CONDA_PREFIX is always set in this context
export RSTUDIO_WHICH_R="${CONDA_PREFIX}/bin/R"
