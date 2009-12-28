#!/bin/echo usage: source

setopt No_X_Trace;

case "${OSTYPE}" in
    ((darwin10*))
	typeset  General_Variants="+universal"
    ;;
    ((darwin9*))
	typeset  General_Variants=""
    ;;
esac;

if test ! -d ${0:r:h}/${HOST}; then
    mkdir ${0:r:h}/${HOST}
fi;

typeset       Qt_Variants="+docs+cocoa"
#typeset   Gnome_Variants="+quartz+no_X11"
typeset    Gnome_Variants="+x11"

if test -d "/Volumes/Work/MacPorts"; then
    typeset Base_Work_Dir="/Volumes/Work/MacPorts/dports"
elif test -d "/Volumes/Shared/MacPorts"; then
    typeset Base_Work_Dir="/Volumes/Shared/MacPorts/dports"
elif test -d "/Volumes/Shared-1/MacPorts"; then
    typeset Base_Work_Dir="/Volumes/Shared-1/MacPorts/dports"
fi;

path=/opt/local/bin
path+=/bin
path+=/sbin
path+=/usr/bin
path+=/usr/sbin
path+=/usr/local/bin
path+=/usr/X11/bin

typeset -x -g -U -T PKG_CONFIG_PATH pkg_config_path ':';

pkg_config_path+="/opt/local/share/pkgconfig";
pkg_config_path+="/opt/local/libexec/qt4-mac/lib/pkgconfig";
pkg_config_path+="/opt/local/lib/pkgconfig";

function Load ()
    {
    local in_PList="${1}"

    if test -e ${in_PList}; then
        launchctl load -w ${in_PList}
    fi;

    return;    
    } # Load

function Load_System ()
    {
    Load "/Library/LaunchDaemons/org.macports.dbus.plist";
    Load "/Library/LaunchDaemons/org.macports.slapd.plist";
    Load "/Library/LaunchDaemons/org.freedesktop.dbus-system.plist";
    Load "/Library/LaunchDaemons/org.macports.gdm.plist";
    Load "/Library/LaunchDaemons/org.macports.rsyncd.plist";
    Load "/Library/LaunchDaemons/org.macports.spamd.plist";

    return;
    } # Load_System

function Load_User ()
    {
    Load "/Library/LaunchAgents/org.freedesktop.dbus-session.plist;"

    if test -d /Applications/MacPorts/KDE4/kdeinit4.app; then
	open /Applications/MacPorts/KDE4/kdeinit4.app
    fi;

    return;
    } # Load_User

function Unload ()
    {
    local in_PList="${1}"

    if test -e ${in_PList}; then
        launchctl unload -w ${in_PList}
    fi;

    return;    
    } # Unload

function Unload_System ()
    {
    Unload "/Library/LaunchDaemons/org.macports.dbus.plist";
    Unload "/Library/LaunchDaemons/org.macports.rsyncd.plist";
    Unload "/Library/LaunchDaemons/org.macports.spamd.plist";
    Unload "/Library/LaunchDaemons/org.freedesktop.dbus-system.plist";
    Unload "/Library/LaunchDaemons/org.macports.gdm.plist";

    return;    
    } # Unload_System

function Unload_User ()
    {
    Unload "/Library/LaunchAgents/org.freedesktop.dbus-session.plist;"

    return;
    } # Unload_User

function Install_Update ()
    {
    local in_Package="${1}";
    local in_Options="${2}";

    if ! port install ${=in_Package} ${=in_Options}; then
        port upgrade --enforce-variants ${=in_Package} ${=in_Options};  
    fi;

    port activate -f  ${=in_Package} ${=in_Options} || true;
    return
    } # Install_Update

function Force_Activate ()
    {
    local I;
    
    for I in				    \
	"dbus"				    \
	"oxygen-icons ${=Qt_Variants}"	    \
	"kdebase4-runtime ${=Qt_Variants}"  \
	"kdelibs4 ${=Qt_Variants}"	    \
	"taglib-devel"			    \
	"gnome-menus ${Gnome_Variants}"	    ;
    do
	Install_Update ${I} ${General_Variants};
    done; unset I

    return
    } # Force_Activate

function No_Universal ()
    {
    local I;
    
    for I in				    \
	"dbacl"				    \
	"evolution-data-server"		    \
	"libgweather"			    \
	"openldap"			    \
	"python24"			    \
	"python25"			    \
	"python26"			    \
	"py25-cairo"			    \
	"py25-gobject"			    \
	"py25-gtk"			    \
	"dbus-python25"			    \
	"speex"				    ;
    do
	Install_Update ${I};
    done; unset I

    return
    } # No_Universal

function Update ()
    {
    pushd "${Base_Work_Dir}";
	#sudo -u martin svn cleanup
	sudo -u martin svn revert PortIndex*
	sudo -u martin svn update
	sudo -u martin portindex
    popd;

    port selfupdate;
    port sync;
    port deactivate kdelibs4;
    port upgrade qt4-mac;
    port activate kdelibs4;
    port -p upgrade --enforce-variants outdated;

    return
    } # Update

function Clean ()
    {
    #port -p uninstall inactive		    ;
    #port -f clean --all all		    ;

    return
    } # Clean

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
