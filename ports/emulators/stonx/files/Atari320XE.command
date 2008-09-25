#!/opt/local/bin/zsh

local User_Data="${HOME}/Library/Application Support/Atari800"
local System_Data="/opt/local/share/atari800";

if test ! -d "${User_Data}"; then
    mkdir "${User_Data}";
fi;

if test ! -w  "${User_Data}/MYDOS45D.ATR"; then
    cp						\
	/opt/local/share/atari800/MYDOS45D.ATR	\
	"${User_Data}/MYDOS45D.ATR"		;
fi;

/opt/local/bin/atari800				\
    -320xe					\
    -basic					\
    -pal					\
    -windowed					\
    -width 1280					\
    -height 960					\
    -bpp 16					\
    -xlxe_rom "${System_Data}/ATARIXL.ROM"	\
    -basic_rom "${System_Data}/ATARIBAS.ROM"	\
    ${User_Data}/MYDOS45D.ATR			;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
