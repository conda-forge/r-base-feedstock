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

d_exists <- dir.exists(d)
if (!d_exists) {
  dir.create(d, recursive = TRUE)
}
