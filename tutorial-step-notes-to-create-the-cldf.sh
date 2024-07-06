# copy the path to Python interpreter in VSCode as follows:
# C:\Users\GRajeg\OneDrive - Nexus365\Documents\cldf\.venv\Scripts\python.exe" on Windows
# /Users/Primahadi/Documents/cldf_project/myenv on Mac

# 1. in VSCode, open the relevant project folder for the word list

# 2. Go to the command palette and type in the path for Python virtual environment interpreter, which is: /Users/Primahadi/Documents/cldf_project/myenv

# 3. Activate the virtual environment
source /Users/Primahadi/Documents/cldf_project/myenv/bin/activate

# 4. Create a CLDF schema inside the existing word list project.
##   To do this, in the --out argument of cldfbench new function call, specify the mother directory of the word list project, which is "research"
##   Then, to specify the existing word list directory, spell out the folder name in the "id:"
cldfbench new --out "/Users/Primahadi/Documents/research/"

	# id: barrier-islands-mentawai-wlist1853
	# title: CLDF dataset derived from von Rosenberg's "De Mentawei-Eilanden en Hunne Bewoners" from 1853
	# license: CC-BY-NC-SA

# 5. copy the raw data into the `raw` folder
cp data/mentawai1853.tsv raw/mentawai1853.tsv

# 6. copy the bib textfile to the `raw` folder
cp vrosenberg1853.bib raw/sources.bib

# 7. edit the setup.py (follow tutorial: https://calc.hypotheses.org/2954)

# 8. edit the metadata.json (follow tutorial: https://calc.hypotheses.org/2954)

# 9. create a new concepts.tsv file in `etc` folder
## we can copy from "data/mentawai-gloss-mapped-to-edit_1853_270.tsv"
## this file already has CONCEPTICON_GLOSS, CONCEPTICON_ID, GLOSS, and NUMBER, like the example in here: https://github.com/lexibank/sidwellvietic/blob/main/etc/concepts.tsv
cp data/mentawai-gloss-mapped-to-edit_1853-270.tsv etc/concepts.tsv
## IMPORTANT: ensure the name of column is in sentence case to match with the parameters in the .py CLDF conversion code

# 10. create a language file in `etc` folder
touch etc/languages.tsv
nano etc/languages.tsv # add manually (because for now it is only for one language)
# The columns include: 
# - ID (abbreviated label of the language OR number)
# - Name (if possible, match this with the language name in Glottolog)
# - Sources (match this with the BibTex key in the .bib file, and in the wordlist reference)
# - Glottocode
# - Glottolog_Name

# check the content with tree.com (on Windows)
tree.com //f etc 

# check the content with tree (on Mac; install tree first using brew install tree)
tree -v --charset utf-8

# 11. If we want to test the configuration .py script in terminal, before we do that, select the myenv python environment so that the python is run in virtual environment that already has the cldf-related packages

# Concepticon path
# "/Users/Primahadi/Documents/cldf_project/concepticon/concepticon-data"

# Glottolog path
# "/Users/Primahadi/Documents/cldf_project/glottolog-glottolog-d9da5e2"

# Clts path
# "/Users/Primahadi/Documents/cldf_project/cldf-clts-clts-6dc73af"

# If we want to specify the optional arguments concepticon and clts, we need to prefix the makecldf with lexibank as lexibank.makecldf as in the following codes.
cldfbench lexibank.makecldf cldfbench_barrier-islands-mentawai-wlist1853.py --glottolog "/Users/Primahadi/Documents/cldf_project/glottolog-glottolog-d9da5e2" --concepticon "/Users/Primahadi/Documents/cldf_project/concepticon/concepticon-data" --clts "/Users/Primahadi/Documents/cldf_project/cldf-clts-clts-6dc73af"

# to create an orthography profile (with a guess to possible IPA form/phoneme) from the Form col. in cldf/forms.csv using pylexibank (cf. List (2021: section 6)): https://calc.hypotheses.org/2954
# cldfbench lexibank.init_profile cldfbench_barrier-islands-mentawai-wlist1853.py --clts "/Users/Primahadi/Documents/cldf_project/cldf-clts-clts-6dc73af"

## note on orthography workflow
- # we could add an orthography profile file (orthography.tsv) in `etc` directory that we previously created using qlcData and manually edited (## ensure we already have the IPA match of the grapheme as well!)
- # the file must contain column names in this order and in this exact case: Grapheme | IPA | Frequence | Codepoints (the Grapheme can be taken from the Replacement column in the original, qlcData-based orthography profile)
- # then run the CLDF conversion again
- # However, there can be issues:

    # - If we take the Grapheme column from the common transcription (which is used in the Form of forms.csv), there can be duplicated Graphemes but supposedly for different IPA (e.g., the Dutch "sch" is transform into common orthography "s" but with IPA /ʃ/; meanwhile, the regular "s" gets IPA /s/).
    # - Solution 1: the Grapheme in orthography can be based on the original transcription matched with the possible IPA (so APPARENTLY THE CONTEXTUAL REPLACEMENT CAN BE HANDLED AS A REGEX STRING IN THE GRAPHEME column)
    # - Solution 2: use the args.writer.add_form_with_segments to add both the original, common transcription, and IPA transcription (BUT the raw data needs to be split when a cell has multiple forms!)
    # - Solution 3 (following Solution 1): check if we can add a costume column name to add the common transcription
    # - Solution 4 (following Solution 1): the contextual replacement (in the original orthography) perhaps need to be spelt out individually as a separate line in the Grapheme section
    