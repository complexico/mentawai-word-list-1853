library(tidyverse)
library(googlesheets4)
source("codes/mentawai1853_00-gsheet.R")
mentawai1853 <- read_sheet(mentawai1853_sheet)
mentawai1853 |> 
  write_tsv("data/mentawai1853.tsv")
mentawai1853 |> 
  write_rds("data/mentawai1853.rds")
