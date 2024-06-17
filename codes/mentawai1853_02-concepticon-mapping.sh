# running pyconcepticon on terminal
## assuming I already created virtual environment "myenv" in `cldf_project` direactory
## already installed the relevant Python packages
## and already downloaded the Concepticon database in the `concepticon/concepticon-data` directory

# go the the relevant directory
cd /Users/Primahadi/Documents/cldf_project

# activate the virtual environment
source myenv/bin/activate

# go the concepticon directory
cd concepticon/concepticon-data

# run the concept mapping for English
concepticon map_concepts /Users/Primahadi/Documents/research/barrier-islands-mentawai-wlist1853/data/mentawai-gloss-to-map_1853-270.tsv --output /Users/Primahadi/Documents/research/barrier-islands-mentawai-wlist1853/data/mentawai-gloss-mapped-to-edit_1853-270.tsv

# run the concept mapping for Dutch
concepticon map_concepts /Users/Primahadi/Documents/research/barrier-islands-mentawai-wlist1853/data/mentawai-dutch-gloss-to-map_1853-270.tsv --language nl --output /Users/Primahadi/Documents/research/barrier-islands-mentawai-wlist1853/data/mentawai-dutch-gloss-mapped-to-edit_1853-270.tsv

# go back to the main directory
cd /Users/Primahadi/Documents/research/barrier-islands-mentawai-wlist1853
