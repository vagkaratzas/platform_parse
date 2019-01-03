# platform_parse

MicroArray Platform Parser (for huge files)

Description:
Parses MicroArray Platform into a matrix of two columns: ID - GeneSymbol

Input Variables:
a. Platform File, tab delimited
b. ID col
c. Gene Symbol col
d. Gene delimiter # if gene column contains more than just Gene Symbol
e. Gene position # position of Gene Symbol after string split by Gene delimiter

Pre checking - do manually:
a. Remove comments
b. Leave headers
c. setwd("...")

Run from console example: 
Rscript platform_parse.R "GSE93606\GPL11532-32230.txt" 1 10 "\s" 3
