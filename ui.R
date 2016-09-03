library(shiny)
shinyUI(
     pageWithSidebar(
          # Application title
          headerPanel("Calculating Risk and Return for a Portfolio"),
          sidebarPanel(
               h3("Documentation"),
               h5("Please see the RPres link for more info but in sum: This app
               takes in as input five assets, each of which has a return, a risk
               (measured as standard deviation), and also weights (sizes) for the
               first four. The last asset weight is simply calculated such that the
               total weight of assets adds up to 100%. As output the app tells you
               what the return and the risk of the portfolio will be as well as the
               change in risk if you were to make small changes to the correlation
               or to the risk assumptions of the individual assets. It is especially
               useful to see how important the correlation assumption is to the
               final portfolio risk"),
               h5("To use the app simply choose your inputs and look to the right"),
               h3("Inputs"),
               numericInput('corr', 'Pairwise Correlation', .75, min = 0, max = 1, step = .05),
               numericInput('ret1', 'Asset Return 1', .07, min = 0, max = .3, step = .01),
               numericInput('ret2', 'Asset Return 2', .07, min = 0, max = .3, step = .01),
               numericInput('ret3', 'Asset Return 3', .07, min = 0, max = .3, step = .01),
               numericInput('ret4', 'Asset Return 4', .07, min = 0, max = .3, step = .01),
               numericInput('ret5', 'Asset Return 5', .07, min = 0, max = .3, step = .01),
               numericInput('vol1', 'Asset Risk 1', .21, min = 0, max = 1, step = .01),
               numericInput('vol2', 'Asset Risk 2', .21, min = 0, max = 1, step = .01),
               numericInput('vol3', 'Asset Risk 3', .21, min = 0, max = 1, step = .01),
               numericInput('vol4', 'Asset Risk 4', .21, min = 0, max = 1, step = .01),
               numericInput('vol5', 'Asset Risk 5', .21, min = 0, max = 1, step = .01),
               numericInput('wght1', 'Asset Weight 1', .2, min = 0, max = 1, step = .01),
               numericInput('wght2', 'Asset Weight 2', .2, min = 0, max = 1, step = .01),
               numericInput('wght3', 'Asset Weight 3', .2, min = 0, max = 1, step = .01),
               numericInput('wght4', 'Asset Weight 4', .2, min = 0, max = 1, step = .01),
               width=8
          ),
          mainPanel(
               h3('Results of Risk and Return for Portfolio'),
               h4('Portfolio Return'),
               verbatimTextOutput("portret"),
               h4("Portfolio Risk"),
               verbatimTextOutput("portvol"),
               h4("Portfolio Risk Change if risk inputs decreased by 0.01"),
               verbatimTextOutput(("portvollowrisk")),
               h4("Portfolio Risk Change if correlation decreased by 0.05"),
               verbatimTextOutput(("portvollowcorr")),
               width=4
          )
     )
)
# As additional changes:
# Change the layout so that you can see everything at once
