####################################################################################################
# Big Data Projeto 1 - Analisando a Temperatura Média nas Cidades Brasileiras

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/GitHubProjects/r_language/Projects-in-R/02-linguagem-r")
getwd()
dataset_path = "C:/GitHubProjects/r_language/Projects-in-R/99-datasets/"

####################################################################################################
# Dataset: Berkeley Earth
# http://berkeleyearth.org/data
# Faça o download do arquivo zip no link abaixo e descompacte em [dataset_path]
# https://drive.google.com/open?id=1nSwP3Y0V7gncbnG_DccNhrTRxmUNqMqa

# Instalando e Carregando Pacotes
install.packages("readr")
install.packages("data.table")
install.packages("dplyr")
install.packages("ggplot2")
library(readr)
library(dplyr)
library(ggplot2)
library(scales)
library(data.table)

####################################################################################################
# Carregando os dados (Usando um timer para comparar o tempo com diferentes funções)

# Usando read.csv2()
system.time(df_teste1 <- read.csv2(paste(dataset_path,"TemperaturasGlobais.csv", sep = "")))

# Usando read.table()
system.time(df_teste2 <- read.table(paste(dataset_path,"TemperaturasGlobais.csv", sep = "")))

# Usando fread()
system.time(df_teste3 <- fread(paste(dataset_path,"TemperaturasGlobais.csv", sep = "")))

# Criando subsets dos dados carregados
cidadesBrasil <- subset(df_teste3, Country == 'Brazil')
cidadesBrasil <- na.omit(cidadesBrasil)
head(cidadesBrasil)
nrow(cidadesBrasil)
dim(cidadesBrasil)

####################################################################################################
# Preparação e Organização



