library("shiny")
library("ggplot2")

cities <- c("Stockholm", "Gothenburg", "Karlskrona", "Malmo", "Linkoping", "Hamburg", "Berlin", "Cologne", "Leipzig", "Paris", "Copenhagen", "Zurich", "Helsinki", "Oslo")
coord <- c("59.3294,18.0686", "57.6717,11.9810", "56.1611,15.5881", "55.5932,13.0214", "58.4094,15.6257", "53.5500,10.0000", "52.5167,13.3833", "50.9422,6.9578", "51.3333,12.3833", "48.8566,2.3522", "55.6761,12.5683", "47.3769,8.5417", "60.1699,24.9384", "59.9139,10.7522")
country <- c("Sweden","Sweden","Sweden","Sweden","Sweden", "Germany", "Germany", "Germany", "Germany", "France", "Denmark", "Switzerland", "Finland", "Norway")
units <- c("metric", "imperial")
cityData <- data.frame(cities, coord, country)

ui <-  fluidPage(
  selectInput("city", "Choose a city:",
              cityData$cities
  ),
  selectInput("unit", "choose a unit:",
              units
  ),
  textAreaInput("api_Key", "Enter your Api Key", width = "1000px"),
  plotly::plotlyOutput("plot"),
)

server <-  function(input, output) {

  div_ru <- reactive({
    input$city
  })
  div_ru2 <- reactive({
    input$api_Key
  })

  output$plot <- plotly::renderPlotly({
    df <- weather_forcast(cityData[cityData$cities == input$city,]$coord, input$unit, input$api_Key)

    yLab = "Temprature in Fahrenheit"
    if (input$unit == "metric") {
      yLab = "Temprature in Celsius"
    }

    df$timestamp <- as.Date(strptime(df$startTime, "%Y-%m-%dT%H:%M:%S"))
    df$timestamp <- unlist(df$timestamp)
    temp <- df$values
    df$temp <- temp$temperature

    plotly::ggplotly(
      ggplot2::ggplot(data=df, ggplot2::aes(timestamp, temp)) +
        ggplot2::geom_line()+
        ggplot2::geom_point()+
        labs(y = yLab, x = "Date")+
        ggtitle(input$city)
    )
  })
}


shinyApp(ui, server)
