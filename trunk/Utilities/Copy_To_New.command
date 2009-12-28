#!/opt/local/bin/zsh

setopt X_Trace;

if test "${USER}" = "root"; then
    pushd "/opt/local.10.5"
	for I in					    \
	    **/CVS(/)					    \
	    bin/startkde				    \
	    etc/LaunchDaemons/org.macports.fetchmail.plist  \
	    etc/dbus-1/system.d/avahi-dbus.conf		    \
	    etc/dovecot/dovecot.conf			    \
	    etc/dovecot/mkcert.zsh			    \
	    etc/dovecot/passwd.dovecot			    \
	    etc/dovecot/renewcert.zsh			    \
	    etc/dovecot/userdb.dovecot			    \
	    etc/leafnode/config				    \
	    etc/rsyncd.conf				    \
	    etc/ssl					    \
	    var/log					    \
	    var/run/dovecot	    			    \
	    var/run/fetchmail	    			    \
	    var/spool/news	    			    ;
	do
	    gmv --verbose "${I}" "/opt/local/${I}";
	done; unset I
    popd;

    pushd "/opt/local"
	/bin/chmod +a "martin allow write"	    \
	    Applications			    \
	    Applications/Utilities		    \
	    .					    \
	    bin					    \
	    etc					    \
	    etc/LaunchDaemons			    \
	    etc/dovecot				    \
	    etc/macports			    ;
    popd;
else
    setopt Multi_OS;
    sudo ${0} 1>&1 2>&2 &>${0:r:h}/${HOST}/${0:r:t}.out;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
