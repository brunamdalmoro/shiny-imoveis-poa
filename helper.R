## FUNÇÕES:
# -> location(x)
# -> data.prediction(x)
# -> rf(dados, bairro)

# onde x é um vetor de caracteres com nome dos bairros
# onde dados é um data frame que contém:
#  "Area", "Dormitorios", "Vagas" (infos inseridas pelo usuário) e "Valor" = NA
# e bairro é o nome do bairro de Porto Alegre inserido pelo usuário (string)

library(randomForest)

# Retorna dataframe com latitude e longitude dos bairros x
location <- function(x){
    loc <- read.csv("coordenadas_bairros.txt", sep = ",")
    
    data <- subset(loc, as.character(bairro) %in% x)
    
    return(data)
}


# Retorna os dados dos bairros necessários para predição
data.prediction <- function(x){
    dat <- read.csv("Geral.csv", sep = ",", header = T)
    
    data <- subset(dat, as.character(Bairro) %in% x)
    
    return(data)
}


# Random Forest - Resultado da predição
rf <- function(dados, bairro) {
    banco <- data.prediction(bairro)
    banco$Bairro <- as.numeric(banco$Bairro)
    set.seed(1341)
    banco.rf = randomForest(formula=banco$Valor ~ ., data=banco[,-1])
    previsao = predict(banco.rf,dados)
    previsao
}
