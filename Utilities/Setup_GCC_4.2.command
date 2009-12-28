#!/opt/local/bin/zsh

setopt X_Trace;

if test "${USER}" = "root"; then
    pushd /usr/bin;
	grm --verbose "cc" "gcc" "c++" "g++" "gcov";
	gln --verbose --symbolic "gcc-4.2"  "cc";
	gln --verbose --symbolic "gcc-4.2"  "gcc";
	gln --verbose --symbolic "c++-4.2"  "c++";
	gln --verbose --symbolic "g++-4.2"  "g++";
	gln --verbose --symbolic "gcov-4.2" "gcov";
    popd;
else
    setopt Multi_OS;

    sudo ${0:a} 1>&1 2>&2 &>${0:r}.out;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
