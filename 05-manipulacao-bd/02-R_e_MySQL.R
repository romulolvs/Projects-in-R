####################################################################################################
# Carregando e Analisando Dados do MySQL com Linguagem R

# Configurando o diretório de trabalho
setwd("C:/GitHubProjects/Projects-in-R/05-manipulacao-bd")
getwd()

####################################################################################################
install.packages('RMySQL')
install.packages("ggplot2")
install.packages("dbplyr")
library(RMySQL)
library(ggplot2)
library(dbplyr)
library(dplyr)

####################################################################################################
# Conexão com o banco de dados
?dbConnect
con = dbConnect(MySQL(), user = "root", password = "", dbname = "titanicDB", host = "localhost")

# Query
qry <- "SELECT pclass, survived, AVG(age) as media_idade FROM titanic WHERE survived = 1 GROUP BY pclass, survived;"
dbGetQuery(con, qry)

# Plot
dados <- dbGetQuery(con, qry)
head(dados)
class(dados)
ggplot(dados, aes(pclass, media_idade)) + geom_bar(stat = "identity")

####################################################################################################
# Conectando no MySQL com dplyr
?src_mysql
con2 <- src_mysql(dbname = "titanicDB", user = "root", password = "", host = "localhost")

# Coletando e agrupando os dados
dados2 <- con2 %>%
  tbl("titanic") %>%
  select(pclass, sex, age, survived, fare) %>%
  filter(survived == 0) %>%
  collect()

head(dados2)

# Manipulando dados
dados3 <- con2 %>%
  tbl("titanic") %>%
  select(pclass, sex, survived) %>%
  group_by(pclass, sex) %>%
  summarise(survival_ratio = avg(survived)) %>%
  collect()

View(dados3)

# Plot
ggplot(dados3, aes(pclass,survival_ratio, color = sex, group = sex)) +
  geom_point(size = 3) + geom_line()

####################################################################################################
# Sumarizando os dados
dados4 <- con2 %>%
  tbl("titanic") %>%
  filter(fare > 150) %>%
  select(pclass, sex, age, fare) %>%
  group_by(pclass,sex) %>% 
  summarise(avg_age = avg(age), avg_fare = avg(fare))

head(dados2)

####################################################################################################