#!/bin/zsh
############################################################ {{{1 ##########:
#   Copyright (C) 2005,2006  Martin Krischik
############################################################################:
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or ENDIFFTNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
###########################################################################:
#  $Author$
#
#  $Revision$
#  $Date$
#
#  $Id$
#  $HeadURL$
############################################################: }}}1 ##########

setopt Extended_Glob;
setopt Null_Glob;
setopt No_Verbose;
setopt No_X_Trace;
setopt No_Err_Exit;

case "$(uname)" in
    (CYGWIN*)
	function Set_EA ()
	    {
	    echo "${2}" > "${3}:user.${1}"

	    return;
	    }
	function SetFile ()
	    {
	    return;
	    }
    ;;
    (Darwin*)
	function Set_EA ()
	    {
	    xattr -w "${1}" "${2}" "${3}"

	    return;
	    }
    ;;
    (*)
	function Set_EA ()
	    {
	    setfattr --name="${1}" --value="${2}" "${3}"

	    return;
	    }
	function SetFile ()
	    {
	    return;
	    }
    ;;
esac;

pushd .
    for I in **/*.ada **/*.adb **/*.ads; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type   "text/x-adasrc"			"${I}";
	    svn propset     svn:eol-style   "LF"				"${I}";
	fi;
	Set_EA "mime_type" "text/x-adasrc"					"${I}";
    done; unset I

    for I in **/*.c **/*.h; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type   "text/x-csrc"			"${I}";
	    svn propset     svn:eol-style   "LF"				"${I}";
	fi;
	Set_EA "mime_type" "text/x-csrc"					"${I}";
    done; unset I

    for I in **/*.java; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type   "text/x-java"			"${I}";
	    svn propset     svn:eol-style   "LF"				"${I}";
	fi;
	Set_EA "mime_type" "text/x-java"					"${I}";
    done; unset I

    for I in **/*.rb; do
	chmod +x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}";
	    svn propset     svn:executable  "*"					"${I}";
	    svn propset     svn:mime-type   "text/x-ruby"			"${I}";
	    svn propset     svn:eol-style   "LF"				"${I}";
	fi;
	Set_EA "mime_type" "text/x-ruby"					"${I}";
    done; unset I

    for I in **/*.cpp **/*.hpp; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type   "text/x-c++src"			"${I}";
	    svn propset     svn:eol-style   "LF"				"${I}";
	fi;
	Set_EA "mime_type" "text/x-c++src"					"${I}";
    done; unset I

    for I in **/*.sh **/*.zsh **/*.bash **/*.command **/*.command.in; do
	chmod +x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:mime-type   "text/x-shellscript"		"${I}";
	    svn propset     svn:eol-style   "LF"				"${I}";
	    svn propset     svn:executable  "*"					"${I}";
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}";
	fi;
	Set_EA "mime_type" "text/x-shellscript"					"${I}";
	SetFile -a E								"${I}";
    done; unset I

    for I in **/*.tcp ;
    do
	chmod +x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:mime-type   "text/x-shellscript"		"${I}" ;
	    svn propset     svn:eol-style   "LF"				"${I}" ;
	    svn propset     svn:executable  "*"					"${I}" ;
	    svn propset     svn:keywords    "Author Date Id Revision HeadURL"	"${I}" ;
	fi;
	Set_EA "mime_type" "text/x-tcl" "${I}";
    done; unset I

    for I in **/Portfile;
    do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:mime-type   "text/x-shellscript"		"${I}" ;
	    svn propset     svn:eol-style   "native"				"${I}" ;
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:keywords    "Id"				"${I}" ;
	fi;
	Set_EA "mime_type" "text/x-tcl" "${I}";
    done; unset I

    for I in **/*.rexx; do
	chmod +x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:eol-style "LF"					"${I}";
	    svn propset     svn:executable "*"					"${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"	"${I}";
	    svn propset     svn:mime-type "text/x-rexx"				"${I}";
	fi;
	Set_EA "mime_type" "text/x-rexx"					"${I}";
	SetFile -a E								"${I}";
    done; unset I

    for I in **/*.bat **/*.cmd **/*.btm; do
	chmod +x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:eol-style "LF"					"${I}";
	    svn propset     svn:executable "*"					"${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"	"${I}";
	    svn propset     svn:mime-type "text/x-dosbatch"			"${I}";
	fi;
	Set_EA "mime_type" "text/x-dosbatch"					"${I}";
    done; unset I

    for I in **/*.mak **/Makefile; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:eol-style "LF"					"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"	"${I}";
	    svn propset     svn:mime-type "text/x-makefile"			"${I}";
	fi;
	Set_EA "mime_type" "text/x-makefile"					"${I}";
    done; unset I

    for I in **/*.vim; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:eol-style "LF"					"${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"	"${I}";
	    svn propset     svn:mime-type "text/x-vim"				"${I}";
	fi;
	Set_EA "mime_type" "text/x-vim" "${I}";
    done; unset I

    for I in **/*.diff; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:eol-style "LF"					"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propset     svn:mime-type "text/x-patch"			"${I}";
	fi;
	Set_EA "mime_type" "text/x-patch" "${I}";
    done; unset I

    for I in **/*.rpmmacros **/*.spec; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:eol-style "LF"					"${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"	"${I}";
	    svn propset     svn:mime-type "text/x-rpm-spec"			"${I}";
	fi;
	Set_EA "mime_type" "text/x-rpm-spec" "${I}";
    done; unset I

    for I in **/*.gif; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:eol-style					"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propset     svn:mime-type "image/gif"				"${I}";
	fi;
	Set_EA "mime_type" "image/gif" "${I}";
    done; unset I

    for I in **/*.bmp; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:eol-style					"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propset     svn:mime-type "image/bmp"				"${I}";
	fi;
	Set_EA "mime_type" "image/bmp" "${I}";
    done; unset I

    for I in **/*.mbm; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:eol-style					"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propset     svn:mime-type "image/mbm"				"${I}";
	fi;
	Set_EA "mime_type" "image/mbm"						"${I}";
    done; unset I

    for I in **/*.png; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:eol-style					"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propset     svn:mime-type "image/png"				"${I}";
	fi;
	Set_EA "mime_type" "image/png" "${I}";
    done; unset I

    for I in **/*.jpg; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "image/jpg"				"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propdel     svn:eol-style					"${I}";
	fi;
	Set_EA "mime_type" "image/jpg" "${I}";
	SetFile-c 'GIMP' -t "JPEG"					"${I}";
    done; unset I

    for I in **/*.mp3; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "audio/mpeg mp3"			"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propdel     svn:eol-style					"${I}";
	fi;
	Set_EA "mime_type" "audio/mpeg mp3" "${I}";
    done; unset I

    for I in **/*.tmpl; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "text/x-httpd-php"			"${I}";
	    svn propset     svn:eol-style "LF"					"${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"	"${I}";
	fi;
	Set_EA "mime_type" "text/x-httpd-php" "${I}";
    done; unset I

    for I in **/*.css; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "text/css"				"${I}";
	    svn propset     svn:eol-style "LF"					"${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"	"${I}";
	fi;
	Set_EA "mime_type" "text/css" "${I}";
    done; unset I

    for I in **/*.html; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:mime-type "text/html"				"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"	"${I}";
	    svn propset     svn:eol-style "LF"					"${I}";
	fi;
	Set_EA "mime_type" "text/html" "${I}";
    done; unset I

    for I in **/*.xml **/*.plist **/*.plist.in **/*.diagram **/*.etld **/*.etlp **/*.dtd; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propset     svn:mime-type "text/xml"				"${I}";
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"	"${I}";
	    svn propset     svn:eol-style "LF"					"${I}";
	fi;
	Set_EA "mime_type" "text/xml" "${I}";
    done; unset I

    for I in **/*.rpm; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "application/x-rpm"			"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propdel     svn:eol-style					"${I}";
	fi;
	Set_EA "mime_type" "application/x-rpm"					"${I}";
    done; unset I

    for I in **/*.bz2; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "application/x-bzip2"			"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propdel     svn:eol-style					"${I}";
	fi;
	Set_EA "mime_type" "application/x-bzip2"				"${I}";
    done; unset I

    for I in **/*.gz **/*.tgz; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "application/x-gtar"			"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propdel     svn:eol-style					"${I}";
	fi;
	Set_EA "mime_type" "application/x-gtar"					"${I}";
    done; unset I

    for I in **/*.txt **/.directory **/.cvsignore **/*.importorder **/*_List; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "text/plain"				"${I}";
	    svn propset     svn:keywords "Author Date Id Revision HeadURL"	"${I}";
	    svn propset     svn:eol-style "LF"					"${I}";
	fi;
	Set_EA "mime_type" "text/plain"						"${I}";
    done; unset I

    for I in **/*.zip **/*.utz	; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "application/zip"			"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propdel     svn:eol-style					"${I}";
	fi;
	Set_EA "mime_type" "application/zip"					"${I}";
    done; unset I

    for I in **/*.thm; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "application/x-tar"			"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propdel     svn:eol-style					"${I}";
	fi;
	Set_EA "mime_type" "application/x-tar"					"${I}";
    done; unset I

    for I in **/*.ttf; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "application/x-font-ttf"		"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propdel     svn:eol-style					"${I}";
	fi;
	Set_EA "mime_type" "application/x-font-ttf"				"${I}";
    done; unset I

    for I in **/*.af; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "application/x-fx-602p.all"		"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propdel     svn:eol-style					"${I}";
	fi;
	Set_EA "mime_type"		'application/x-fx-602p.all'		"${I}";
	SetFile -a E -c '602P' -t "AFFX"					"${I}";
    done; unset I

    for I in **/*.pf; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "application/x-fx-602p.program"	"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propdel     svn:eol-style					"${I}";
	fi;
	Set_EA "mime_type"		'application/x-fx-602p.program'		"${I}";
	SetFile -a E -c '602P' -t "PFFX"					"${I}";
    done; unset I

    for I in **/*.df; do
	chmod -x "${I}";
	if test -f "${I:h}/.svn/text-base/${I:t}.svn-base"; then
	    svn propdel     svn:executable					"${I}";
	    svn propset     svn:mime-type "application/x-fx-602p.data"		"${I}";
	    svn propdel     svn:keywords					"${I}";
	    svn propdel     svn:eol-style					"${I}";
	fi;
	Set_EA "mime_type"		'application/x-fx-602p.data'		"${I}";
	SetFile -a E -c '602P' -t "DFFX"					"${I}";
    done; unset I
popd;

############################################################ {{{1 ###########
# vim: textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab
# vim: filetype=zsh encoding=utf-8 fileformat=unix
