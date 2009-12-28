#!/opt/local/bin/zsh

source ${0:h}/Setup.command

setopt X_Trace;

if test "${USER}" = "root"; then
    Unload_System;

    gcc_select gcc42

    Update;
    No_Universal;
    Force_Activate;

    for I in						    \
	"pango"						    \
	"gtk2"						    \
	"gtk-engines2"					    \
	"gtk-theme-switch"				    \
	"gtkspell2"					    \
	"gconf"						    \
	"gmime"						    \
	"gnome-control-center"				    \
	"gnome-platform-suite"				    \
	"gnome-desktop-suite"				    \
	"gnome-desktop"					    \
	"gnome-icon-theme"				    \
	"gnome-keyring"					    \
	"gnome-menus"					    \
	"gnome-mime-data"				    \
	"gnome-panel"					    \
	"gnome-session"					    \
	"gnome-settings-daemon"				    \
	"gnome-terminal"				    \
	"gnome-themes"					    \
	"gqview"					    \
	"gimp-app +animation +help_browser +gvfs"	    \
	"gimp-user-manual +de"				    \
	"pan2"						    ;
    do
	port install ${=I} ${=General_Variants} ${=Gnome_Variants}
    done; unset I

    gcc_select gnat-gcc
    Clean;
    Load_System;    
else
    setopt Multi_OS;

    Unload_User;
    sudo ${0:a} 1>&1 2>&2 &>${0:r:h}/${HOST}/${0:r:t}.out;
    Load_User
fi;

# To start gnome put "exec gnome-session" in your .xinitrc
# See also http://trac.macports.org/wiki/GNOME
# sudo launchctl load -w /Library/LaunchDaemons/org.macports.dbus.plist
# 
# sudo port install python_select
# sudo python_select python26
#
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
