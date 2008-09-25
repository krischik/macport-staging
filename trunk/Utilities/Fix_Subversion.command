#!/bin/zsh

setopt Extended_Glob;
setopt Null_Glob;
setopt No_Verbose;
setopt No_X_Trace;
setopt Err_Exit;

case "$(uname)" in
    (CYGWIN*)
	function Set_EA ()
	    {
	    echo "${2}" > "${3}:user.${1}"

	    return;
	    }
    ;;
    (Darwin*)
	function Set_EA ()
	    {
	    xattr -w "user.${1}" "${2}" "${3}"

	    return;
	    }
    ;;
    (*)
	function Set_EA ()
	    {
	    setfattr --name="user.${1}" --value="${2}" "${3}"

	    return;
	    }
    ;;
esac;

pushd $(dirname ${0})/..
    for I in		\
	**/*.ada	\
	**/*.adb	\
	**/*.ads	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type   "text/x-adasrc"			"${I}";
	    svn propset     svn:eol-style   "LF"				"${I}";
	fi;
	Set_EA "mime_type" "text/x-adasrc" "${I}";
    done; unset I

    for I in		\
	**/*.c		\
	**/*.h		;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type   "text/x-csrc"			"${I}";
	    svn propset     svn:eol-style   "LF"				"${I}";
	fi;
	Set_EA "mime_type" "text/x-csrc" "${I}";
    done; unset I

    for I in		\
	**/*.java	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}";
	    svn propdel     svn:executable				    "${I}";
	    svn propset     svn:mime-type   "text/x-java"			"${I}";
	    svn propset     svn:eol-style   "LF"				"${I}";
	fi;
	Set_EA "mime_type" "text/x-java" "${I}";
    done; unset I

    for I in		\
	**/*.rb		;
    do
	chmod +x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}";
	    svn propset     svn:executable  "*"		    "${I}";
	    svn propset     svn:mime-type   "text/x-ruby"   "${I}";
	    svn propset     svn:eol-style   "LF"				"${I}";
	fi;
	Set_EA "mime_type" "text/x-ruby" "${I}";
    done; unset I

    for I in		\
	**/*.cpp	\
	**/*.hpp	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}";
	    svn propdel     svn:executable				    "${I}";
	    svn propset     svn:mime-type   "text/x-c++src"			"${I}";
	    svn propset     svn:eol-style   "LF"				"${I}";
	fi;
	Set_EA "mime_type" "text/x-c++src" "${I}";
    done; unset I

    for I in		\
	**/*.sh		\
	**/*.zsh	\
	**/*.command    \
	**/*.command.in \
	*/*.bash	;
    do
	chmod +x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:mime-type   "text/x-shellscript"		"${I}" ;
	    svn propset     svn:eol-style   "LF"				"${I}" ;
	    svn propset     svn:executable  "*"					"${I}" ;
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}" ;
	fi;
	Set_EA "mime_type" "text/x-shellscript" "${I}";
    done; unset I

    for I in		\
	**/*.rexx	;
    do
	chmod +x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:eol-style "LF"				    "${I}";
	    svn propset     svn:executable "*"				    "${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"  "${I}";
	    svn propset     svn:mime-type "text/x-rexx"			    "${I}";
	fi;
	Set_EA "mime_type" "text/x-rexx" "${I}";
    done; unset I

    for I in		\
	**/*.bat	\
	**/*.cmd	\
	**/*.btm	;
    do
	chmod +x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:eol-style "LF"				    "${I}";
	    svn propset     svn:executable "*"				    "${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"  "${I}";
	    svn propset     svn:mime-type "text/x-dosbatch"		    "${I}";
	fi;
	Set_EA "mime_type" "text/x-dosbatch" "${I}";
    done; unset I

    for I in		\
	**/*.mak	\
	**/Makefile	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:eol-style "LF"				    "${I}";
	    svn propdel     svn:executable				    "${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"  "${I}";
	    svn propset     svn:mime-type "text/x-makefile"		    "${I}";
	fi;
	Set_EA "mime_type" "text/x-makefile" "${I}";
    done; unset I

    for I in		\
	**/*.vim	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable				    "${I}";
	    svn propset     svn:eol-style "LF"				    "${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"  "${I}";
	    svn propset     svn:mime-type "text/x-vim"			    "${I}";
	fi;
	Set_EA "mime_type" "text/x-vim" "${I}";
    done; unset I

    for I in		\
	**/*.diff	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable				"${I}";
	    svn propset     svn:eol-style "LF"				"${I}";
	    svn propdel     svn:keywords				"${I}";
	    svn propset     svn:mime-type "text/x-patch"		"${I}";
	fi;
	Set_EA "mime_type" "text/x-patch" "${I}";
    done; unset I

    for I in		\
	**/*.rpmmacros	\
	**/*.spec	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable				    "${I}";
	    svn propset     svn:eol-style "LF"				    "${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"  "${I}";
	    svn propset     svn:mime-type "text/x-rpm-spec"		    "${I}";
	fi;
	Set_EA "mime_type" "text/x-rpm-spec" "${I}";
    done; unset I

    for I in		\
	**/*.gif	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:eol-style		"${I}";
	    svn propdel     svn:executable		"${I}";
	    svn propdel     svn:keywords		"${I}";
	    svn propset     svn:mime-type "image/gif"	"${I}";
	fi;
	Set_EA "mime_type" "image/gif" "${I}";
    done; unset I

    for I in		\
	**/*.bmp	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:eol-style		"${I}";
	    svn propdel     svn:executable		"${I}";
	    svn propdel     svn:keywords		"${I}";
	    svn propset     svn:mime-type "image/bmp"	"${I}";
	fi;
	Set_EA "mime_type" "image/bmp" "${I}";
    done; unset I

    for I in		\
	**/*.mbm	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:eol-style		"${I}";
	    svn propdel     svn:executable		"${I}";
	    svn propdel     svn:keywords		"${I}";
	    svn propset     svn:mime-type "image/mbm"	"${I}";
	fi;
	Set_EA "mime_type" "image/mbm" "${I}";
    done; unset I

    for I in		\
	**/*.png	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:eol-style		"${I}";
	    svn propdel     svn:executable		"${I}";
	    svn propdel     svn:keywords		"${I}";
	    svn propset     svn:mime-type "image/png"	"${I}";
	fi;
	Set_EA "mime_type" "image/png" "${I}";
    done; unset I

    for I in		\
	**/*.jpg	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable		"${I}";
	    svn propset     svn:mime-type "image/jpg"	"${I}";
	    svn propdel     svn:keywords		"${I}";
	    svn propdel     svn:eol-style		"${I}";
	fi;
	Set_EA "mime_type" "image/jpg" "${I}";
    done; unset I

    for I in		\
	**/*.mp3	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable		    "${I}";
	    svn propset     svn:mime-type "audio/mpeg mp3"  "${I}";
	    svn propdel     svn:keywords		    "${I}";
	    svn propdel     svn:eol-style		    "${I}";
	fi;
	Set_EA "mime_type" "audio/mpeg mp3" "${I}";
    done; unset I

    for I in		\
	**/*.tmpl	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable				    "${I}";
	    svn propset     svn:mime-type "text/x-httpd-php"		    "${I}";
	    svn propset     svn:eol-style "LF"				    "${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"  "${I}";
	fi;
	Set_EA "mime_type" "text/x-httpd-php" "${I}";
    done; unset I

    for I in		\
	**/*.css	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable				    "${I}";
	    svn propset     svn:mime-type "text/css"			    "${I}";
	    svn propset     svn:eol-style "LF"				    "${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"  "${I}";
	fi;
	Set_EA "mime_type" "text/css" "${I}";
    done; unset I

    for I in		\
	**/*.html	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:mime-type "text/html"			    "${I}";
	    svn propdel     svn:executable				    "${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"  "${I}";
	    svn propset     svn:eol-style "LF"				    "${I}";
	fi;
	Set_EA "mime_type" "text/html" "${I}";
    done; unset I

    for I in		\
	**/*.xml	\
	**/*.plist	\
	**/*.plist.in	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:mime-type "text/xml"			    "${I}";
	    svn propdel     svn:executable				    "${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"  "${I}";
	    svn propset     svn:eol-style "LF"				    "${I}";
	fi;
	Set_EA "mime_type" "text/xml" "${I}";
    done; unset I

    for I in		\
	**/*.rpm	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable			    "${I}";
	    svn propset     svn:mime-type "application/x-rpm"	    "${I}";
	    svn propdel     svn:keywords			    "${I}";
	    svn propdel     svn:eol-style			    "${I}";
	fi;
	Set_EA "mime_type" "application/x-rpm" "${I}";
    done; unset I

    for I in		\
	**/*.bz2	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable			    "${I}";
	    svn propset     svn:mime-type "application/x-bzip2"	    "${I}";
	    svn propdel     svn:keywords			    "${I}";
	    svn propdel     svn:eol-style			    "${I}";
	fi;
	Set_EA "mime_type" "application/x-bzip2" "${I}";
    done; unset I

    for I in		\
	**/*.gz		\
	**/*.tgz	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable			    "${I}";
	    svn propset     svn:mime-type "application/x-gtar"	    "${I}";
	    svn propdel     svn:keywords			    "${I}";
	    svn propdel     svn:eol-style			    "${I}";
	fi;
	Set_EA "mime_type" "application/x-gtar" "${I}";
    done; unset I

    for I in		    \
	**/*.txt	    \
	**/.directory	    \
	**/.cvsignore	    \
	**/*.importorder    \
	**/*_List	    ;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable		"${I}";
	    svn propset     svn:mime-type "text/plain"	"${I}";
	    svn propdel     svn:keywords		"${I}";
	    svn propdel     svn:eol-style		"${I}";
	fi;
	Set_EA "mime_type" "text/plain" "${I}";
    done; unset I

    for I in		\
	**/*.zip	\
	**/*.utz	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable			"${I}";
	    svn propset     svn:mime-type "application/zip"	"${I}";
	    svn propdel     svn:keywords			"${I}";
	    svn propdel     svn:eol-style			"${I}";
	fi;
	Set_EA "mime_type" "application/zip" "${I}";
    done; unset I

    for I in		\
	**/*.thm	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable			"${I}";
	    svn propset     svn:mime-type "application/x-tar"	"${I}";
	    svn propdel     svn:keywords			"${I}";
	    svn propdel     svn:eol-style			"${I}";
	fi;
	Set_EA "mime_type" "application/x-tar" "${I}";
    done; unset I

    for I in		\
	**/*.ttf	;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable			    "${I}";
	    svn propset     svn:mime-type "application/x-font-ttf"  "${I}";
	    svn propdel     svn:keywords			    "${I}";
	    svn propdel     svn:eol-style			    "${I}";
	fi;
	Set_EA "mime_type" "application/x-font-ttf" "${I}";
    done; unset I
popd;

############################################################ {{{1 ###########
# vim: textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab
# vim: filetype=zsh encoding=utf-8 fileformat=unix
