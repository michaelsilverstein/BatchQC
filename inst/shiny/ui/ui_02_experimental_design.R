
tabPanel("Experimental Design",

         # Application title
         titlePanel("Experimental Design"),

         # Place for uploading data
         sidebarLayout(
           sidebarPanel(
           ),

           # Show a table of the inputted data
           mainPanel(
             tabsetPanel(
               tabPanel("Batch Design",
                 selectInput("covariate", "Select Covariate:", choices = ""),
                 tableOutput("batch_design")
               ),
               tabPanel("Confounding",
                        tableOutput("confounding_table")
               )
             )
           )
         )
)
