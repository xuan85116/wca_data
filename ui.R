shinyUI(fluidPage(
  navbarPage
  ("WCA data",
    tabPanel
    ("Country rank",
      titlePanel("How many countries has more records than yours in an event"),
      sidebarLayout(
        sidebarPanel(
          selectInput("cr_select_country", "Select country",
                      choices = as.character(WCA_export_Countries$id), selected = "Taiwan"),
          selectInput("cr_select_event", "Select event",
                      choices = as.character(WCA_export_Events$id),selected = "333"),
          radioButtons("cr_radio","Single or Average",c("Single" = "Single","Average" = "Average"),selected = "Average"),
          textInput("cr_text", "Sub _ seconds", value = 10),
          htmlOutput("cr_gtable_coun")
        ),
        mainPanel(
          verbatimTextOutput("cr_info"),
          htmlOutput("cr_gtable")
        )))
    ))
  )