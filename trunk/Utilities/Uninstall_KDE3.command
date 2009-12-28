#!/opt/local/bin/zsh

setopt X_Trace;

if test "${USER}" = "root"; then
    for I in			    \
	"kde"			    \
	"kde-i18n-german"	    \
	"kde-i18n-russian"	    \
	"kde-i18n-ukranian"	    \
	"kdeaccessibility3"	    \
	"kdeaddons3"		    \
	"kdeartwork3"		    \
	"kdebase3"		    \
	"kdeedu3"		    \
	"kdegames3"		    \
	"kdegraphics3"		    \
	"kdelibs3"		    \
	"kdenetwork3"		    \
	"kdepim3"		    \
	"kdesdk3"		    \
	"kdetoys3"		    \
	"kdeutils3"		    \
	"kdewebdev3"		    \
	"gmake"			    \
	"qt3"			    ;
    do
	port uninstall --follow-dependents "${I}"
    done; unset I
else
    setopt Multi_OS;
    sudo ${0} 1>&1 2>&2 &>${0:r:r}/${HOST}/${0:r:h}.out;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
