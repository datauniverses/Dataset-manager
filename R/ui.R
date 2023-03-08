source("shiny-file-input-area.R")

about.me.style <- "font-family: Roboto Condensed;
                   font-weight: 400;
                   font-style: normal;
                   font-size: 18px;
                   letter-spacing: 0em;
                   line-height: 1.8em;
                   text-transform: none;
                   color: #222;"

ui <- dashboardPage(

  dashboardHeader(title = "Dataset Manager" ),
  
  dashboardSidebar(collapsed = F, skin = "light",
                   
    sidebarMenu(
      menuItem("Home" , tabName = "home_side_bar", icon = icon("house") ),
      menuItem("About" , tabName = "about_side_bar", icon=icon("address-card" , lib = "font-awesome"))
      
    )
  ),
  
  controlbar = dashboardControlbar(
    skin = "light",
    collapsed = T,
    div(class = "p-3", skinSelector()),
    pinned = F
  ),
  title = "Skin Selector",


  
  dashboardBody(bs4TabItems(
    bs4TabItem(tabName = "home_side_bar",
               
              card( title = "",
                fileInputArea("upload_dataset_area" , label = "UPLOAD DATASET" , multiple = F , accept = ".csv"  )
              ) ,
              
              uiOutput("dataset_table_box"),
              uiOutput("dataset_plot_box")

              ),
    
    
    bs4TabItem(tabName =  "about_side_bar",
            bs4SocialCard(width = 12 , maximizable = T , collapsible = F , height =800,
              
            title = strong(h1("ABOUT" , style = "font-family: bebas-neue;font-weight: 400;
                                                  font-style: normal;
                                                  font-size: 64px;
                                                  letter-spacing: .03em;
                                                  line-height: .9em;
                                                  text-transform: none;
                                                  text-align:center")),
            
            p("I am a data scientist with experience in machine learning and statistical analysis. I have worked on a variety of projects, including predictive modeling and computer vision." , style = about.me.style),
            
            h4("Education"),
            p("Bachelor  in Computer Science, Al-Hussein-Bin-Talal, Jordan" , style = about.me.style),
            
            tags$h4("Skills" , style = about.me.style),
            tags$ul(
              tags$li("R shiny", style = about.me.style),
              tags$li("Python programming", style = about.me.style),
              tags$li("Machine learning", style = about.me.style),

            ),
            
            
            tags$h4("Contact info", style = about.me.style),
            tags$ul(style = about.me.style,
              tags$li(tags$a("jamilaboyousef@yahoo.com" , href = "mailto:jamilaboyousef@yahoo.com") ,style = about.me.style),
              tags$li(tags$a("00962775999233" , href = "tel:00962775999233") , style = about.me.style),
           
            )
            
    )
      
    )
    
  ))
  
)