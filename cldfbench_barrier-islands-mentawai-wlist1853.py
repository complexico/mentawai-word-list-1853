# This code looks very messy and contain many commented code because:
# - this is my first time experimenting with Python + cldfbench
# - so I did trial and error using/fixing/matching processing codes from different examples from Lexibank repository.
# - at the moment, the active codes work for me, provided the similar data structure (column names, capitalisation, etc.) in the raw and etc.
# I attempt to make a more detailed documentation for how I managed to get this workflow running (including the required data structures)

import pathlib
import re
# import json

import attr
from clldutils.misc import slug
from pylexibank import Language, FormSpec, Concept
from pylexibank.dataset import Dataset as BaseDataset
# from pylexibank.util import progressbar

@attr.s
class CustomLanguage(Language):
    Sources = attr.ib(default=None)

@attr.s
class CustomConcept(Concept):
    Number = attr.ib(default=None)

def cln(word): return re.sub("[†\\d\\.\\*\\?\\~]", "", word)

class Dataset(BaseDataset):
    dir = pathlib.Path(__file__).parent
    id = "barrier-islands-mentawai-wlist1853"
    language_class = CustomLanguage
    # form_spec = FormSpec(missing_data=["∅", "#", "NA", 'XX', '*#', '<NA>'], normalize_unicode="NFC")
    form_spec = FormSpec(normalize_unicode="NFC", separators = ",")
    concept_class = CustomConcept

    #def cldf_specs(self):  # A dataset must declare all CLDF sets it creates.
    #    from cldfbench import CLDFSpec
    #    return CLDFSpec(dir=self.cldf_dir, module='Wordlist')

    def cmd_download(self, args):
        """
        Download files to the raw/ directory. You can use helpers methods of `self.raw_dir`, e.g.

        # >>> self.raw_dir.download(url, fname)
        """
        pass

# from pathlib import Path

# import pylexibank
# from clldutils.misc import slug


# class Dataset(pylexibank.Dataset):
#     dir = Path(__file__).parent
#     id = "barrier-islands-mentawai-wlist1853"

#     def cmd_makecldf(self, args):
#         args.writer.add_sources()
#         language_lookup = args.writer.add_languages(lookup_factory="Name")
#         concept_lookup = args.writer.add_concepts(
#             id_factory=lambda x: x.number + "_" + slug(x.english), lookup_factory="Name"
#         )

