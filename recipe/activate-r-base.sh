#!/usr/bin/env sh
R CMD javareconf > /dev/null 2>&1 || true
export RSTUDIO_WHICH_R="$CONDA_PREFIX/bin/R"
