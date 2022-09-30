server <-  function(input, output) {
  
  div_ru <- reactive({
    input$city
  })
  
  output$plot <- plotly::renderPlotly({
    df <- weather_forcast(cityData[cityData$cities == input$city,]$coord, input$unit)
    
    
    df$timestamp <- as.Date(strptime(df$startTime, "%Y-%m-%dT%H:%M:%S"))
    df$timestamp <- unlist(df$timestamp)
    temp <- df$values
    df$temp <- temp$temperature
    
    plotly::ggplotly(
      ggplot2::ggplot(data=df, ggplot2::aes(timestamp, temp)) +
        ggplot2::geom_line()+
        ggplot2::geom_point()
    )
  })
}