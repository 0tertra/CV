library(rorcid)
library(purrr)
library(dplyr)
# only run once to get token
# rorcid::orcid_auth() 
# copy token to .Renviron
# usethis::edit_r_environ() 

orcidID <- "0000-0001-7938-7188"

### employment ##############

empl <- rorcid::orcid_employments(orcidID)$`0000-0001-7938-7188`$`affiliation-group`$summaries
#empl <- map(empl, ~ as.character(.x$'employment-summary.role-title'))
empl <- reduce(
   empl,
   full_join
   )
empl$when <- glue::glue("{empl$`employment-summary.start-date.year.value`} - {empl$`employment-summary.end-date.year.value`}")
empl$why <- c(
  #basf
  "Acquired Bayer CropScience division in August 2018.",
  #bayer junior researcher
  "Next to the responsibility’s as a technician also 
  be a business representative for multiple data
  management and analysis projects across departments.",
  #bayer tech
  "Supporting and developing phenotyping data analysis pipeline further.",
  #bayer junior tech
  "Establishing a phenotyping data analysis pipeline 
  by developing tools for experimental design, data preparation, 
  visualization and analysis.",
  #bayer interim
  "Maintaining plant material and collecting observation for research projects.",
  #eoc
  "Quality control of resources and final products.",
  #anabiotec
  "Administrator and development of Laboratory information 
  management system (Lims), but also
  providing integration with reporting services."
)

write.csv(empl, "data/empl.csv", row.names = FALSE)

### education ##############
edu <- reduce(
   rorcid::orcid_educations(orcidID)$`0000-0001-7938-7188`$`affiliation-group`$summaries,
   full_join
   )
edu$when <- glue::glue("{edu$`education-summary.start-date.year.value`} - {edu$`education-summary.end-date.year.value`}")
edu$why <- c(
  #howest
  "An interdisciplinary science course that combines domains as biology, 
  computer science and information engineering to 
  analyze and interpret biological data.",
  #vlti
  "A scientific course with the focus on biology, chemistry and applied mathematics.",
  #sint martinus
  "A broad, general education with the focus on sciences and mathematics."
)
write.csv(edu, "data/edu.csv", row.names = FALSE)
