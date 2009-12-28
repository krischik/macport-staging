#!/opt/local/bin/zsh

source ${0:h}/Setup.command

setopt X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    gcc_select gcc42

    Update;
    No_Universal;
    Force_Activate

    for I in					    \
	"atari800"				    \
	"free42"				    \
	"glassfishv3"				    \
	"derby-server"				    \
	"leafnode"				    \
	"nonpareil"				    \
	"nrg4iso"				    \
	"oorexx"				    \
	"sigil"					    ;
    do
	port install ${=I} ${=General_Variants}
    done; unset I

    gcc_select gnat-gcc
else
    setopt Multi_OS;

    sudo ${0:a} 1>&1 2>&2 &>${0:r:h}/${HOST}/${0:r:t}.out;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
