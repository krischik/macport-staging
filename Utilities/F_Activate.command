#!/opt/local/bin/zsh

source ${0:h}/Setup.command

setopt X_Trace;
setopt Err_Exit;

if test "${USER}" = "root"; then
    Unload "/Library/LaunchDaemons/org.freedesktop.dbus-system.plist";

    Force_Activate;
    
    Load "/Library/LaunchDaemons/org.freedesktop.dbus-system.plist"
else
    launchctl unload /Library/LaunchAgents/org.freedesktop.dbus-session.plist
    setopt Multi_OS;
    sudo ${0:a} 1>&1 2>&2 &>${0:r:h}/${HOST}/${0:r:t}.out;
    launchctl load /Library/LaunchAgents/org.freedesktop.dbus-session.plist
    open /Applications/MacPorts/KDE4/kdeinit4.app
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
