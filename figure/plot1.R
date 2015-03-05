plot1 <- function() {

        ## Goal 1: read in the dataset

        # 1.1 identify the household power consumption file to read 
        fileLoc <- 
                "./data/EDA_HH_PowerConsumption/household_power_consumption.txt"
        
        # 1.2 predetermine the types of data in each column 
        #  source: http://www.biostat.jhsph.edu/~rpeng/docs/R-large-tables.html
        tab5rows <- read.table(fileLoc, header = TRUE, sep = ";", nrows = 5)

        # 1.2.5 convert the columns read in as factors into character strings
        #   source: http://stackoverflow.com/questions/2851015/
        #             convert-data-frame-columns-from-factors-to-characters
        i <- sapply(tab5rows, is.factor)
        tab5rows[i] <- lapply(tab5rows[i], as.character)
        classes <- sapply(tab5rows, class)
        
        # 1.3 read in a subset of the file for dates 2007-02-01 and 2007-02-02
        #   source: http://stackoverflow.com/questions/25932628/
        #                       how-to-read-a-subset-of-large-dataset-in-r
        hhPC <- read.table(fileLoc, sep = ";", na.strings = "?", 
                           colClasses = classes, nrow = 2880, 
                           skip = grep("1/2/2007", readLines(fileLoc)))
        
        ## Goal 2: create the histogram plot and save it in a png file
        png("./data/EDA_HH_PowerConsumption/plot1.png")
        hist(hhPC2[ ,3], col = "red", main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)")
        dev.off()
}