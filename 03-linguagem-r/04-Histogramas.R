####################################################################################################
# Histogramas

# Configurando o diretório de trabalho
setwd("C:/GitHubProjects/Projects-in-R/03-linguagem-r")
getwd()

####################################################################################################

# Definindo os dados
?cars
View(cars)
dados = cars$speed

# Construindo um histograma
?hist
hist(dados)

# Conforme consta no help, o parâmetro breaks pode ser um dos itens abaixo:
# Um vetor para os pontos de quebra entre as células do histograma
# Uma função para calcular o vetor de breakpoints
# Um único número que representa o número de células para o histograma
# Uma cadeia de caracteres que nomeia um algoritmo para calcular o número de células 
# Uma função para calcular o número de células.
hist(dados, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, breaks = c(0,5,10,20,30), main = "Histogramas das Velocidades")
hist(dados, labels = T, breaks = 10, main = "Histogramas das Velocidades")
hist(dados, labels = T, ylim = c(0,10), breaks = 10, main = "Histogramas das Velocidades")

# Adicionando linhas ao histograma
grafico <- hist(dados, breaks = 10, main = "Histogramas das Velocidades")

xaxis = seq(min(dados), max(dados), length = 10)
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados))
yaxis = yaxis * diff(grafico$mids) * length(dados)

lines(xaxis, yaxis, col = "red")

####################################################################################################