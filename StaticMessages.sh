#!/usr/bin/env bash

export FILENAME="eco-kde-org_www"

function export_pot_file # First parameter is the path of the pot file we have to create, containing $FILENAME
{
    potfile=$1
    hugoi18n extract $potfile
}

function import_po_files # First parameter is the path of a directory containing several .po files named as $lang.po
{
    export LANG=en_US.UTF-8
    podir=$1
    hugoi18n -q compile $podir
    hugoi18n -q generate
}
