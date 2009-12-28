#!/opt/local/bin/zsh

setopt X_Trace;

if test "${USER}" = "root"; then
    launchctl unload -w /Library/LaunchDaemons/org.macports.dbus.plist
    launchctl unload -w /Library/LaunchDaemons/org.macports.rsyncd.plist
    launchctl unload -w /Library/LaunchDaemons/org.macports.spamd.plist

    for I in				\
	"kdeadmin4"			\
	"kdeartwork4"			\
	"kdebase4"			\
	"kdegames4"			\
	"kdelibs4"			\
	"kdemultimedia4"		\
	"kdepim4"			\
	"kdepimlibs4"			\
	"kdesdk4"			\
	"kdesupport4"			\
	"qt4-mac"			\
	"dbus"				;
    do
	port uninstall --follow-dependents ${=I}
    done; unset I
else
    setopt Multi_OS;
    sudo ${0} 1>&1 2>&2 &>${0:r:h}/${HOST}/${0:r:t}.out;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
