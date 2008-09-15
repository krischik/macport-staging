#!/opt/local/bin/zsh

if test "${USER}" = "root"; then
    launchctl stop                                                         org.macports.fetchnews
    launchctl unload -w /opt/local/etc/LaunchDaemons/org.macports.leafnode/org.macports.fetchnews.plist
    launchctl load   -w /opt/local/etc/LaunchDaemons/org.macports.leafnode/org.macports.fetchnews.plist
    launchctl start                                                        org.macports.fetchnews
else
    sudo ${0};
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
