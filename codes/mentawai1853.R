library(tidyverse)
library(googlesheets4)
library(deeplr)
library(googleLanguageR)

# get the Google Sheet link
source("codes/mentawai1853_00-gsheet.R")

# read the Google Sheet file
mentawai1853 <- read_sheet(mentawai1853_sheet) |> 
  mutate(ID = row_number()) # give entry ID

# translate the Dutch gloss with deeplr <- CODE to translate the Dutch into English using DeepL API
# dutch <- mentawai1853 |> 
#   select(ID, Dutch) |> 
#   filter(!is.na(Dutch))
# dutch <- dutch |> 
#   mutate(English_DeepL2 = deeplr::translate2(text = Dutch, target_lang = "EN", source_lang = "NL", auth_key = deeplauthkey))
# write_tsv(dutch, "data/dutch-translated-to-english-with-deepl.tsv") <- This file is manually edited together with the edited Concepticon mapping file

# read the English translation of the Dutch gloss
dutch <- read_tsv("data/dutch-translated-to-english-with-deepl.tsv") |> 
  mutate(untranslated = Dutch == English_DeepL2)

# join the English translation of the Dutch gloss with the main word list table
mentawai1853 <- mentawai1853 |> 
  left_join(dutch) |> 
  mutate(English_DeepL2 = if_else(untranslated, English_DeepL, English_DeepL2)) |>
  mutate(eng_diff = English_DeepL != English_DeepL2)

# this is a testing code to check which original translation is different from the DeepL
mentawai1853 |> 
  mutate(eng_diff = English_DeepL != English_DeepL2) |> 
  filter(eng_diff) |> 
  select(English_DeepL, English_DeepL2, Dutch) |> 
  as.data.frame()

# read the Concepticon mapping file
concepticon <- read_tsv("data/mentawai-gloss-mapped-to-edit_1853-270.tsv") |> 
  filter(GLOSS != "#") |> 
  select(-NUMBER) |> 
  distinct() |> 
  mutate(across(where(is.character), ~replace_na(., "")))

# join the Concepticon mapping with the main word list table
mentawai1853 <- mentawai1853 |> 
  left_join(concepticon |> 
              rename(English_DeepL2 = GLOSS))

# exclude the irrelevant columns
mentawai1853 <- mentawai1853 |> 
  select(-untranslated, -eng_diff, -English_DeepL) |> 
  select(ID, Mentawai, Dutch, English = English_DeepL2, CONCEPTICON_GLOSS, CONCEPTICON_ID, everything())

# save the main word list data containing the English translation and Concepticon Mapping
## the saved files still combine the three categories of word list
mentawai1853 |>
  write_tsv("data/mentawai1853.tsv")
mentawai1853 |>
  write_rds("data/mentawai1853.rds")

# save the comparison table in p. 434 into .tsv
# read_tsv("data/vrosenberg1853p434.csv") |> 
#   write_tsv("data/vrosenberg1853p434.tsv")

# run orthography profile =====
# write the profile and manually edit it.
# mentawai1853$Mentawai |> 
#   qlcData::write.profile(normalize = "NFC",
#                          editing = TRUE,
#                          info = TRUE,
#                          file.out = "data/ortho-profile-mentawai1853.tsv")

ortho <- qlcData::tokenize(mentawai1853$Mentawai,
                           profile = "data/ortho-profile-mentawai1853.tsv",
                           transliterate = "Replacement",
                           sep.replace = "_",
                           regex = TRUE,
                           ordering = NULL)
ortho$strings <- ortho$strings |> 
  rename(Mentawai = originals,
         Commons = transliterated) |> 
  as_tibble() |> 
  mutate(ID = mentawai1853$ID)
ipa <- qlcData::tokenize(mentawai1853$Mentawai,
                           profile = "data/ortho-profile-mentawai1853.tsv",
                           transliterate = "Phoneme",
                           sep.replace = "_",
                           regex = TRUE,
                           ordering = NULL)
ipa$strings <- ipa$strings |> 
  rename(Mentawai = originals,
         IPA = transliterated) |> 
  as_tibble() |> 
  mutate(ID = mentawai1853$ID)

mentawai1853 <- mentawai1853 |> 
  left_join(ortho$strings |> 
              select(-tokenized, -Mentawai),
            by = join_by(ID)) |> 
  left_join(ipa$strings |> 
              select(-tokenized, -Mentawai),
            by = join_by(ID)) |> 
  select(ID, Mentawai, Commons, IPA, Dutch, English, everything()) |> 
  
  # add the doculect for the CLDF purpose
  mutate(Doculect = "Mentawai")

# split the comparison dialect word list and men's names and save the respective files
# mentawai1853 <- read_rds("data/mentawai1853.rds")
mentawai1853 |> 
  filter(Category == "word list") |> 
  write_tsv("data/mentawai1853.tsv")
mentawai1853 |> 
  filter(Category == "word list") |> 
  write_tsv("data/mentawai1853.rds")
mentawai1853 |> 
  filter(Category == "dialect-comparison") |> 
  write_tsv("data/mentawai1853-dialect-comparison.tsv")
mentawai1853 |> 
  filter(Category == "men's names") |> 
  write_tsv("data/mentawai1853-men-names.tsv")
