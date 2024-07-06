# CLDF dataset derived from von Rosenberg's "De Mentawei-Eilanden en Hunne Bewoners" from 1853

<!-- badges: start -->
[![CLDF validation](https://github.com/complexico/mentawai-word-list-1853/workflows/CLDF-validation/badge.svg)](https://github.com/complexico/mentawai-word-list-1853/actions?query=workflow%3ACLDF-validation)
<!-- badges: end -->

## How to cite

If you use these data please cite
- the original source
  > Rosenberg, Carl Benjamin Hermann von. 1853. De Mentawei-Eilanden en Hunne Bewoners. Tijdschrift voor Indische Taal-, Land- en Volkenkunde 1. 403–440.
- the derived dataset using the DOI of the [particular released version](../../releases/) you were using

## Description


This dataset is licensed under a https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en license

Available online at https://www.digitale-sammlungen.de/en/view/bsb10433845?page=450,451

## Notes

Based on the [Rights Statement](https://www.digitale-sammlungen.de/en/details/bsb10433845) (presented down below in that page), this digitised journal has a [No Copyright-Non-commercial use only](https://rightsstatements.org/page/NoC-NC/1.0/?language=en) condition.

Before the CLDF conversion using Python, the materials in this repository (inside the [data](https://github.com/complexico/mentawai-word-list-1853/tree/main/data) directory) were processed using R as an RStudio project (the R scripts are in the [codes](https://github.com/complexico/mentawai-word-list-1853/tree/main/codes) directory). The English gloss of the Dutch was generated via the DeepL translator using the [`deeplr` R package](https://cran.r-project.org/package=deeplr).

As a long-time R user, the motivation to produce this repository is as a practice to get started with the [`cldfbench`](https://pypi.org/project/cldfbench/) workflow in Python to implement the Cross-Linguistic Data Format ([CLDF](https://cldf.clld.org)) that I would like to apply and extend to my [lexical resources project for Enggano](https://gtr.ukri.org/projects?ref=AH%2FW007290%2F1). The other motivation is to (i) document this legacy data in a computer-readable format, (ii) enrich its content following the CLDF standard, and (iii) contribute to an on-going [research on the languages of the Barrier Islands, in Sumatra, Indonesia](https://www.indonesianlanguages.org/home/barrier-islands-languages/), extending the [Enggano language project](https://enggano.ling-phil.ox.ac.uk).


## Statistics


![Glottolog: 100%](https://img.shields.io/badge/Glottolog-100%25-brightgreen.svg "Glottolog: 100%")
![Concepticon: 98%](https://img.shields.io/badge/Concepticon-98%25-green.svg "Concepticon: 98%")
![Source: 100%](https://img.shields.io/badge/Source-100%25-brightgreen.svg "Source: 100%")
![BIPA: 100%](https://img.shields.io/badge/BIPA-100%25-brightgreen.svg "BIPA: 100%")
![CLTS SoundClass: 100%](https://img.shields.io/badge/CLTS%20SoundClass-100%25-brightgreen.svg "CLTS SoundClass: 100%")

- **Varieties:** 1 (linked to 1 different Glottocodes)
- **Concepts:** 267 (linked to 255 different Concepticon concept sets)
- **Lexemes:** 271
- **Sources:** 1
- **Synonymy:** 1.01
- **Invalid lexemes:** 0
- **Tokens:** 1,575
- **Segments:** 31 (0 BIPA errors, 0 CLTS sound class errors, 31 CLTS modified)
- **Inventory size (avg):** 31.00

# Contributors

Name                 | GitHub user     | Description                          | Role
---                  | ---             | ---                                  | ---
Gede Primahadi W. Rajeg       | @gederajeg       | digitisation, code, CLDF conversion, Concepticon mapping, Orthography profiling                           | Maintainer



## CLDF Datasets

The following CLDF datasets are available in [cldf](cldf):

- CLDF [Wordlist](https://github.com/cldf/cldf/tree/master/modules/Wordlist) at [cldf/cldf-metadata.json](cldf/cldf-metadata.json)