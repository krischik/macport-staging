#!/bin/zsh

source ${0:h}/Setup.command

setopt No_X_Trace;
setopt Multi_OS;

sudo port install								    \
    "gcc_select" ${=General_Variants}						    \
    "zsh-devel" "+doc" "+mp_completion" ${=General_Variants}			    \
    "subversion" "+bash_completion" "+tools" "+unicode_path" ${=General_Variants}   \
    1>&1 2>&2 &>${0:r:h}/${HOST}/${0:r:t}.out							    ;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
