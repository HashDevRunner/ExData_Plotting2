##Helper functions
##Functions
fileJoin <- function(...) {
  paste(..., sep="/")
}

downloadToDataDir <- function(url, dest) {
  if(!file.exists(dataDir)) { dir.create(dataDir) }
  download.file(url, dest, method="auto")
}

##Constants
dataDir <- "data"
uciHarUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
uciHarZipfile <- fileJoin(dataDir, "exdata-data-NEI_data.zip")

##Main
if (!file.exists(uciHarZipfile)) {
  downloadToDataDir(uciHarUrl, uciHarZipfile)
}
unzip(uciHarZipfile)

require(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
