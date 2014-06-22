library(shiny)

data(mtcars)

shinyServer(function(input, output) {
    table = reactive({
        t <- subset(mtcars,
            mpg >= input$mpg[1] & mpg <= input$mpg[2] &
            cyl %in% as.numeric(input$cyl) &
            disp >= input$disp[1] & disp <= input$disp[2] &
            hp >= input$hp[1] & hp <= input$hp[2] &
            drat >= input$drat[1] & drat <= input$drat[2] &
            wt >= input$wt[1] & wt <= input$wt[2] &
            qsec >= input$qsec[1] & qsec <= input$qsec[2] &
            vs == input$vs &
            am == input$am &
            gear >= input$gear[1] & gear <= input$gear[2] &
            carb >= input$carb[1] & carb <= input$carb[2])
        t$cyl <- as.integer(t$cyl)
        t$hp <- as.integer(t$hp)
        t$gear <- as.integer(t$gear)
        t$carb <- as.integer(t$carb)
        t <- t[,c(1, 2, 3, 4, 5, 6, 7, 10, 11)]
        colnames(t) <- c(
            'mi/Gal',
            'Cylinders',
            'Displacement',
            'Horsepower',
            'Rear axle ratio',
            'Weight',
            '1/4mi time',
            'Gears',
            'Carburetors')
        return(t)
    })

    output$cars <- renderTable({
        table()
    })
})