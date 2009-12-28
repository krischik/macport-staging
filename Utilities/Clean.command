#!/opt/local/bin/zsh

source ${0:h}/Setup.command

setopt X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    Clean;
    gfind "/opt/local"			    \
	-regextype grep			    \
	-iregex '.\+mp_[[:digit:]]\{10\}'   \
	-exec grm --verbose '{}' ';'
    gfind "/Applications/MacPorts"	    \
	-regextype grep			    \
	-iregex '.\+mp_[[:digit:]]\{10\}'   \
	-exec grm --verbose '{}' ';'
else
    setopt Multi_OS;

    sudo ${0:a} 1>&1 2>&2 &>${0:r:h}/${HOST}/${0:r:t}.out;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
