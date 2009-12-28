#!/opt/local/bin/zsh

source ${0:h}/Setup.command

setopt X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    Unload_System;

    gcc_select gcc42;

    Update;
    No_Universal;
    Force_Activate;

    port -p deactivate kdelibs3 kdelibs4 libevent
    port -v install qt4-mac ${=Qt_Variants}

    for I in				\
	"akonadi +docs"			\
	"kdelibs4 +docs"		\
	"kdebase4 +docs"		\
	"kdeutils4 +docs"		\
	"kdepim4 +docs"			\
	"kdemultimedia4 +docs"		\
	"kdegraphics4 +docs"		\
	"kdegames4 +docs"		\
	"VLC +huge+qt4"			;
    do
	port install ${=I} ${=Qt_Variants}
    done; unset I

    gcc_select gnat-gcc
    
    sudo gchown -R ${1} ~/Library/Preferences/KDE

    #Clean;
    Load_System;
else
    setopt Multi_OS;
    
    Unload_User;
    sudo ${0:a} ${USER} 1>&1 2>&2 &>${0:r:h}/${HOST}/${0:r:t}.out;
    Load_User;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
