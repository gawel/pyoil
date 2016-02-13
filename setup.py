# -*- coding: utf-8 -*-
import os
from setuptools import setup
from setuptools import find_packages

version = '0.1.dev0'


def read(*rnames):
    return open(os.path.join(os.path.dirname(__file__), *rnames)).read()


setup(
    name='pyoil',
    version=version,
    description="pyoil package",
    long_description=read('README.rst'),
    classifiers=[
        'Intended Audience :: Developers',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'License :: OSI Approved :: MIT License',
    ],
    keywords='',
    author='Gael Pasgrimaud',
    author_email='gael@gawel.org',
    url='https://github.com/gawel/pyoil/',
    license='MIT',
    packages=find_packages(exclude=['docs', 'tests']),
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        'tinydb',
        'bottle',
        'gevent',
        'chaussette',
    ],
    extras_require={
        'test': [
            'pytest', 'webtest',
        ],
    },
    entry_points="""
    [console_scripts]
    pyoil = pyoil:main
    """,
)
