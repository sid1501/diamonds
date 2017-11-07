#####CLass 10##########

library(ggplot2)
library(shiny)

#GUI

ui <- fluidPage(
  titlePanel("Diamonds Data"),
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize diamonds dataset"),
      textInput(inputId = "title",label = "Chart Title", value=""),
      selectInput(inputId="pos",label="Postion",choices = list("stack","dodge"),selected="stack")
    ),
    mainPanel(
      plotOutput(outputId="plot")
    )
  )
)


#Server

server <-function(input,output){
output$plot =  renderPlot({
    ggplot(diamonds, aes(x=cut,fill=clarity))+
      geom_bar(position=input$pos)+
      ggtitle(input$title)+
      theme(title=element_text(face="bold"))
  })
}


#Run the app
shinyApp(ui, server)