library(tidyverse)
library(googlesheets4)
library(deeplr)
library(googleLanguageR)
source("codes/mentawai1853_00-gsheet.R")
mentawai1853 <- read_sheet(mentawai1853_sheet) |> 
  mutate(ID = row_number())

# translate the dutch with deeplr
# dutch <- mentawai1853 |> 
#   select(ID, Dutch) |> 
#   filter(!is.na(Dutch))
# dutch <- dutch |> 
#   mutate(English_DeepL2 = deeplr::translate2(text = Dutch, target_lang = "EN", source_lang = "NL", auth_key = deeplauthkey))
# write_tsv(dutch, "data/dutch-translated-to-english-with-deepl.tsv")

dutch <- read_tsv("data/dutch-translated-to-english-with-deepl.tsv") |> 
  mutate(untranslated = Dutch == English_DeepL2)

mentawai1853 <- mentawai1853 |> 
  left_join(dutch) |> 
  mutate(English_DeepL2 = if_else(untranslated, English_DeepL, English_DeepL2)) |>
  mutate(eng_diff = English_DeepL != English_DeepL2)

mentawai1853 |> 
  mutate(eng_diff = English_DeepL != English_DeepL2) |> 
  filter(eng_diff) |> 
  select(English_DeepL, English_DeepL2, Dutch) |> 
  as.data.frame()

concepticon <- read_tsv("data/mentawai-gloss-mapped-to-edit_1853-270.tsv") |> 
  filter(GLOSS != "#") |> 
  select(-NUMBER) |> 
  distinct() |> 
  mutate(across(where(is.character), ~replace_na(., "")))

mentawai1853 <- mentawai1853 |> 
  left_join(concepticon |> 
              rename(English_DeepL2 = GLOSS))

mentawai1853 <- mentawai1853 |> 
  select(-untranslated, -eng_diff, -English_DeepL) |> 
  select(ID, Mentawai, Dutch, English = English_DeepL2, CONCEPTICON_GLOSS, CONCEPTICON_ID, everything())

mentawai1853 |>
  write_tsv("data/mentawai1853.tsv")
mentawai1853 |>
  write_rds("data/mentawai1853.rds")
