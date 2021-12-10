#!/bin/bash

#l=(go kind k9s kubectl redis) # redis included just to test rapidly, without k8s
tools=(go kind k9s kubectl)

if [[ $(uname) != "Darwin" ]]; then
	# shellcheck disable=SC2046
	# shellcheck disable=SC2086
	echo on $(uname) please manually install the following tools: ${tools[*]}
	exit 1
fi

set -e
cmd=(install)
pkg_mgr=brew

function prep() {
	for arg in "$@"; do
		if [[ $arg =~ reinstall ]]; then
			cmd=(reinstall)
		else
			# shellcheck disable=SC2206
			cmd+=($arg)
		fi
	done
}

function info() {
	# shellcheck disable=SC2046
	echo OS: $(uname)
	echo Package manager: $pkg_mgr
	echo Command: ${cmd[*]}
	echo
}

if ! command -v $pkg_mgr >/dev/null 2>&1; then
	echo $pkg_mgr expected
	exit 1
fi

# shellcheck disable=SC2119
prep "$@"
info


# shellcheck disable=SC2154
# shellcheck disable=SC2128
read -e -p "Installing the following tools: ${tools[*]}; with $pkg_mgr ${cmd[*]}... \
    Proceed? [Y/n]" -n 1 -r
echo
REPLY=${REPLY:-Y}
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 1
fi
set -x
echo "${tools[*]}" | xargs $pkg_mgr ${cmd[*]}
set +x
