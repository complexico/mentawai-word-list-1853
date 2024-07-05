CLDF dataset derived from von Rosenberg’s “De Mentawei-Eilanden en Hunne
Bewoners” from 1853
================
Gede Primahadi Wijaya Rajeg
<a itemprop="sameAs" content="https://orcid.org/0000-0002-2047-8621" href="https://orcid.org/0000-0002-2047-8621" target="orcid.widget" rel="noopener noreferrer" style="vertical-align:top;"><img src="https://orcid.org/sites/default/files/images/orcid_16x16.png" style="width:1em;margin-right:.5em;" alt="ORCID iD icon"></a>
</br>University of Oxford, UK; Centre for Interdisciplinary Research on
the Humanities and Social Sciences (CIRHSS) & CompLexico research group,
Udayana University

<!-- README.md is generated from README.Rmd. Please edit that file -->

# Overview

<!-- badges: start -->

[![](https://img.shields.io/badge/doi-10.17605/OSF.IO/PU4VG-lightblue.svg)](https://doi.org/10.17605/OSF.IO/PU4VG)
<!-- badges: end -->

This is a repository for the digitised Mentawai-Dutch word list
presented in von Rosenberg ([1853: 428–433](#ref-VonRosenberg1853)). The
practical motivation for this repository is as a practice to use the
[`cldfbench`](https://pypi.org/project/cldfbench/) workflow in Python
([Forkel 2023](#ref-forkel_cldfbench_2023); [Forkel & List
2020](#ref-forkel_cldfbench_2020)) to implement the Cross-Linguistic
Data Format (CLDF) ([Forkel et al.
2018](#ref-forkel_cross-linguistic_2018)). Another motivation is
theoretical, namely to document this legacy data in a computer-readable
format, supporting an on-going [research on the languages of the Barrier
Islands, in Sumatra,
Indonesia](https://www.indonesianlanguages.org/home/barrier-islands-languages/),
extending the [Enggano language
project](https://enggano.ling-phil.ox.ac.uk).

After a long trial and error before the successful conversion into CLDF,
the next step is to practice how to handle the orthography via
`cldfbench`, especially the Cross-Linguistic Transcription System
(CLTS). The original dataset prior to CLDF conversion has included
[orthography
profile](https://github.com/complexico/mentawai-word-list-1853/blob/main/data/ortho-profile-mentawai1853.tsv),
[segmentation and IPA
transcription](https://github.com/complexico/mentawai-word-list-1853/blob/main/data/mentawai1853.tsv)
using the `qlcData` R package ([Moran & Cysouw
2018](#ref-moran_unicode_2018)).

I have mainly referred to tutorials by List
([2021](#ref-list_converting_2021)) and Martinovic
([2022](#ref-martinovic_converting_2022)), but also looking/playing
around with codes provided in other CLDF datasets (e.g., [Z’graggen
2021](#ref-zgraggen_cldf_2021); [Barlow & Killian
2023](#ref-barlow_cldf_2023)).

## History

Before the CLDF conversion using Python, the materials in this
repository (inside the
[data](https://github.com/complexico/mentawai-word-list-1853/tree/main/data)
directory) were processed using R as an RStudio project (the R scripts
are in the
[codes](https://github.com/complexico/mentawai-word-list-1853/tree/main/codes)
directory).

Additional curation performed on the original list includes:

1.  adding the English gloss of the Dutch (via DeepL translator using
    the `deeplr` R package ([Zumbach & Bauer
    2023](#ref-zumbach_deeplr_2023)))

2.  [mapping the
    gloss](https://github.com/complexico/mentawai-word-list-1853/blob/main/data/mentawai-gloss-mapped-to-edit_1853-270.tsv)
    into the Concepticon using `pyconcepticon` ([Forkel
    2022](#ref-forkel_pyconcepticon_2022)), following the tutorial in
    Tjuka ([Tjuka 2020](#ref-tjuka_adding_2020)).

3.  creating an [orthography
    profile](https://github.com/complexico/mentawai-word-list-1853/blob/main/data/ortho-profile-mentawai1853.tsv).

# References

<div id="refs" class="references csl-bib-body hanging-indent"
entry-spacing="0">

<div id="ref-barlow_cldf_2023" class="csl-entry">

Barlow, Russell & Don Killian. 2023. CLDF dataset derived from Barlow
and Killian’s "Tomoip Wordlist" from 2023. Zenodo.
<https://doi.org/10.5281/zenodo.8437515>.

</div>

<div id="ref-forkel_pyconcepticon_2022" class="csl-entry">

Forkel, Robert. 2022. Pyconcepticon: Programmatic curation of
concepticon-data. (2 June, 2023).

</div>

<div id="ref-forkel_cldfbench_2023" class="csl-entry">

Forkel, Robert. 2023. Cldfbench: Python library implementing a CLDF
workbench. <https://github.com/cldf/cldfbench>. (5 July, 2024).

</div>

<div id="ref-forkel_cldfbench_2020" class="csl-entry">

Forkel, Robert & Johann-Mattis List. 2020. CLDFBench: Give Your
Cross-Linguistic Data a Lift. In *Proceedings of the Twelfth Language
Resources and Evaluation Conference*, 6995–7002. Marseille, France:
European Language Resources Association.
<https://aclanthology.org/2020.lrec-1.864>. (7 June, 2023).

</div>

<div id="ref-forkel_cross-linguistic_2018" class="csl-entry">

Forkel, Robert, Johann-Mattis List, Simon J. Greenhill, Christoph
Rzymski, Sebastian Bank, Michael Cysouw, Harald Hammarström, Martin
Haspelmath, Gereon A. Kaiping & Russell D. Gray. 2018. Cross-Linguistic
Data Formats, advancing data sharing and re-use in comparative
linguistics. *Scientific Data*. Nature Publishing Group 5(1). 180205.
<https://doi.org/10.1038/sdata.2018.205>.

</div>

<div id="ref-list_converting_2021" class="csl-entry">

List, Johann-Mattis. 2021. Converting the Vietic Dataset by Sidwell and
Alwes from 2021 to CLDF. Billet. *Computer-Assisted Language Comparison
in Practice*. <https://doi.org/10.58079/m6la>.

</div>

<div id="ref-martinovic_converting_2022" class="csl-entry">

Martinović, Viktor. 2022. Converting Streitberg’s Gothic Dictionary to a
CLDF Wordlist on a Windows System. Billet. *Computer-Assisted Language
Comparison in Practice*. <https://doi.org/10.58079/m6lg>.

</div>

<div id="ref-moran_unicode_2018" class="csl-entry">

Moran, Steven & Michael Cysouw. 2018. *The Unicode cookbook for
linguists: Managing writing systems using orthography profiles*
(Translation and Multilingual Natural Language Processing 10). Berlin:
Language Science Press. <https://doi.org/10.5281/zenodo.1296780>.

</div>

<div id="ref-tjuka_adding_2020" class="csl-entry">

Tjuka, Annika. 2020. Adding concept lists to Concepticon: A guide for
beginners. *Computer-Assisted Language Comparison in Practice*.
<https://doi.org/10.58079/m6kj>.

</div>

<div id="ref-VonRosenberg1853" class="csl-entry">

Von Rosenberg, Hermann. 1853. De Mentawei-Eilanden en Hunne Bewoners.
*Tijdschrift voor Indische Taal-, Land- en Volkenkunde* 1. 403–440.
<https://www.digitale-sammlungen.de/en/view/bsb10433845?page=450,451>.

</div>

<div id="ref-zgraggen_cldf_2021" class="csl-entry">

Z’graggen, John Anton. 2021. CLDF dataset derived from Z’graggen’s
"Madang Comparative Wordlists" from 1980. Zenodo.
<https://doi.org/10.5281/zenodo.5121535>.

</div>

<div id="ref-zumbach_deeplr_2023" class="csl-entry">

Zumbach, David & Paul C. Bauer. 2023. Deeplr: Interface to the ’DeepL’
Translation API. <https://cran.r-project.org/package=deeplr>. (5 July,
2024).

</div>

</div>
