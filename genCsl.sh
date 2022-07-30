#!/bin/sh

#===============================================================================
# This script will generate a LDCad compatible compressed shadow library file.
#  It does so by compressing the relevant files from the current folder.
#
# notes
#  It's best to first delete an existing file.
#
# author: Roland Melkert 2022-07-30
# todo: Add delete with confirmation.
#===============================================================================

if [ "$1" = "" ]
then
  echo "genCsl.sh <archiveName>"
  exit
fi

if [ -e "parts" ]
then
  zip -9 -r $1 parts p LICENSE.md README.md
else
  echo "Parts folder is missing"
fi

