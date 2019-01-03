### MicroArray Platform Parser (for huge files) ###
#####
#
# Description:
# Parses MicroArray Platform into a matrix of two columns: ID - GeneSymbol
# 
# Input Variables:
# a. Platform File, tab delimited
# b. ID col
# c. Gene Symbol col
# d. Gene delimiter # if gene column contains more than just Gene Symbol
# e. Gene position # position of Gene Symbol after string split by Gene delimiter
#
# Pre checking - do manually:
# a. Remove comments
# b. Leave headers
# c. setwd("...")
#
### ~ ###

#####
### FUNCTIONS ###
#####
parsePlatform <- function(filename, id_col, gene_col, gene_delim, gene_pos){
  whole_platform <- read.delim(filename, header = TRUE)
  # keep only id and gene columns
  whole_platform <- whole_platform[,c(id_col, gene_col)]
  #output matrix initialization
  platform <- matrix("", nrow = nrow(whole_platform), ncol = 2)
  colnames(platform) <- c("ID", "GeneSymbol")
  # parse id rows
  for (i in 1:nrow(whole_platform)){
    platform[i, 1] <- whole_platform[i, 1] # ID <- ID
    str <- strsplit(as.character(whole_platform[i, 2]), gene_delim)
    if (!is.na(str[[1]][gene_pos])){
      platform[i, 2] <- str[[1]][gene_pos]
    } else platform[i, 2] <- as.character(whole_platform[i, 2])
  }
  return(platform)
}

#####
### MAIN ###
#####

# args
args = commandArgs(trailingOnly = TRUE) # allow use of args
if (length(args) == 0) { # check if minimum number of args
  stop("At least, platform input file needed.", call.=FALSE)
} else if (length(args) == 1) {
  filename <- as.character(args[1]) # "GSE93606/GPL11532-32230.txt"
  id_col <- 1
  gene_col <- 2
  gene_delim <- " "
  gene_pos <- 1
} else if (length(args) == 2) {
  filename <- as.character(args[1])
  id_col <- as.integer(args[2])
  gene_col <- 2
  gene_delim <- " "
  gene_pos <- 1
} else if (length(args) == 3) {
  filename <- as.character(args[1])
  id_col <- as.integer(args[2])
  gene_col <- as.integer(args[3])
  gene_delim <- " "
  gene_pos <- 1
} else if (length(args) == 4) {
  filename <- as.character(args[1])
  id_col <- as.integer(args[2])
  gene_col <- as.integer(args[3])
  gene_delim <- as.character(args[4])
  gene_pos <- 1
} else if (length(args) == 5) {
  filename <- as.character(args[1])
  id_col <- as.integer(args[2])
  gene_col <- as.integer(args[3])
  gene_delim <- as.character(args[4])
  gene_pos <- as.integer(args[5])
}

cat(print(filename))
cat(print(id_col))
cat(print(gene_col))
cat(print(gene_delim))
cat(print(gene_pos))

outfile <- "platform.tsv"
platform <- parsePlatform(filename, id_col, gene_col, gene_delim, gene_pos)
write.table(platform, outfile, quote = FALSE, col.names = TRUE, row.names = FALSE, sep = "\t")

#####
### SCRIPT END ###
