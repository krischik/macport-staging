#!/opt/local/bin/zsh

setopt X_Trace

sudo dscl . -create /Groups/gnat
sudo dscl . -create /Groups/gnat UniqueID 131 
sudo dscl . -create /Users/gnat
sudo dscl . -create /Users/gnat UserShell /bin/false
sudo dscl . -create /Users/gnat RealName "GNAT Administrator"
sudo dscl . -create /Users/gnat UniqueID 131
sudo dscl . -create /Users/gnat PrimaryGroupID 31
sudo dscl . -create /Users/gnat NFSHomeDirectory /Users/Shared

sudo defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add gnat

# vim: textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab
# vim: filetype=zsh encoding=latin1 fileformat=unix
