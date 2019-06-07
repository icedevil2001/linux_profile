#!/bin/bash

mkdir -p $HOME/.vim/syntax/
wget  https://bitbucket.org/snakemake/snakemake/raw/master/misc/vim/syntax/snakemake.vim -P $HOME/.vim/syntax/
vim_profile=$HOME/.vimrc
text='''\nau BufNewFile,BufRead Snakefile set syntax=snakemake\nau BufNewFile,BufRead *.smk set syntax=snakemake'''
if [ -e "${vim_profile}" ]; then
	echo "Add the following text to: ${vim_profile}"
	echo "##########################################"
	echo -e $text
	echo
	echo "##########################################"
else
	echo -e $text > ${vim_profile} 
fi