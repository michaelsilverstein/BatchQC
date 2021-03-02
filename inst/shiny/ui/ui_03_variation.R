

tabPanel("Variation Analysis",

    # Application title
    titlePanel("Variation and P-Value Analysis"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectizeInput('assay','Choose assay:',choices =c(),multiple = F,selected = NULL,
                           options = list(
                               placeholder = 'Please select an option below',
                               onInitialize = I('function() { this.setValue(""); }')
                           )),
            selectizeInput('group','Biological setting Column',choices =c(),multiple = F,selected = NULL,
                           options = list(
                               placeholder = 'Please select an option below',
                               onInitialize = I('function() { this.setValue(""); }')
                           )),
            selectizeInput('batch','Batch Variable Column',choices =c(),multiple = F,selected = NULL,
                           options = list(
                               placeholder = 'Please select an option below',
                               onInitialize = I('function() { this.setValue(""); }')
                           ))
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Variation Analysis",
                         h3("Variation explained by Batch and Condition"),
                         plotOutput("variation_plot"),
                         br(),
                         tableOutput("variation_table")
                         # sidebarLayout(
                         #     sidebarPanel(),
                         #     mainPanel()
                         # )
                ),
                tabPanel("P-Value Analysis",
                         h3("Distribution of Batch and Condition effect p-values across genes"),
                         tableOutput("p_value_table"),
                         plotOutput("batch_p_value_plot"),
                         br(),
                         plotOutput("condition_p_value_plot")
                ),
                tabPanel("Differential Expression"
                )
            )
        )
    )


)
