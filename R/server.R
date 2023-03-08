server <- function(input , output ,session ){
  
  observeEvent(input$"upload_dataset_area" ,{
    dataset.path <- input$"upload_dataset_area"$datapath
    dataset <- read.csv(dataset.path)
    
    output$"dataset_table_box" <- renderUI({
      box(DT::dataTableOutput("dataset_table") , title = "Dataset" , width = 12)
    })
    
    output$dataset_plot_box <- renderUI({
      box(
        
        fluidRow(
          
        div(selectInput("select_x", choices = names(dataset) , width = 200 , label = "X") , style = "margin-right : 40px"),
        div(selectInput("select_y", choices = names(dataset) , width = 200 , label = "Y"), style = "margin-right : 40px" ),
        radioButtons("plot_mode" , label = "plot mode" , choices = c("markers" , "lines") , selected = "markers" , inline = T)
        
        ),
        
        plotlyOutput("dataset_plot")
        ,width = 12 , title = "Analytics" , maximizable = T)
    })
    
    output$"dataset_table" <- DT::renderDataTable({
      
      DT::datatable(  dataset ,    
                      options = list(
                      pageLength = 5, autoWidth = TRUE,
                      columnDefs = list(list( targets = 2, width = "100%")),
                      scrollX = TRUE
      )
      ) 
    
    })
    


    output$dataset_plot <- renderPlotly({
      plot_ly(data = dataset , x= dataset[[input$select_x]] , y = dataset[[input$select_y]] , mode = input$plot_mode , type = "scatter")
      
    })
    
  })

}