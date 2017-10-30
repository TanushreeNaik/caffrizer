#Library Calls
library(dplyr)
library(tidyr)
library(reshape)

#Use other script to download data into "accidentdata.zip" in current directory
zipfile<-"catalog-wga.zip"

#Read Database
wga_catalog <- read.csv(unz(zipfile, "catalog-wga.csv"))

#Convert to text
wga_catalog$FORM <- as.character(wga_catalog$FORM)
wga_catalog_paintings <- wga_catalog %>% filter(FORM == "painting")
wga_catalog_paintings$FORM <- as.factor(wga_catalog_paintings$FORM)

paintings_by_type <- wga_catalog_paintings %>% select(TYPE) %>% group_by(TYPE) %>% summarize(counts = n())
barplot(paintings_by_type$counts, main = "Types of Paintings", xlab = paintings_by_type$TYPE)

PaintingsType <- table(wga_catalog_paintings$TYPE)
barplot(PaintingsType, main = "Paintings by Type", col = c('red', 'blue', 'green', 'yellow', 'cyan', 'violet', 'orange', 'darkgreen', 'pink', 'maroon'), ylab = "Total Number", xlab = "Category")
#dev.copy(png, 'Paintings_by_Type.png')
#dev.off()
barColors <- c('red', 'blue', 'green', 'yellow', 'cyan', 'violet', 'orange', 'darkgreen', 'pink', 'maroon')
paintings_by_year <- table(wga_catalog_paintings$TIMEFRAME)
head(paintings_by_year)
png('Paintings_by_year.png')
barplot(paintings_by_year, main = "Paintings by Year", las = 2, ylab = "Total Number", col = 'blue', space = 1, cex.axis = 1)
dev.off()

PaintingsType_by_Year <- table(wga_catalog_paintings$TYPE, wga_catalog_paintings$TIMEFRAME)
head(PaintingsType_by_Year)
png('Painting_Types_by_Year', height = 4, width = 6, units = 'in', res = 150)
barplot(PaintingsType_by_Year, main = "Painting types by Year", ylab = "Total Number", col = barColors, las = 2, cex.axis = 0.5, cex.names = 0.5)
legend("topleft", legend = rownames(PaintingsType_by_Year),fill = barColors, cex=0.75)
dev.off()


str(PaintingsType_by_Year)
NormPaintingsTypeByYear <- PaintingsType_by_Year/(colSums(PaintingsType_by_Year)+0.000001)
png('Painting_Types_by_Year_Norm', height = 4, width = 6, units = 'in', res = 150)
barplot(NormPaintingsTypeByYear, main = "Painting types by Year (Normalised)", ylab = "Total Number", col = barColors, las = 2, cex.axis = 0.5, cex.names = 0.5)
legend("topleft", legend = rownames(PaintingsType_by_Year),fill = barColors, cex=0.75)
dev.off()

head(NormPaintingsTypeByYear)
#Examine Colors
landscapes <- wga_catalog_paintings %>% filter(TYPE == "landscape")
num_landscapes = count(landscapes)
landscapes$RGB <- c(rep(0,num_landscapes))

NormPaintingsTypeByYear <- PaintingsType_by_Year/colSums(PaintingsType_by_Year)
head(NormPaintingsTypeByYear)
NormPaintingsTypeByYear <- filter(!is.na(NormPaintingsTypeByYear))

count = 1
num_landscapes <- as.integer(num_landscapes)
landscapes$RGB

for (count in 1:num_landscapes){
  landscapes$RGB[count] = as.integer(runif(1, min=0, max=10))
  webpage_url <- as.character(landscapes$URL[count])
  webpage_url <- gsub("/html/", "/art/", webpage_url)
  image_url<-paste(substr(webpage_url, 1, nchar(webpage_url)-4),'jpg',sep='')
  localfile = paste(as.character(sprintf("./images/%06d",count)),'.jpg', sep='')
  print(count)
  #download.file(url = image_url, destfile = localfile, method = "auto", quiet = FALSE, mode = "wb", cacheOK = TRUE, extra = getOption("download.file.extra"))
}