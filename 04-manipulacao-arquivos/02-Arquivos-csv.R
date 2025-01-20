####################################################################################################
# Arquivos TXT

# Configurando o diretório de trabalho
setwd("C:/GitHubProjects/r_language/Projects-in-R/04-manipulacao-arquivos")
getwd()
dataset_path = "C:/GitHubProjects/r_language/Projects-in-R/99-datasets/"

####################################################################################################
# Usando o pacote readr
install.packages("readr")
library(readr)

# Abre o prompt para escolher o arquivo
meu_arquivo <- read.csv(file.choose())

# Importando arquivos
df1 <- read_table(paste(dataset_path, "temperaturas.txt", sep = ""), col_names = c("DAY", "MONTH", "YEAR", "TEMP"))
head(df1)
View(df1)
str(df1)

read_lines(paste(dataset_path, "pedidos.txt", sep = ""), skip = 0, n_max = -1L)
read_file(paste(dataset_path, "pedidos.txt", sep = ""))

####################################################################################################

# Exportando e Importando
write_csv(iris, paste(dataset_path, "iris.csv", sep = ""))
dir(path = dataset_path)

# col_integer(): 
# col_double(): 
# col_logical(): 
# col_character(): 
# col_factor(): 
# col_skip(): 
# col_date() (alias = “D”), col_datetime() (alias = “T”), col_time() (“t”) 

df_iris <- read_csv(paste(dataset_path, "iris.csv", sep = ""), col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

dim(df_iris)
str(df_iris)

####################################################################################################

# Manipulando arquivos csv
df_cad <- read_csv(paste(dataset_path, "cadastro.csv", sep = ""))
View(df_cad)
class(df_cad)

install.packages("dplyr")
library(dplyr)
options(warn = -1)

df_cad <- tbl_df(df_cad)
head(df_cad)
View(df_cad)

write.csv(df_cad, paste(dataset_path, "df_cad_bkp.csv", sep = ""))

####################################################################################################

# Importando vários arquivos simultaneamente
list.files(path = dataset_path)
lista_arquivos <- list.files('C:/GitHubProjects/r_language/Projects-in-R/99-datasets', full.names = TRUE)
class(lista_arquivos)
lista_arquivos

lista_arquivos2 <- lapply(lista_arquivos, read_csv)
class(lista_arquivos2)
View(lista_arquivos2)

# Parsing
parse_date("01/02/15", "%m/%d/%y")
parse_date("01/02/15", "%d/%m/%y")
parse_date("01/02/34", "%y/%m/%d")

locale("en")
locale("fr")
locale("pt")
