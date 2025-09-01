####################################################################################################
# Trabalhando com R e SQLite

# Configurando o diretório de trabalho
setwd("C:/GitHubProjects/Projects-in-R/05-manipulacao-bd")
getwd()
dataset_path = "C:/GitHubProjects/Projects-in-R/99-datasets/"

####################################################################################################
# Instalar SQLite
install.packages("RSQLite")
library(RSQLite)

# Remover o banco SQLite, caso exista - Não é obrigatório
system("del exemplo.db")    # --> no Windows
# system("rm exemplo.db")   # --> no Mac e Linux

# Criando driver e conexão ao banco de dados
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "exemplo.db")
dbListTables(con)

# Criando uma tabela e carregando com dados do dataset mtcars
dbWriteTable(con, "mtcars", mtcars, row.names = TRUE)

# Listando uma tabela
dbListTables(con)
dbExistsTable(con,"mtcars")
dbExistsTable(con,"mtcars2")
dbListFields(con,"mtcars")

# Lendo o conteúdo da tabela
dbReadTable(con, "mtcars")

# Criando apenas a definição da tabela
dbWriteTable(con, "mtcars2", mtcars[0,], row.names = TRUE)
dbListTables(con)
dbReadTable(con, "mtcars2")

####################################################################################################
# Executando consultas no banco de dados
query = "SELECT row_names FROM mtcars"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados
class(dados)

# Executando consultas no banco de dados
query = "SELECT row_names FROM mtcars"
rs = dbSendQuery(con, query)
while (!dbHasCompleted(rs))
{
  dados = fetch(rs, n = 1)
  print(dados$row_names)
}

# Executando consultas no banco de dados
query = "SELECT disp, hp FROM mtcars WHERE disp > 160"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados

# Executando consultas no banco de dados
query = "SELECT row_names, AVG(hp) FROM mtcars GROUP BY row_names"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados

####################################################################################################
# Criando uma tabela a partir de um arquivo
dbWriteTable(con, "iris", paste(dataset_path, "iris.csv", sep = ""), sep = ",", header = T)
dbListTables(con)
dbReadTable(con, "iris")

# Encerrando a conexão
dbDisconnect(con)

####################################################################################################

# Carregando dados no banco de dados
# http://dados.gov.br/dataset/iq-indice-nacional-de-precos-ao-consumidor-amplo-15-ipca15
# Criando driver e conexão ao banco de dados
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "exemplo.db")

dbWriteTable(con, "indices", paste(dataset_path, "indice.csv", sep = ""), sep = "|", header = T)
dbRemoveTable(con, "indices")

dbWriteTable(con, "indices", paste(dataset_path, "indice.csv", sep = ""), sep = "|", header = T)
dbListTables(con)
dbReadTable(con, "indices")

df <- dbReadTable(con, "indices")
df
str(df)
sapply(df, class)

hist(df$setembro)
df_mean <- unlist(lapply(df[, c(4, 5, 6, 7, 8)], mean))
df_mean

dbDisconnect(con)

####################################################################################################