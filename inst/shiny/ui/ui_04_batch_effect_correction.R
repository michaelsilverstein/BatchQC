
tabPanel("Batch Effect Correction",

         # Application title
         titlePanel("Batch Effect Correction"),

         # Sidebar with a slider input for number of bins
         sidebarLayout(
           sidebarPanel(
           ),

           # Show a plot of the generated distribution
           mainPanel(
             tabsetPanel(
               tabPanel('Batch Effect Correction',
                        textInput('BatchCorrectedAssayName','Assay Name for Batch Corrected Counts',
                                  placeholder = 'Enter the name here'),
                        selectInput('BatchCorrectMethod',label = 'Select Batch correct Method',multiple = F,choices = c(
                          'ComBat-Seq',
                          'ComBat')),
                        actionButton('Correct','Correct')









                        ),
               tabPanel("ComBat-seq"
               ),
               tabPanel("ComBat"
               ),
               tabPanel("SVA"
               ),
               tabPanel("RUV"
               )
             )
           )
         )
)
