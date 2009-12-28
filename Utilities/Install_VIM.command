#!/opt/local/bin/zsh

source ${0:h}/Setup.command

setopt X_Trace;

if test "${USER}" = "root"; then
    gcc_select gcc42

    Update;
    No_Universal;
    Force_Activate;

    for I in					    \
	"gnutar ${=General_Variants}"		    \
	"grep ${=General_Variants}"		    \
	"ncurses ${=General_Variants}"		    \
	"libiconv ${=General_Variants}"		    \
	"ctags ${=General_Variants}"		    \
	"perl5 ${=General_Variants}"		    \
	"python26 ${=General_Variants}"		    \
	"autoconf ${=General_Variants}"		    \
	"ruby ${=General_Variants}"		    \
	"tcl ${=General_Variants}"		    \
	"gettext ${=General_Variants}"		    \
	"MacVim +cscope +huge +nls +ruby +xim"	    \
	"vim-app +cscope +huge +nls +ruby +xim"	    ;
    do
	Install_Update ${I};
    done; unset I

    gcc_select gnat-gcc
else
    setopt Multi_OS;
    sudo ${0:a} 1>&1 2>&2 &>${0:r:h}/${HOST}/${0:r:t}.out;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
