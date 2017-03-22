library(shiny)
library(leaflet)
library(randomForest)

ui <- fluidPage(
    headerPanel('Simulador de valor de Imóveis em Porto Alegre'),
    fluidRow(
        sidebarPanel(width=3,
            ## Input
            # Bairro
            selectInput(inputId = "bairro", label = "Bairro:",
                        choices = c("Aberta dos Morros"="Aberta_dos_Morros",
                                    "Agronomia"="Agronomia",
                                    "Alto Petropolis"="Alto_Petropolis",
                                    "Alto Teresopolis"="Alto_Teresopolis",
                                    "Auxiliadora"="Auxiliadora",
                                    "Azenha"="Azenha",
                                    "Bela Vista"="Bela_Vista",
                                    "Boa Vista"="Boa_Vista",
                                    "Bom Fim"="Bom_Fim",
                                    "Bom Jesus"="Bom_Jesus",
                                    "Camaqua"="Camaqua",
                                    "Cavalhada"="Cavalhada",
                                    "Centro"="Centro",
                                    "Chacara das Pedras"="Chacara_das_Pedras",
                                    "Cidade Baixa"="Cidade_Baixa",
                                    "Coronel Aparicio Borges"="Coronel_Aparicio_Borges",
                                    "Cristal"="Cristal",
                                    "Cristo Redentor"="Cristo_Redentor",
                                    "Farrapos"="Farrapos",
                                    "Farroupilha"="Farroupilha",
                                    "Floresta"="Floresta",
                                    "Gloria"="Gloria",
                                    "Guaruja"="Guaruja",
                                    "Higienopolis"="Higienopolis",
                                    "Humaita"="Humaita",
                                    "Independencia"="Independencia",
                                    "Intercap"="Intercap",
                                    "Ipanema"="Ipanema",
                                    "Jardim Botanico"="Jardim_Botanico",
                                    "Jardim Carvalho"="Jardim_Carvalho",
                                    "Jardim do Salso"="Jardim_do_Salso",
                                    "Jardim Europa"="Jardim_Europa",
                                    "Jardim Floresta"="Jardim_Floresta",
                                    "Jardim Ipiranga"="Jardim_Ipiranga",
                                    "Jardim Itu Sabara"="Jardim_Itu_Sabara",
                                    "Jardim Leopoldina"="Jardim_Leopoldina",
                                    "Jardim Lindoia"="Jardim_Lindoia",
                                    "Jardim Planalto"="Jardim_Planalto",
                                    "Jardim Sao Pedro"="Jardim_Sao_Pedro",
                                    "Jardim Ypu"="Jardim_Ypu",
                                    "Lomba do Pinheiro"="Lomba_do_Pinheiro",
                                    "Medianeira"="Medianeira",
                                    "Menino Deus"="Menino_Deus",
                                    "Moinhos de Vento"="Moinhos_de_Vento",
                                    "Mont Serrat"="Mont_Serrat",
                                    "Navegantes"="Navegantes",
                                    "Nonoai"="Nonoai",
                                    "Parque dos Maias"="Parque_dos_Maias",
                                    "Partenon"="Partenon",
                                    "Passo D Areia"="Passo_D_Areia",
                                    "Passo das Pedras"="Passo_das_Pedras",
                                    "Petropolis"="Petropolis",
                                    "Praia de Belas"="Praia_de_Belas",
                                    "Protasio Alves"="Protasio_Alves",
                                    "Restinga"="Restinga",
                                    "Rio Branco"="Rio_Branco",
                                    "Rubem Berta"="Rubem_Berta",
                                    "Santa Cecilia"="Santa_Cecilia",
                                    "Santa Fe"="Santa_Fe",
                                    "Santa Maria Goretti"="Santa_Maria_Goretti",
                                    "Santa Tereza"="Santa_Tereza",
                                    "Santana"="Santana",
                                    "Santo Antonio"="Santo_Antonio",
                                    "Sao Geraldo"="Sao_Geraldo",
                                    "Sao Joao"="Sao_Joao",
                                    "Sao Jose"="Sao_Jose",
                                    "Sao Sebastiao"="Sao_Sebastiao",
                                    "Sarandi"="Sarandi",
                                    "Teresopolis"="Teresopolis",
                                    "Tres Figueiras"="Tres_Figueiras",
                                    "Tristeza"="Tristeza",
                                    "Vila Assuncao"="Vila_Assuncao",
                                    "Vila Ipiranga"="Vila_Ipiranga",
                                    "Vila Jardim"="Vila_Jardim",
                                    "Vila Nova"="Vila_Nova")),
            # Área
            sliderInput(inputId = "area", label = "Área privativa (m²):", value = 100,
                         min = 10, max = 550),
            # Dormitórios
            numericInput(inputId = "dormitorios", label = "Dormitórios:", value = NA,
                         min = 0, step = 1, max = 6),
            # Vagas
            numericInput(inputId = "vagas", label = "Vagas na garagem:", value = NA,
                         min = 0, max = 6),
            # Botão para atualizar
            actionButton(inputId = "atualizar", label = "Mapa")
            
        ), # ~sidebarpanel~
    
            mainPanel(
                    column(8,
                        ## Output
                        leafletOutput("mapa")
                        ),
                    column(1,
                           tags$img(src="http://i63.tinypic.com/v3pon6.jpg",
                                    alt="Siqueira Campos Associados")
                           )
            )
        
    ) # ~fluidrow~
    
) # ~fluidpage~

