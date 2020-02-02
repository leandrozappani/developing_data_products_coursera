
library(shiny)

shinyUI(fluidPage(
        titlePanel("Comparing Distributions APP"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("xrange", "Display range in X:", -50,50, c(-4,4), step = 1),
                        sliderInput("yrange", "Display range in Y:", 0,1, c(0,1), step = 0.01),
                        h4("Normal 1"),
                        splitLayout(
                                numericInput("mean1", "Mean", value = 0, min = -40, max = 40, step = 1),
                                numericInput("sd1", "SD", value = 1, min = 0.1, max = 10, step = 0.1)),
                        checkboxInput("display1", "Show?", value = FALSE),
                        h4("Normal 2"),
                        splitLayout(
                                numericInput("mean2", "Mean", value = 0, min = -40, max = 40, step = 1),
                                numericInput("sd2", "SD", value = 1, min = 0.1, max = 10, step = 0.1)),
                        checkboxInput("display2", "Show?", value = FALSE),
                        h4("Poisson"),
                        numericInput("lambda", "Lambda", value = 1, min = 0.01, max = 25, step = 0.01),
                        checkboxInput("display3", "Show?", value = FALSE),
                        h4("Binomial"),
                        splitLayout(
                                numericInput("p", "Probability", value = 0.5, min = 0.01, max = 0.99, step = 0.01),
                                numericInput("n1", "N", value = 6, min = 1, max = 200, step = 1)),
                        checkboxInput("display4", "Show?", value = FALSE),
                        h4("Student's t"),
                        numericInput("n2", "n", value = 2, min = 2, max = 100, step = 1),
                        checkboxInput("display5", "Show?", value = FALSE)),
                mainPanel(
                        p("This app allows you to compare statistical distribution with different parameters."),
                        p("Recall the Central limit Theorem and other approximations of distributions, and feel free to experiment!"),
                        plotOutput("distPlot"),
                        h2("How to use it!"),
                        p("- You can set the range for the axis in the plot."),
                        p("- For each distribution you can set the relevant parameters and choose to display them."),
                        p("- Find theoric explanations about these distributions in the links provided below"),
                        h3("Normal distribution", a(href = "https://en.wikipedia.org/wiki/Normal_distribution", "Link", target = "_blank")),
                        p("You can plot two normal distributions at the same time, and change their mean and standard deviation at will. The default values are for standard normal distribution ~ N(0,1)"),
                        h3("Poisson distribution", a(href = "https://en.wikipedia.org/wiki/Poisson_distribution", "Link", target = "_blank")),
                        p("You can change the lambda, and compare with other distributions."),
                        h3("Binomial distribution", a(href = "https://en.wikipedia.org/wiki/Binomial_distribution", "Link", target = "_blank")),
                        p("You can change the probability of success and the number of events, and compare with other distributions."),
                        h3("Student's t distribution", a(href = "https://en.wikipedia.org/wiki/Student%27s_t-distribution", "Link", target = "_blank")),
                        p("You can change the number of observations (n). This distribution is plotted against a standard normal distribution and should not be compared with the other distributions in the app.")
                )
        )
        
))
