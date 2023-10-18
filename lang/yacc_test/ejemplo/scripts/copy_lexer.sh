#!/usr/bin/sh
cp ./src/lexer.l ./src/ddlexer.l
sed -i -r 's/return[ \t]+[_a-zA-Z0-9]+;/ECHO;/g' ./src/ddlexer.l
sed -i 's/lexer./ddlexer./g' ./src/ddlexer.l
