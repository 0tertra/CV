library(rmarkdown)

# simple cv as readme
render("cv.Rmd", output_file = "README.md")

# nice formated version
render("twenty_seconds/twenty_seconds.Rmd", 
       output_file = "Nick_Meulemeester.pdf")
