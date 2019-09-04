library(rorcid)
library(purrr)
library(dplyr)
# only run once to get token
# rorcid::orcid_auth() 
# copy token to .Renviron
# usethis::edit_r_environ() 

orcidID <- "0000-0001-7938-7188"

empl <- rorcid::orcid_employments(orcidID)$`0000-0001-7938-7188`$`affiliation-group`$summaries
#empl <- map(empl, ~ as.character(.x$'employment-summary.role-title'))
 empl <- reduce(
   empl,
   full_join
   )
empl$when <- glue::glue("{empl$`employment-summary.start-date.year.value`} - {empl$`employment-summary.end-date.year.value`}")
write.csv(empl, "data/empl.csv", row.names = FALSE)


edu <- reduce(
   rorcid::orcid_educations(orcidID)$`0000-0001-7938-7188`$`affiliation-group`$summaries,
   full_join
   )
edu$when <- glue::glue("{edu$`education-summary.start-date.year.value`} - {edu$`education-summary.end-date.year.value`}")
write.csv(edu, "data/edu.csv", row.names = FALSE)
