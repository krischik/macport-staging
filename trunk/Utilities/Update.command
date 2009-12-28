#!/opt/local/bin/zsh

source ${0:a:h}/Setup.command

setopt X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    Unload_System

    gcc_select gcc42

    Update;
    Force_Activate;
    No_Universal;
    Clean;

    gcc_select gnat-gcc
    
    Load_System;
else
    setopt Multi_OS;

    Unload_User;
    sudo ${0:a} 1>&1 2>&2 &>${0:r:h}/${HOST}/${0:r:t}.out;
    Load_User;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
