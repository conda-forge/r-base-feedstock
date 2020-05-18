print(.libPaths())
os <- .Platform$OS.type
major <- R.version$major
minor <- substr(1, 1, R.version$minor)
platform <- R.version$platform

if (os == "unix" || os == "windows") {
  d <- sprintf("~/R/%s-library/%s.%s", platform, major, minor)
} else if (os == "darwin") {
  d <- sprintf("~/Library/R/%s.%s/library/", major, minor)
}

# There were 3 nested subdirectories added for every OS. Only remove if empty
if (length(dir(d)) == 0) {
  unlink(d)
}
d <- dirname(d)
if (length(dir(d)) == 0) {
  unlink(d)
}
d <- dirname(d)
if (length(dir(d)) == 0) {
  unlink(d)
}
