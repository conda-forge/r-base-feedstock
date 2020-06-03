svg(filename="test.svg")
pie( 1:10, labels=paste("label number",1:10))
dev.off()
if (!file.exists("test.svg")) {
    stop("SVG not created!")
}
png(filename="test.png")
pie( 1:10, labels=paste("label number",1:10))
dev.off()
if (!file.exists("test.png")) {
    stop("PNG not created!")
}

