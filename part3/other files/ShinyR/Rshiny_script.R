library(shiny)

# Define UI for miles per gallon app ----
ui <- pageWithSidebar(
  
  # App title ----
  headerPanel("2018-19 CDC vs twitter Maps"),
  
  # Sidebar panel for inputs ----
  sidebarPanel(selectInput("variable", "Charts option:", 
                           c(
                             "CDC vs Flu Tweets" = "cdc_vs_flutweet",
                             "CDC vs Influenza Tweets" = "cdc_vs_influtweet",
                             "CDC vs Flu and Influenza Tweets" = "cdc_vs_influ_flutweet"))
               
               
  ),
  
  
  # Main panel for displaying outputs ----
  mainPanel(uiOutput("mapPlot"))
)

# Define server logic to plot various variables against mpg ----


# Data pre-processing ----
# Tweak the "am" variable to have nicer factor labels -- since this
# doesn't rely on any user inputs, we can do this once at startup
# and then use the value throughout the lifetime of the app

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
  output$mapPlot <- renderUI({
    
   
     if(input$variable =="cdc_vs_flutweet")
    {
      img(src= 'cdc_vs_flu.png',
          width=500,
          height=850)
      
    }
    else if(input$variable =="cdc_vs_influtweet")
    {
      img(src= 'cdc_vs_influenza.png',
          width=500,
          height=850)
      
    }
    else if(input$variable =="cdc_vs_influ_flutweet")
    {
      img(src= 'cdc_vs_combined.png',
      width=500,
      height=850)
      
    }
    
  })
  
  
}


shinyApp(ui, server)