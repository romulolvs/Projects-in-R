####################################################################################################
# Família Apply - Uma Forma Elegante de Fazer Loops

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Não use diretórios com espaço no nome
setwd("C:/GitHubProjects/r_language/Projects-in-R/02-linguagem-r")
getwd()

####################################################################################################
# apply()  - arrays e matrizes
# tapply() - os vetores podem ser divididos em diferentes subsets
# lapply() - vetores e listas
# sapply() - versão amigável da lapply
# vapply() - similar a sapply, com valor de retorno modificado
# rapply() - similar a lapply()
# eapply() - gera uma lista
# mapply() - similar a sapply, multivariada
# by

# Se você estiver trabalhando com os objetos: 
# list, numeric, character (list/vecor)         => sapply ou lapply
# matrix, data.frame (agregação por coluna)     => by / tapply
# Operações por linha ou operações específicas  => apply

# Usando um Loop
lista1 <- list(a = (1:20), b = (35:67))

# Calculando o total de cada elemento da lista com loop for
valor_a = 0
valor_b = 0

for (i in lista1$a){
  valor_a = valor_a + i
}

for (j in lista1$b){
  valor_b = valor_b + j
}

print(valor_a)
print(valor_b)

####################################################################################################
# Calculando cada elemento da lista com sapply
?sapply
sapply(lista1, sum)

# Aplicando funções com sapply
sapply(lista1, mean)

# apply
x <- matrix(c(20,13,65,32,45,12,76,49,82), nr = 3, byrow = T)
x

apply(x, mean)
apply(x, 1, mean)
apply(x, 2, mean)
apply(x, 1, plot)

resultapply <- apply(x, 1, mean)
resultapply

# Aplicando apply() a um Dataframe
escola <- data.frame(Aluno = c('Bob','Tereza','Marta','Felipe','Zacarias','Elton'),
                     Fisica = c(91,82,75,97,62,74),
                     Matematica = c(99,100,86,92,91,87),
                     Quimica = c(56,72,49,68,59,77))

escola
escola$Matematica

# Calculando a média por aluno
escola$Media = NA
escola

escola$Media = apply(escola[,c(2,3,4)],1,mean)
escola
escola$Media = round(escola$Media)
escola

####################################################################################################
# tapply()
?gl









