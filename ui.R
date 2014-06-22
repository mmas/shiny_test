library(shiny)

CYL_CHOICES <- c('4'=4, '6'=6, '8'=8)

shinyUI(fluidPage(theme='main.css',
    sidebarPanel(
        sliderInput('mpg', 'Miles/gallon', value=c(0,50), min=0, max=50, step=1),
        checkboxGroupInput('cyl', 'Number of cylinders', CYL_CHOICES, selected=CYL_CHOICES),
        sliderInput('disp', 'Displacement', value=c(0,500), min=0, max=500, step=10),
        sliderInput('hp', 'Gross horsepower', value=c(0,500), min=0, max=500, step=10),
        sliderInput('drat', 'Rear axle ratio', value=c(0,5), min=0, max=5, step=.5),
        sliderInput('wt', 'Weight', value=c(1,10), min=0, max=10, step=1),
        sliderInput('qsec', '1/4 mile time', value=c(10,30), min=10, max=30, step=2),
        checkboxInput('vs', 'V/S'),
        checkboxInput('am', 'Transmission', value=TRUE),
        sliderInput('gear', 'Number of forward gears', value=c(0,5), min=0, max=5, step=.5),
        sliderInput('carb', 'Number of carburetors', value=c(0,10), min=0, max=10, step=1)
    ),
    mainPanel(
        tableOutput('cars')
    )
))