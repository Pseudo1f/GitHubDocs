library(shiny)
PortfolioRet <- function(ret1, ret2, ret3, ret4, ret5, wght1, wght2, wght3, wght4) {
     rets <- c(ret1, ret2, ret3, ret4, ret5)
     wghts <- c(wght1, wght2, wght3, wght4, 1-sum(wght1,wght2,wght3, wght4))
     portret <- sum(rets*wghts)
     return(portret)
}
PortfolioVol <- function(vol1, vol2, vol3, vol4, vol5, wght1, wght2, wght3, wght4, corr) {
     vols <- c(vol1, vol2, vol3, vol4, vol5)
     wghts <- c(wght1, wght2, wght3, wght4, 1-sum(wght1,wght2,wght3, wght4))
     portvariance <- 0
     for (i in 1:5) {
          for (j in 1:5) {
               if (i==j) {
                    portvariance <-
                         portvariance + vols[i]*vols[j]*wghts[i]*wghts[j]
               } else {
                    portvariance <-
                         portvariance + vols[i]*vols[j]*wghts[i]*wghts[j]*corr
               }

          }
     }
     portvol<-sqrt(portvariance)
     return(portvol)
}
shinyServer(
     function(input, output) {
          output$portret <- renderPrint({
               PortfolioRet(input$ret1, input$ret2, input$ret3, input$ret4, input$ret5
                            , input$wght1, input$wght2, input$wght3, input$wght4)
          })
          output$portvol <- renderPrint({
               PortfolioVol(input$vol1, input$vol2, input$vol3, input$vol4, input$vol5
                             , input$wght1, input$wght2, input$wght3, input$wght4
                             , input$corr)
          })
          output$portvollowrisk <- renderPrint({
               (PortfolioVol(input$vol1-.01, input$vol2-.01, input$vol3-.01, input$vol4-.01, input$vol5-.01
                            , input$wght1, input$wght2, input$wght3, input$wght4
                            , input$corr)-
                     PortfolioVol(input$vol1, input$vol2, input$vol3, input$vol4, input$vol5
                                  , input$wght1, input$wght2, input$wght3, input$wght4
                                  , input$corr))
          })
          output$portvollowcorr <- renderPrint({
               (PortfolioVol(input$vol1, input$vol2, input$vol3, input$vol4, input$vol5
                            , input$wght1, input$wght2, input$wght3, input$wght4
                            , input$corr-.05)-
                     PortfolioVol(input$vol1, input$vol2, input$vol3, input$vol4, input$vol5
                                  , input$wght1, input$wght2, input$wght3, input$wght4
                                  , input$corr))
          })
     })
