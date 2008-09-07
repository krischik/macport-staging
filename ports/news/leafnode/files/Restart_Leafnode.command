#!/opt/local/bin/zsh

sudo launchctl unload -w /opt/local/etc/LaunchDaemons/org.macports.leafnode/org.macports.leafnode.plist
sudo launchctl load   -w /opt/local/etc/LaunchDaemons/org.macports.leafnode/org.macports.leafnode.plist

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
