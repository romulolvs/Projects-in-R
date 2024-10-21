####################################################################################################
# Pacotes e Instalação de Pacotes

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Não use diretórios com espaço no nome
setwd("C:/GitHubProjects/r_language/Projects-in-R/02-linguagem-r")
getwd()

####################################################################################################
# De onde vem as funções? Pacotes (conjuntos de funções)
# Quando você inicia o RStudio, alguns pacotes são carregados por padrão

# Busca os pacotes carregados
search()

# Instala e carrega os pacotes
install.packages(c("ggvis","tm","dplyr"))
library(ggvis)
library(tm)
require(dplyr)

search()
?require
detach(package:dplyr)
search()

####################################################################################################
# Lista o conteúdo dos pacotes
ls(pos = "package:tm")
ls(getNamespace("tm"), all.names = TRUE)

# Lista as funções de um pacote
lsf.str("package:tm")
lsf.str("package:ggplot2")
library(ggplot2)
lsf.str("package:ggplot2")

####################################################################################################
# R possui um conjunto de datasets preinstalados
library(MASS)
data()

?lynx
head(lynx)
head(iris)
tail(lynx)
summary(lynx)

plot(lynx)
hist(lynx)
head(iris)
iris$Sepal.Length
sum(Sepal.Length)

attach(iris)
sum(Sepal.Length)

####################################################################################################