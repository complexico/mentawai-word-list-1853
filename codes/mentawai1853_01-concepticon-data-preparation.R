library(tidyverse)
mentawai1853 <- read_rds("data/mentawai1853.rds")

# Prepare the English gloss for Concepticon Mapping
concepts_gloss <- mentawai1853 |> 
  filter(!is.na(English_DeepL)) |> 
  select(GLOSS = English_DeepL2) |> 
  distinct()
# concepts_gloss |>
#   mutate(NUMBER = row_number()) |>
#   write_tsv(paste("data/mentawai-gloss-to-map_1853-", nrow(concepts_gloss), ".tsv", sep = ""))

# Prepare the Dutch gloss for Concepticon Mapping
concepts_gloss <- mentawai1853 |> 
  filter(!is.na(Dutch)) |> 
  select(GLOSS = Dutch) |> 
  distinct()
# concepts_gloss |>
#   mutate(NUMBER = row_number()) |>
#   write_tsv(paste("data/mentawai-dutch-gloss-to-map_1853-", nrow(concepts_gloss), ".tsv", sep = ""))
