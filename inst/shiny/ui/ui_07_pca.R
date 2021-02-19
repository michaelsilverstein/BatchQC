tabPanel("PCA Analysis",

         # Application title
         titlePanel("PCA Analysis"),

         # Sidebar with a slider input for number of bins
         sidebarLayout(
           sidebarPanel(
             selectInput('correctionMethod', 'Batch Adjustment Method',
                          list("None" = "None"))
           ),

           # Show a plot of the generated distribution
           mainPanel(
             tabsetPanel(
               tabPanel("PCA",
                    plotOutput("pcaPlot")
               ),
               tabPanel("Summary"
               ),
               tabPanel("Table"
               ),
               tabPanel("Explained Variation")
             )
           )
         )
)
