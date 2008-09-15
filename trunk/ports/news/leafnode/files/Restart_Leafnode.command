#!/opt/local/bin/zsh

if test "${USER}" = "root"; then
    launchctl unload -w /opt/local/etc/LaunchDaemons/org.macports.leafnode/org.macports.leafnode.plist
    launchctl load   -w /opt/local/etc/LaunchDaemons/org.macports.leafnode/org.macports.leafnode.plist
else
    sudo ${0};
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
