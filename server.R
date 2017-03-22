library(shiny)
library(leaflet)
library(randomForest)
source("helper.R")

server <- function(input, output){

    v <- reactiveValues(doPlot = FALSE) #recebe FALSE
    
    observeEvent(input$atualizar, {
        v$doPlot <- input$atualizar
    }) #quando clicado, recebe TRUE
    
    output$mapa <- renderLeaflet({
        dados <- data.frame(Area = input$area, Dormitorios = input$dormitorios,
                            Vagas = input$vagas, Valor = NA)
        
        resultado <- rf(dados, input$bairro)
        
        if (v$doPlot == FALSE) return() #não não clicado, não retorna
        
        isolate({
            
            coordenadas <- location(input$bairro)

            icons <- awesomeIcons(
                icon = 'ion-social-usd',
                iconColor = 'black',
                library = 'ion',
                markerColor = "blue"
            )
            
            leaflet(coordenadas) %>% addTiles() %>% 
                # addProviderTiles(providers$Hydda) %>%
                setView(lat=coordenadas$lat, lng=coordenadas$lng, zoom=11) %>%
                addAwesomeMarkers(lng = ~lng, lat = ~lat,
                                  label = ~paste0(bairro," - R$",round(resultado, digits=2)),
                                  icon=icons)
        })
    })
    
}

