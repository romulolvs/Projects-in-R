####################################################################################################
# Arquivos TXT

# Configurando o diretório de trabalho
setwd("C:/GitHubProjects/r_language/Projects-in-R/04-manipulacao-arquivos")
getwd()
dataset_path = "C:/GitHubProjects/r_language/Projects-in-R/99-datasets/"

####################################################################################################
# Usando as funções base do R
search()

# Importando arquivo com read.table
?read.table

df1 <- read.table(paste(dataset_path, "pedidos.txt", sep = ""))
df1
dim(df1)

df1 <- read.table(paste(dataset_path, "pedidos.txt", sep = ""), header = TRUE, sep = ',')
df1
dim(df1)

df1 <- read.table(paste(dataset_path, "pedidos.txt", sep = ""), header = TRUE, sep = ',',
                  col.names = c("var1", "var2", "var3"))
df1

df1 <- read.table(paste(dataset_path, "pedidos.txt", sep = ""), header = TRUE, sep = ',',
                  col.names = c("var1", "var2", "var3"),
                  na.strings = c('Zico', 'Maradona'))
df1
str(df1)

df1 <- read.table(paste(dataset_path, "pedidos.txt", sep = ""), header = TRUE, sep = ',',
                  col.names = c("var1", "var2", "var3"),
                  na.strings = c('Zico', 'Maradona'),
                  stringsAsFactors = FALSE)
df1
str(df1)

####################################################################################################

# Importando arquivo com read.csv()
df2 <- read.csv(paste(dataset_path, "pedidos.txt", sep = ""))
df2
dim(df2)

df3 <- read.csv2(paste(dataset_path, "pedidos.txt", sep = ""))
df3
dim(df3)

df3 <- read.csv2(paste(dataset_path, "pedidos.txt", sep = ""), sep = ',')
df3
dim(df3)

####################################################################################################

# Importando arquivo com read.delim()
df4 <- read.delim(paste(dataset_path, "pedidos.txt", sep = ""))
df4

df4 <- read.delim(paste(dataset_path, "pedidos.txt", sep = ""), sep = ',')
df4
dim(df4)

####################################################################################################

# Importando / Exportando

write.table(mtcars, file = 'mtcars.txt')
dir()

df_mtcars <- read.table("mtcars.txt")
df_mtcars
dim(df_mtcars)

write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")
list.files()

read.table("mtcars2.txt")
df_mtcars2 <- read.table("mtcars2.txt")
df_mtcars2

df_mtcars2 <- read.table("mtcars2.txt", sep = '|')
df_mtcars2

df_mtcars2 <- read.table("mtcars2.txt", sep = '|', encoding = 'UTF-8')
df_mtcars2

####################################################################################################