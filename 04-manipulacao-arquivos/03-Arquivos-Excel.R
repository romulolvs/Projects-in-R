####################################################################################################
# Manipulação de Arquivos Excel

# Configurando o diretório de trabalho
setwd("C:/GitHubProjects/r_language/Projects-in-R/04-manipulacao-arquivos")
getwd()
dataset_path = "C:/GitHubProjects/r_language/Projects-in-R/99-datasets/"

####################################################################################################

# Para este módulo, é necessário instalar e configurar variáveis de ambiente:
# Java - JDK
# Perl

# ********** Pacotes que requerem Java **********
# XLConnect
# xlsx
# rJava

# ********** Pacotes que requerem Perl **********
# Download: https://www.activestate.com/products/activeperl/
# gdata

# Instalando os pacotes
install.packages('rJava')
install.packages("xlsx")
install.packages("XLConnect")
install.packages("readxl")
install.packages("gdata")

library(rJava)
library(readxl)

####################################################################################################

# Lista as worksheet no arquivo Excel
excel_sheets(paste(dataset_path, "UrbanPop.xlsx", sep = ""))

# Lendo a planilha do Excel
read_excel(paste(dataset_path, "UrbanPop.xlsx", sep = ""))
head(read_excel(paste(dataset_path, "UrbanPop.xlsx", sep = "")))
read_excel(paste(dataset_path, "UrbanPop.xlsx", sep = ""), sheet = "Period2")
read_excel(paste(dataset_path, "UrbanPop.xlsx", sep = ""), sheet = 3)
read_excel(paste(dataset_path, "UrbanPop.xlsx", sep = ""), sheet = 4)

# Importando uma worksheet para um dataframe
df <- read_excel(paste(dataset_path, "UrbanPop.xlsx", sep = ""), sheet = 3)
head(df)

# Importando todas as worksheets
df_todas <- lapply(excel_sheets(paste(dataset_path, "UrbanPop.xlsx", sep = "")),
                   read_excel, path = paste(dataset_path, "UrbanPop.xlsx", sep = ""))
df_todas
class(df_todas)

####################################################################################################

# Pacote XLConnect
detach(package:readxl)
library(XLConnect)

# Namespace
arq1 = XLConnect::loadWorkbook(paste(dataset_path, "UrbanPop.xlsx", sep = ""))
df1 = readWorksheet(arq1, sheet = "Period1", header = TRUE)
df1
class(df1)

# Pacote xlsx
detach(package:XLConnect)
library(xlsx)
?xlsx
?read.xlsx

df2 <- read.xlsx(paste(dataset_path, "UrbanPop.xlsx", sep = ""), sheetIndex = 1)
df2

####################################################################################################

# Pacote gdata
detach(package:xlsx)
library(gdata)

arq1 <- xls2csv(paste(dataset_path, "planilha1.xlsx", sep = ""),
                sheet = 1, na.strings = "EMPTY")
arq1
read.csv(arq1)

####################################################################################################