#!/opt/local/bin/zsh

setopt X_Trace;

if test "${USER}" = "root"; then
    if test ! -L /Library/LaunchDaemons/org.macports.texpire.plist; then
	ln -s										    \
	    /opt/local/etc/LaunchDaemons/org.macports.leafnode/org.macports.texpire.plist   \
	    /Library/LaunchDaemons/org.macports.texpire.plist				    ;
    fi;

    launchctl unload -w	/Library/LaunchDaemons/org.macports.texpire.plist
    launchctl load   -w	/Library/LaunchDaemons/org.macports.texpire.plist
else
    sudo ${0};
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
