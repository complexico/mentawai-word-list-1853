from setuptools import setup
import json

with open('metadata.json', encoding='utf-8') as fp:
    metadata = json.load(fp)

setup(
    name='cldfbench_barrier-islands-mentawai-wlist1853',
    description=metadata['title'],
    license=metadata.get("license", ""),
    url=metadata.get("url", ""),
    py_modules=['cldfbench_barrier-islands-mentawai-wlist1853'],
    include_package_data=True,
    zip_safe=False,
    entry_points={
        'cldfbench.dataset': [
            'barrier-islands-mentawai-wlist1853=cldfbench_barrier-islands-mentawai-wlist1853:Dataset',
        ]
    },
    install_requires=[
        'cldfbench',
    ],
    extras_require={
        'test': [
            'pytest-cldf',
        ],
    },
)
