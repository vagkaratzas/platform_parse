# platform_parse
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
