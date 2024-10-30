####################################################################################################
# Exercícios do Capítulo 02

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/GitHubProjects/r_language/Projects-in-R/02-linguagem-r")
getwd()

####################################################################################################

# 01) Pesquise pela função que permita listar todos os arquivos no diretório de trabalho
list.files()

####################################################################################################

# 02) Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
vec_caracter <- c("A", "B", "C", "D")
vec_number <- c(4.5, 3.9, 7.2, 5)
vec_logico <- c(TRUE, TRUE, FALSE, FALSE)
df2 <- data.frame(vec_caracter, vec_number, vec_logico)
df2

####################################################################################################

# 03) Considere o vetor abaixo.
# Crie um loop que verifique se há números maiores que 10 e imprima-o com uma mensagem no console.
vec3 <- c(12,3,4,19,34)
vec3

for (i in 1:length(vec3)) {
  if (vec3[i] > 10) {
    print(vec3[i])
    print('Este elemento do vetor é maior que 10')
  } else {
    print(vec3[i])
    print('Este elemento do vetor é menor que 10')
  }
}

####################################################################################################

# 04) Conisdere a lista abaixo.
# Crie um loop que imprima no console cada elemento da lista.
lst4 <- list(2,3,5,7,11,13)
lst4

for (i in 1:length(lst4)) {
  print(lst4[[i]])
}

####################################################################################################

# 05) Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as matrizes
# https://www.mathwarehouse.com/algebra/matrix/multiply-matrix.php
mat5a <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat5a

mat5b <- t(mat5a)
mat5b

# Multiplicação element-wise
mat5c <- mat5a * mat5b
mat5c

# Multiplicação de matrizes (multiplica primeira linha da mat1 com a primeira coluna de mat2
# Item [1,1] ==> (1 x 1) + (2 x 2) + (3 x 3) x (4 x 4) x (5 x 5) = 55
# Item [2,1] ==> (6 x 1) + (7 x 2) + (8 x 3) x (9 x 4) x (10 x 5) = 130
# Item [3,1] ==> (11 x 1) + (12) x 2) + (13 x 3) x (14 x 4) x (15 x 5) = 205
mat5d <- mat5a %*% mat5b
mat5d

####################################################################################################

# 06) Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos
vec6 <- c(12,3,4,19,34)
names(vec6) <- c('Col1', 'Col2', 'Col3', 'Col4', 'Col5')
vec6

mat6 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
dimnames(mat6) <- (list(c("Obs1","Obs2","Obs3","Obs4","Obs5"), c("Var1","Var2","Var3","Var4","Var5")))
mat6

lst6 <- list(2, 3, c(1,2,3))
names(lst6) <- c('dim1','dim2','dim3')
lst6

df6 <- data.frame(c("A","B","C"), c(4.5,3.9,7.2), c(TRUE,TRUE,FALSE))
colnames(df6) <- c('Caracteres', 'Float', 'Logico')
rownames(df6) <- c("Obs1", "Obs2", "Obs3")
df6

####################################################################################################

# 07) Considere a matriz abaixo.
# Atribua valores NA de forma aletória para 50 elementos da matriz. Dica: use a função sample()
mat7 <- matrix(1:90, 10)
mat7

mat7[sample(1:50, 10)] = NA
mat7

####################################################################################################

# 08) Para a matriz abaixo, calcule a soma por linha e por coluna.
mat8 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat8

rowSums(mat8)
colSums(mat8)

####################################################################################################

# 09) Para o vetor abaixo, ordene os valores em ordem crescente.
vet9 <- c(100, 10, 10000, 1000)
vet9
order(vet9)
vet9[order(vet9)]

####################################################################################################

# 10) Imprima no console todos os elementos da matriz abaixo que forem maiores que 15.
mat10 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat10

for (i in mat10) {
  if (i > 15) {
    print(i)
  }
}

####################################################################################################