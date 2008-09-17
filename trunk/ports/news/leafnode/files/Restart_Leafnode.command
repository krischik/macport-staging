#!/opt/local/bin/zsh

setopt X_Trace;

if test "${USER}" = "root"; then
    if test ! -L /Library/LaunchAgents/org.macports.leafnode.plist; then
        ln -s										    \
	   /opt/local/etc/LaunchDaemons/org.macports.leafnode/org.macports.leafnode.plist   \
	    /Library/LaunchAgents/org.macports.leafnode.plist				    ;
    fi;
    
    launchctl unload -w /Library/LaunchAgents/org.macports.leafnode.plist
    launchctl load   -w /Library/LaunchAgents/org.macports.leafnode.plist
else
    sudo ${0};
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
