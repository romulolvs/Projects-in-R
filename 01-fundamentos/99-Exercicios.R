####################################################################################################
# Exercícios do Capítulo 01

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/GitHubProjects/r_language/Projects-in-R/01-fundamentos")
getwd()

####################################################################################################
# Exercício 1 - Crie um vetor com 12 números inteiros
vetor <- c(1:12)
vetor

####################################################################################################
# Exercício 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros
mat <- matrix(c(1:16), nrow = 4, ncol = 4)
mat

####################################################################################################
# Exercício 3 - Crie uma lista unindo o vetor e matriz criados anteriormente
lista <- list(vetor, mat)
lista

####################################################################################################
# Exercício 4 - Imprima na tela o dataframe iris, 
# verifique quantas dimensões existem no dataframe iris, imprima um resumo do dataset
iris
class(iris)
dim(iris)
summary(iris)
str(iris)
View(iris)

####################################################################################################
# Exercício 5 - Crie um plot simples usando as duas primeiras colunas do dataframe iris
plot(iris$Sepal.Length, iris$Sepal.Width)

####################################################################################################
# Exercício 6 - Usando s função subset, crie um novo dataframe com o conjunto de dados do dataframe
# iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a função subset()
?subset
iris1 <- subset(iris, Sepal.Length > 7)
View(iris1)

####################################################################################################
# Exercícios 7 - Crie um dataframe que seja cópia do dataframe iris e usando a função slice(), 
# divida o dataframe em um subset de 15 linhas
# Dica 1: você vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a função slice()
novo_iris <- iris
novo_iris

install.packages("dplyr")
library(dplyr)

slice(novo_iris,1:15)
class(slice(novo_iris,1:15))

####################################################################################################
# Exercícios 8 - Use a função filter no seu novo dataframe criado no item anterior 
# e retorne apenas valores em que Sepal.Length > 6
# Dica: Use o RSiteSearch para aprender como usar a função filter
RSiteSearch('filter')
filter(novo_iris, Sepal.Length > 7)

####################################################################################################