####################################################################################################
# Funcções

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Não use diretórios com espaço no nome
setwd("C:/GitHubProjects/r_language/Projects-in-R/02-linguagem-r")
getwd()

####################################################################################################
# Help
?sample
args(sample)
args(mean)
args(sd)

# Funções Built-in
abs(-43)
sum(c(1:5))
mean(c(1:5))
round(c(1.1:5.8))
rev(c(1:5))
seq(1:5)
sort(rev(c(1:5)))
append(c(1:5), 6)

vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)
vec2

####################################################################################################
