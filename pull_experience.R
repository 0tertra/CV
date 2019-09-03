# only run once to get token
# rorcid::orcid_auth() 
# copy token to .Renviron
# usethis::edit_r_environ() 

orcidID <- "0000-0001-7938-7188"

#empl <- rorcid::orcid_employments(orcidID)$`0000-0001-7938-7188`$`affiliation-group`$summaries
#empl <- map(empl, ~ as.character(.x$'employment-summary.role-title'))
# empl <- reduce(
#   empl,
#   full_join
#   )
write.csv(empl, "data/empl.csv", row.names = FALSE)

#edu <- reduce(
  #   rorcid::orcid_educations(orcidID)$`0000-0001-7938-7188`$`affiliation-group`$summaries,
  #   full_join
  #   )
write.csv(edu, "data/edu.csv", row.names = FALSE)
