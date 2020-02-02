
library(shiny)

shinyServer(function(input, output) {
    
    output$distPlot <- renderPlot({
        x <- seq(from = -60,to = 60,length.out = 10000)
        y<- dnorm(x,mean = input$mean1, sd = input$sd1)
        xlim <- input$xrange
        ylim <- input$yrange
        plot(type = "n", x = x, y = y, xlim = xlim, ylim = ylim, xlab = "X", ylab = "P(X)", main = "Probability density/mass function")
        
        if(input$display1 == TRUE) {
            points(type = "l", x = x, y = y, lwd = 3, col = 1)
        }
        
        if(input$display2 == TRUE) {
            points(type = "l", x = x, y = dnorm(x,mean = input$mean2, sd = input$sd2),
                   lwd = 3, col = 2)
        }
        
        if(input$display3 == TRUE) {
            poisx <- seq(0, 50, by = 1)
            points(type = "p", x = poisx, y = dpois(poisx, lambda = input$lambda),
                   cex = 2, col = 2, pch = 19)
        }
        
        if(input$display4 == TRUE) {
            binx <- seq(0, input$n1, by = 1)
            points(type = "h", x = binx, y = dbinom(binx, size = input$n1, prob = input$p),
                   lwd = 5, col = 3)
        }
        
        if(input$display5 == TRUE) {
            studx <- seq(-50, 50, length.out = 10000)
            points(type = "l", x = studx, y = dt(studx, df = input$n2-1),
                   lwd = 3, col = 3)
            points(type = "l", x = studx, y = dnorm(studx, 0, 1),
                   lwd = 3, col = 4)
            legend("topright", legend = c("Normal", "T"), lwd = c(2, 2), col = c(4, 3))
        }
        
    })
    
})
