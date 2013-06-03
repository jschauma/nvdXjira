#!/usr/bin/env python

version = (0, 0, 4)
__version__ = '.'.join([str(b) for b in version])
__author__ = 'Jan Schaumann'
__email__ = 'jschauma@netmeister.org'

from distutils.core import setup

setup(
  name='nvdXjira',
  version=__version__,
  description='Cross-reference CVEs from the NVD with Jira',
  author=__author__,
  author_email=__email__,
  url='https://github.com/jschauma/nvdXjira',
  scripts = ['src/nvdXjira'],
  data_files = [ ('man/man1', [ 'doc/nvdXjira.1.gz' ])]
  )
