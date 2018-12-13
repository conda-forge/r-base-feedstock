# There should only be one library directory for a local conda R installation
stopifnot(length(.libPaths()) == 1)