#         for entry in pylexibank.progressbar(
#             self.raw_dir.read_csv("mentawai1853.tsv", delimiter="\t", dicts=True)
#         ):
#             args.writer.add_forms_from_value(
#                 Language_ID=language_lookup[entry["Source"]],
#                 Parameter_ID=concept_lookup[entry["English"]],
#                 Value=entry["Mentawai"],
#                 Source=["VonRosenberg1853"],
#             )

    def cmd_makecldf(self, args):

        args.writer.add_sources()
        args.log.info("added sources")

        # add languages
        languages = args.writer.add_languages(
            id_factory=lambda l: l["Name"], lookup_factory=lambda l: (l["Name"], l["Sources"])
        )
        sources = {k[0]: k[1] for k in languages}

        def cln(word): return re.sub("[†\\d\\.\\*\\?\\~]", "", word)

        # add concept
        concepts = {}
        for i, concept in enumerate(self.concepts):
            idx = str(i + 1) + "_" + slug(concept["Gloss"])
            args.writer.add_concept(
                ID=idx,
                Name=concept["Gloss"],
                Number=concept["Number"],
                Concepticon_ID=concept["Concepticon_ID"],
                Concepticon_Gloss=concept["Concepticon_Gloss"]
            )
            concepts[concept["Gloss"], concept["Concepticon_ID"]] = idx
            #concepts[concept["Concepticon_ID"]] = idx
        args.log.info("added concepts")

        # for row in progressbar(self.raw_dir.read_csv("mentawai1853.tsv", dicts=True, delimiter="\t")):
        #     args.writer.add_forms_from_value(
        #         Local_ID=row["ID"],
        #         Language_ID=row["Doculect"],
        #         #Parameter_ID=idx[row],
        #         Parameter_ID=concepts[cln(row["English"]), cln(row["Gloss"])],
        #         Value=row["Commons"]
        #         #Source=sources[row["Doculect"]],
        #     )

        for idx, row in enumerate(self.raw_dir.read_csv(
            "mentawai1853.tsv", delimiter="\t", dicts=True)):
            args.writer.add_forms_from_value(
                Local_ID=row["ID"],
                Language_ID=row["Doculect"],
                # For the following line of code in getting the Parameter_ID to work, we need to:
                # - ensure that the CONCEPTICON_ID in the raw/main data and in the Concepts.tsv data is the same.
                #   That is, we cannot have CONCEPTICON_ID of NA (in raw/main data) but empty in Concepts.tsv data.
                #   If that is the case, it will throw KeyError such as `KeyError: ('this and that', 'NA')` (in this case, the function found this key: 'this and that', 'NA' in the raw/main data but in the concepts dictionary, it is 'this and that', '', which is different!)
                Parameter_ID=concepts[row["English"], row["CONCEPTICON_ID"]], 
                Value=row["Commons"],
                Source="VonRosenberg1853")
    # def cmd_makecldf(self, args):

    #     # add bib
    #     args.writer.add_sources()
    #     args.log.info("added sources")

    

        

    #     # read in data
    #     data = self.raw_dir.read_csv(
    #         "mentawai1853.tsv", delimiter="\t", 
    #     )
    #     header = data[0]
    #     header[0] = "Gloss"
    #     cognates = {}
    #     cogidx = 1
    #     for i in range(2, len(data), 2):
    #         words = dict(zip(header, data[i]))
    #         cognates = dict(zip(header, data[i+1]))
    #         concept = data[i][0]
    #         for language in languages:
    #             entry = words.get(language).strip()
    #             cog = cognates.get(language).strip()
    #             if entry.replace('#', '').strip():
    #                 if concept+'-'+cog not in cognates:
    #                     cognates[concept+'-'+cog] = cogidx
    #                     cogidx += 1
    #                 cogid = cognates[concept+'-'+cog]
    #                 for lex in args.writer.add_forms_from_value(
    #                         Language_ID=language,
    #                         Parameter_ID=concepts[concept],
    #                         Value=entry,
    #                         Source=sources[language],
    #                         Cognacy=cogid
    #                         ):
    #                     args.writer.add_cognate(
    #                             lexeme=lex,
    #                             Cognateset_ID=cogid,
    #                             Source="VonRosenberg1853"
    #                             )


# from pathlib import Path

# import attr
# from clldutils.misc import slug
# from pylexibank import Language, FormSpec
# from pylexibank.dataset import Dataset as BaseDataset
# from pylexibank.util import progressbar

# @attr.s
# class CustomLanguage(Language):
#     Source = attr.ib(default=None)


# class Dataset(BaseDataset):
#     dir = Path(__file__).parent
#     id = "barrier-islands-mentawai-wlist1853"
#     language_class = CustomLanguage
#     form_spec = FormSpec(separators = ",")


# def cmd_download(self, args):
#         pass

# def cmd_makecldf(self, args):
#         args.writer.add_sources()

#         # add concept
#         concepts = {}
#         for concept in self.concepts:
#             idx = concept["NUMBER"]+"_"+slug(concept["ENGLISH"])
#             concepts[concept["ENGLISH"]] = idx
#             args.writer.add_concept(
#                     ID=idx,
#                     Name=concept["ENGLISH"],
#                     Concepticon_ID=concept["CONCEPTICON_ID"],
#                     Concepticon_Gloss=concept["CONCEPTICON_GLOSS"],
#                     )

#         languages = args.writer.add_languages(
#             id_factory=lambda l: l["Name"], lookup_factory=lambda l: (l["Name"], l["Source"])
#         )
#         sources = {k[0]: k[1] for k in languages}  # language: source map

#         for row in progressbar(self.raw_dir.read_csv("mentawai1853.tsv", dicts=True, delimiter="\t")):
#             args.writer.add_forms_from_value(
#                 Local_ID=row["ID"],
#                 Language_ID=row["Source"],
#                 Parameter_ID=concepts[concept],
#                 Value=row["Mentawai"],
#                 Source=sources[row["Source"]],
#             )