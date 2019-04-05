#!/usr/bin/bash

if [[ "$OS" = "Linux" ]]; then
    # alias ls="/bin/ls -F --color=auto"
#     # Linux has its own timestamp formatting. Breaks project-mgmt. Bad Linux!
    alias projls="/bin/ls --time-style=+'%b %e %H:%M'"
#     # enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls -GpFhf --color=auto'
	alias ll="ls -alFv --group-directories-first"
        alias dir='dir --color=auto'
        alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi
    
else
    alias ls="/bin/ls -FG" ## mac color 
    alias ll='ls -alF'
    alias projls="/bin/ls"
fi
# some more ls aliases

alias la='ls -A'
alias l='ls -CF'
# alias ls='ls -GpFhf --color'  	   # No sort
alias lx='ls -lXB'         # Sort by extension.
alias lk='ls -lSr'         # Sort by size, biggest last.
alias lt='ls -ltr'         # Sort by date, most recent last.
alias lc='ls -ltcr'        # Sort by/show change time,most recent last.
alias lu='ls -ltur'        # Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:

alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

alias l='ls -CF'

# alias ll='ls -FGlAhp'

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# convenience aliases
alias c="clear"

# typos
alias whios="whois"
alias mroe="more"
alias More="more"
alias Grep="grep"
alias chkcofnig="chkconfig"
alias qstats='qstat'


alias rm='rm -i'                            # 
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias h='history'
alias j='jobs -l'
alias qstat='qstat -f -u \*'
# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias qstat='qstat -f'

alias du='du -kh'    # Makes a more readable output.
alias df='df -h'
#alias df='df -kTh'

# Just in case I'm somewhere that all the fancy color stuff doesn't
# work right, or I'm running screen, I can use this.
# alias simpleprompt='export PS1="\u@$(_short_hname):\w{\$?}[\j]\\$ "'

# print the directory structure from the current directory in tree format
alias dirf="find . -type d|sed -e 's/[^-][^\/]*\//  |/g' -e 's/|\([^ ]\)/|-\1/'"

# find name...
alias fn="find . -name"

# file list without trailing type characters or anything.
alias fl="/bin/ls | cat"
alias fla="/bin/ls -a | cat"

# Show me time in GMT / UTC
alias utc="TZ=UTC date"
alias gmt="TZ=GMT date"
# Time in Tokyo
alias jst="TZ=Asia/Tokyo date"

# Tell me what OS this is
alias os="$uname -srm"

# Count something fed in on stdin
alias count="sort | uniq -c | sort -n"

# reload bash config
alias reload="source ~/.bash_profile "

# commands starting with % for pasting from web
alias %=" "