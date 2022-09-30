cities <- c("Stockholm", "Gothenburg", "Karlskrona", "Malmö", "Linköping", "Hamburg", "Berlin", "Cologne", "Leipzig", "Paris", "Copenhagen", "Zurich", "Helsinki", "Oslo")
coord <- c("59.3294,18.0686", "57.6717,11.9810", "56.1611,15.5881", "55.5932,13.0214", "58.4094,15.6257", "53.5500,10.0000", "52.5167,13.3833", "50.9422,6.9578", "51.3333,12.3833", "48.8566,2.3522", "55.6761,12.5683", "47.3769,8.5417", "60.1699,24.9384", "59.9139,10.7522")
country <- c("Sweden","Sweden","Sweden","Sweden","Sweden", "Germany", "Germany", "Germany", "Germany", "France", "Denmark", "Switzerland", "Finland", "Norway")
units <- c("metric", "imperial")

cityData <- data.frame(cities, coord, country)



# import in desc (usethis::use_package("pkg_name")) and namespcace(in roxygen)


#' Run the shiny app
#' This app will show the temperature forecast based on the city and units during the next month 

#' @import shiny 
#' @export

run_shiny <- function() {
  shinyApp(ui, server)
}

