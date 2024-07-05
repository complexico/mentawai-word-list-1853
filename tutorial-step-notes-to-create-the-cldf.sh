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
## IMPORTANT: ensure the name of column in sentence case.

# 10. create a language file in `etc` folder
touch etc/languages.tsv
nano etc/languages.tsv # add manually

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