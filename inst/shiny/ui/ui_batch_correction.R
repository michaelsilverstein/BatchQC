tabPanel("Batch Correction Implementation",

         # Application title
         titlePanel("Batch Correction Implementation"),

         # Place for uploading data
         sidebarLayout(
           sidebarPanel(
             tags$p("Choose batch correction algorithms to run on your data. Visualizations of batch corrected data can be peformed following implementation."),
             selectizeInput('algorithm','Batch Correction Algorithm',choices =c("Combat", "Combat-Seq", "RUV", "SVA"),multiple = F,selected = NULL,
                            options = list(
                              placeholder = 'Please select an option below',
                              onInitialize = I('function() { this.setValue(""); }')
                            )),
           ),

           mainPanel(

               )
             )
           )
