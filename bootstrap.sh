#!/bin/bash

set -e
####################################################################################################

#l=(go kind k9s kubectl redis) # redis included just to test rapidly, without k8s
tools=(go kind k9s kubectl)

cmd=(install)
pkg_mgr=brew

####################################################################################################

if [[ $(uname) != "Darwin" ]]; then
	# shellcheck disable=SC2046
	# shellcheck disable=SC2086
	echo WARN: $(uname) is not supported for installing the tools. You are on your own.
	echo "      the tools expected: ${tools[*]}"
	echo "      cluster bootstrap still probably would work"
	tools=()
	pkg_mgr=
	cmd=
fi

####################################################################################################

function cecho() {
	# shellcheck disable=SC2068
	echo $@
}

function manually() {
	echo ERROR: $1 is missing. Please install it manually.
}
function prep() {
	if ! command -v docker >/dev/null 2>&1; then
		manually docker
		exit 1
	fi

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
	echo -e OS: $(uname)
	echo -e Package manager: $pkg_mgr
	echo -e Command: ${cmd[*]}
	echo -e
}

function runp() {
	read -e -p "-- $* [press 'n' to skip]" -n 1 -r
	REPLY=${REPLY:-Y}
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		set -x
		# shellcheck disable=SC2048
		$*
		set +x
	fi
	echo
}


####################################################################################################

# shellcheck disable=SC2119
# shellcheck disable=SC2068
prep $@
info

# shellcheck disable=SC2154
# shellcheck disable=SC2128

if [[ $(uname) == "Darwin" ]]; then
  runp $pkg_mgr ${cmd[*]} ${tools[*]}
fi

run go install github.com/dahernan/godockerize@latest

####################################################################################################

script_dir=$(dirname "${BASH_SOURCE[0]}")/k8s
namespace=go-redis-k8s-poc

set -x
kind create cluster "--config=$script_dir/kind.yaml"
kubectl cluster-info --context kind-kind

runp kubectl apply -f "$script_dir/$namespace.yaml"

echo Bootstrap complete