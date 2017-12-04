#!/bin/bash

echo "Installing cd-shortcut...";
touch ~/.keys.cds
cp cd-shortcut/cds.sh /usr/local/bin/cds;
rm -R cd-shortcut;
echo "cd-shortcut installed. Type 'cds' for help"
