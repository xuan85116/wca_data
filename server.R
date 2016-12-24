require(shiny)
require(googleVis)
require(lubridate)
require(leaflet)
library(reshape2)

shinyServer(function(input, output, session) {

  output$cr_gtable <- renderGvis({
    wca_temp <- get(paste0("WCA_export_Ranks",input$cr_radio))
    wca_temp <- subset(wca_temp, eventId == input$cr_select_event)
    wca_temp <- subset(wca_temp, best < as.numeric(input$cr_text))
    output$cr_info <- renderText({
      wca_info_temp <- as.data.frame(table(wca_temp$countryId))
      names(wca_info_temp)[1] <- "country"
      coun1 <- wca_info_temp$Freq[which(wca_info_temp$country == input$cr_select_country)]
      coun2 <- nrow(subset(wca_info_temp, Freq > coun1))
      coun3 <- nrow(subset(wca_info_temp, Freq == coun1))
      wca_info_temp <- subset(wca_info_temp, Freq >= coun1)
      wca_info_temp <- wca_info_temp[order(wca_info_temp$Freq,decreasing = T),]
      output$cr_gtable_coun <- renderGvis({
        gvisTable(wca_info_temp)
      })
      paste0(input$cr_select_country, " has ", coun1, " competitors with Sub-",input$cr_text, " in ", input$cr_select_event," ",input$cr_radio," event, \n",
            "and ",input$cr_select_country," is second only to ",coun2," countries. \n",
            "There are ",coun3 - 1 , " countries draw with ",input$cr_select_country,".")
    })
    gvisTable(wca_temp)
  })
  
})
