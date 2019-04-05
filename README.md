# linux_profile


### Snakemake syntax highligth in vim


A vim syntax highlighting definition for Snakemake is available here. You can copy that file to `$HOME/.vim/syntax` directory and add
```
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake
```
to your `$HOME/.vimrc` file. Highlighting can be forced in a vim session with `:set syntax=snakemake`.

For more details on syntax highligth, vist the sit [here] (https://snakemake.readthedocs.io/en/stable/project_info/faq.html?highlight=syntax%20highlight#how-do-i-enable-syntax-highlighting-in-vim-for-snakefiles)
