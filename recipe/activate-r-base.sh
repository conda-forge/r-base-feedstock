# shellcheck shell=sh

# R CMD javareconf points R at the Java it finds, e.g. a JDK installed after R.
# It takes seconds, so only run it when what it looks at has changed since it
# last ran here: the Java variables, the `java` on the PATH, the JDK macOS
# picks, and R's Makeconf and ldpaths, which reinstalling r-base resets.
# Activation can run under `set -e`, so nothing here may fail: e.g. there's
# often no `java` at all.
# shellcheck disable=SC2154  # CONDA_PREFIX is always set in this context
_r_base_etc="${CONDA_PREFIX}/lib/R/etc"
_r_base_java="$(command -v java 2>/dev/null)" || _r_base_java=""
_r_base_java_key="$(
  printf '%s\n' "${JAVA_HOME:-}" "${JAVA:-}" "${JAVAC:-}" "${JAVAH:-}" "${JAR:-}" "${_r_base_java}"
  if [ -n "${_r_base_java}" ]; then ls -lL "${_r_base_java}" 2>/dev/null || true; fi
  if [ -x /usr/libexec/java_home ]; then /usr/libexec/java_home 2>/dev/null || true; fi
)" || true
_r_base_stamp="${_r_base_etc}/javareconf.stamp"
if [ "$(cat "${_r_base_stamp}" 2>/dev/null)" != "${_r_base_java_key}
$(cat "${_r_base_etc}/Makeconf" "${_r_base_etc}/ldpaths" 2>/dev/null | cksum)" ]; then
  R CMD javareconf > /dev/null 2>&1 || true
  # Written once javareconf is done, as it can change Makeconf and ldpaths.
  # In a read-only environment, javareconf runs on every activation as before.
  if [ -w "${_r_base_etc}" ]; then
    {
      printf '%s\n' "${_r_base_java_key}"
      cat "${_r_base_etc}/Makeconf" "${_r_base_etc}/ldpaths" 2>/dev/null | cksum
    } > "${_r_base_stamp}.$$" 2>/dev/null &&
      mv -f "${_r_base_stamp}.$$" "${_r_base_stamp}" 2>/dev/null || true
    rm -f "${_r_base_stamp}.$$" 2>/dev/null || true
  fi
fi
unset _r_base_etc _r_base_java _r_base_java_key _r_base_stamp

# store existing RSTUDIO_WHICH_R
if [ -n "${RSTUDIO_WHICH_R+x}" ]; then
  export RSTUDIO_WHICH_R_PREV="${RSTUDIO_WHICH_R}"
fi
# shellcheck disable=SC2154  # CONDA_PREFIX is always set in this context
export RSTUDIO_WHICH_R="${CONDA_PREFIX}/bin/R"
