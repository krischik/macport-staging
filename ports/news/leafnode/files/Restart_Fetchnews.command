#!/opt/local/bin/zsh

setopt X_Trace;

if test "${USER}" = "root"; then
    if test ! -L /Library/LaunchDaemons/org.macports.fetchnews.plist; then
	ln -s											\
	    /opt/local/etc/LaunchDaemons/org.macports.leafnode/org.macports.fetchnews.plist	\
	    /Library/LaunchDaemons/org.macports.fetchnews.plist					;
    fi;

    launchctl unload -w /Library/LaunchDaemons/org.macports.fetchnews.plist
    launchctl load   -w /Library/LaunchDaemons/org.macports.fetchnews.plist
else
    sudo ${0};
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
