####################################################################################################
# Big Data Projeto 1 - Analisando a Temperatura Média nas Cidades Brasileiras

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Não use diretórios com espaço no nome
setwd("C:/GitHubProjects/Projects-in-R/02-linguagem-r")
getwd()
dataset_path = "C:/GitHubProjects/Projects-in-R/99-datasets/"

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

# Convertendo as Datas
cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt, format = '%Y-%m-%d')
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)

# Carregando os subsets

# Palmas
plm <- subset(cidadesBrasil, City == 'Palmas')
plm <- subset(plm, Year %in% c(1796,1846,1896,1946,1996,2012))

# Curitiba
crt <- subset(cidadesBrasil, City == 'Curitiba')
crt <- subset(crt, Year %in% c(1796,1846,1896,1946,1996,2012))

# Recife
rcf <- subset(cidadesBrasil, City == 'Recife')
rcf <- subset(rcf, Year %in% c(1796,1846,1896,1946,1996,2012))

# Belo Horizonte
bhz <- subset(cidadesBrasil, City == 'Belo Horizonte')
bhz <- subset(bhz, Year %in% c(1796,1846,1896,1946,1996,2012))

####################################################################################################
# Construindo o Plot de PALMAS
p_plm <- ggplot(plm, aes(x = Month, y = AverageTemperature, color = as.factor(Year))) +
          geom_smooth(se = FALSE, fill = NA, linewidth = 1) +
          theme_light(base_size = 20) +
          xlab("Mês") +
          ylab("Temperatura Média") +
          scale_color_discrete("") +
          ggtitle("Temperatura Média ao longo dos anos em Palmas") +
          theme(plot.title = element_text(size = 18))

# Plotando
p_plm

####################################################################################################
# Construindo o Plot de CURITIBA
p_crt <- ggplot(crt, aes(x = Month, y = AverageTemperature, color = as.factor(Year))) +
          geom_smooth(se = FALSE, fill = NA, linewidth = 1) +
          theme_light(base_size = 20) +
          xlab("Mês") +
          ylab("Temperatura Média") +
          scale_color_discrete("") +
          ggtitle("Temperatura Média ao longo dos anos em Curitiba") +
          theme(plot.title = element_text(size = 18))

# Plotando
p_crt

####################################################################################################
# Construindo o Plot de RECIFE
p_rcf <- ggplot(rcf, aes(x = Month, y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, linewidth = 1) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Recife") +
  theme(plot.title = element_text(size = 18))

# Plotando
p_rcf

####################################################################################################
# Construindo o Plot de BELO HORIZONTE
p_bhz <- ggplot(bhz, aes(x = Month, y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, linewidth = 1) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Belo Horizonte") +
  theme(plot.title = element_text(size = 18))

# Plotando
p_bhz

####################################################################################################