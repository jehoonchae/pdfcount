## -----
## ui.R
## -----

library("shiny")
library("plotly")

ui <- fluidPage(
  h2("Count Words in a PDF Document", style = "text-align:center;"),
  br(),
  fluidRow(
    column(3, 
      strong(p("Upload your file here:")),
      fileInput("infile", label = NULL, accept = "application/pdf"),
      textInput("pages", "Page numbers (e.g., 1:3,5:7):", "", width = "70%"),
      strong(p("Additional options:")),
      checkboxInput("count_numbers", "Count numbers?", TRUE),
      checkboxInput("count_captions", "Count table/figure captions?", FALSE),
      checkboxInput("count_equations", "Count equation lines?", FALSE),
      checkboxInput("split_hyphenated", "Split hyphenated words?", FALSE),
      checkboxInput("split_urls", "Tokenize URLs?", FALSE)
    ),
    column(9,
      strong(textOutput("grand_total")),
      p(""),
      strong(textOutput("page_counts")),
      plotlyOutput("barplot", width = "100%", height = "500px")
    )
  ),
  br(),
  tags$footer(
    tags$p("Copyright Thomas J. Leeper (2018).", a("MIT-licensed.", href = "https://opensource.org/licenses/MIT"), "Source code and R package available from: ", a("https://github.com/leeper/pdfcount", href = "https://github.com/leeper/pdfcount")))
)
