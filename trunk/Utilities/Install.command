#!/opt/local/bin/zsh

source ${0:h}/Setup.command

setopt X_Trace;

if test "${USER}" = "root"; then
    gcc_select gcc42

    Update;
    No_Universal;
    Force_Activate;

    for I in									\
	"acl2"					    				\
	"aspell +nls"				    				\
	"aspell-dict-de"			    				\
	"aspell-dict-en"			    				\
	"aspell-dict-ru"			    				\
	"autoconf"				    				\
	"avahi +mono"				    				\
	"b5i2iso"				    				\
	"bison +yacc"				    				\
	"bitstream-vera"			    				\
	"bzip2"					    				\
	"coreutils"				    				\
	"ctags"					    				\
	"dbacl"					    				\
	"diffutils"				    				\
	"dos2unix"				    				\
	"dovecot +ldap"				    				\
	"enchant"				    				\
	"fetchmail +fetchmailconf+ssl+ntml"	    				\
	"file"									\
	"findutils"				    				\
	"flex"					    				\
	"fugu"					    				\
	"giflib"				    				\
	"gmp"					    				\
	"gnutar"				    				\
	"gsed"					    				\
	"gwhich"				    				\
	"gzip +rsyncable"			    				\
	"hunspell"				    				\
	"hunspell-dict-de_DE"			    				\
	"ImageMagick +graphviz+gs+hdri+jbig+jpeg2+lcms+lqr+mpeg+perl+rsvg+wmf"	\
	"ispell"				    				\
	"jasper +jiv"				    				\
	"jpeg"					    				\
	"liblzma"				    				\
	"libpng"				    				\
	"lzma"					    				\
	"lzmautils"				    				\
	"m4"					    				\
	"mdf2iso"				    				\
	"mpfr"					    				\
	"nrg2iso"				    				\
	"p5-mail-spamassassin +bayes +razor +ssl"   				\
	"p7zip"					    				\
	"pdi2iso"				    				\
	"pgp"					    				\
	"png2ico"				    				\
	"rb-termios"				    				\
	"readline"				    				\
	"rsync +rsyncd"				    				\
	"shared-mime-info"			    				\
	"sitecopy"				    				\
	"spellutils"				    				\
	"star"					    				\
	"texinfo"				    				\
	"tiff"					    				\
	"transmission-x11 +aqua"		    				\
	"uif2iso"				    				\
	"unix2dos"				    				\
	"urw-fonts"				    				\
	"wget"					    				\
	"xpm"					    				;
    do
	port install ${=I} ${=General_Variants}
    done; unset I

    Clean;

    gcc_select gnat-gcc
else
    setopt Multi_OS;

    sudo ${0:a} 1>&1 2>&2 &>${0:r:h}/${HOST}/${0:r:t}.out;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
