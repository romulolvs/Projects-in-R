####################################################################################################
# Boxplots

# Configurando o diretório de trabalho
setwd("C:/GitHubProjects/Projects-in-R/03-linguagem-r")
getwd()

####################################################################################################

?boxplot
?sleep

# Permite utilizar as colunas sem especificar o nome do dataset
attach(sleep)
View(sleep)

# Construção do boxplot
sleepboxplot = boxplot(data = sleep, extra ~ group, main = "Duração do Sono",
                       col.main = "red", ylab = "Horas", xlab = "Droga")

# Cálculo da média
medias = by(extra, group, mean)

# Adiciona a média ao gráfico
points(medias, col = "red")

# Boxplot horizontal
horizontalboxplot = boxplot(data = sleep, extra ~ group,
                            ylab = "", xlab = "", horizontal = T)

horizontalboxplot = boxplot(data = sleep, extra ~ group, ylab = "", xlab = "",
                            horizontal = T, col = c("blue","red"))

####################################################################################################