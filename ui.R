ui <-  fluidPage(
  selectInput("city", "Choose a city:",
              cityData$cities
  ),
  selectInput("unit", "choose a unit:",
              units
  ),
  plotly::plotlyOutput("plot"),
)