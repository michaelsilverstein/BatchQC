accepted = c("text/csv",
             "text/comma-separated-values",
             "text/plain",
             ".csv")


tabPanel("Upload Data",
    useShinyjs(),
    tags$style(appCSS),
    tags$div(
        class = "jumbotron",
        tags$div(
            class = "container",
            fluidRow(column(7, h1("BatchQC"))),
            tags$p("Batch Effects Quality Control Software"),
            uiOutput("tab")

        )
    ),
    # Application title
    titlePanel("Upload Data"),

    # Place for uploading data
    sidebarLayout(
        sidebarPanel(
            h3("Upload counts and metadata table"),
            tags$div(tags$p(
                'Metadata file must be a table with headers and sample names.'
            )),
            fileInput(
                "counts",
                "Counts table",
                multiple = FALSE,
                accept = accepted
            ),
            fileInput("md", "Metadata",
                      multiple = FALSE,
                      accept = accepted),
            h4("-OR-"),
            fileInput(
                "se",
                "Summarized Experiment",
                multiple = FALSE,
                accept = accepted
            ),
            actionButton(inputId = 'submit',label = 'Upload')

        ),

        # Show a table of the inputted data
        mainPanel(
            tabsetPanel(
                tabPanel('Input Summary',
                         tableOutput('counts_header'),
                         tableOutput('metadata_header')


                         ),
                tabPanel('Normalization',
                         #actionButton(inputId = 'DESEQ_normalization',label = 'DESEQ normalization'),
                         #actionButton(inputId = 'CPM_Normalization',label = 'CPM normalization')
                         selectInput('Normalizing_assay',label = 'Select Assay to normalize',
                                     multiple = F,choices = c()),
                        textInput('Normalization_Assay_Name',label = 'Assay Name',placeholder = 'Enter Assay Name here'),
                        selectInput('Normalization_Method',label = 'Select Normalization Method',
                                    multiple = F,choices = c('CountsPerMillion','MedianofRatio')),
                        actionButton('Normalize','Normalize')

                ),
                tabPanel('Full Metadata',
                         dataTableOutput('metadata')),
                tabPanel('Batch Effect Correction',
                         selectizeInput('group','Biological setting Column',choices =c(),multiple = F,selected = NULL,
                                        options = list(
                                            placeholder = 'Please select an option below',
                                            onInitialize = I('function() { this.setValue(""); }')
                                        )),
                         selectizeInput('batch','Batch Variable Column',choices =c(),multiple = F,selected = NULL,
                                        options = list(
                                            placeholder = 'Please select an option below',
                                            onInitialize = I('function() { this.setValue(""); }')
                                        )),
                         textInput('BatchCorrectedAssayName','Assay Name for Batch Corrected Counts',
                                   placeholder = 'Enter the name here'),
                         selectInput('BatchCorrectMethod',label = 'Select Batch correct Method',multiple = F,choices = c(
                             'ComBat-Seq',
                             'ComBat')),
                         actionButton(inputId = 'submit_variables',label = 'Submit')
                         )
            )
        )
    )
)
