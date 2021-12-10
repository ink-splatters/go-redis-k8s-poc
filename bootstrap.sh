#!/bin/bash

####################################################################################################

#l=(go kind k9s kubectl redis) # redis included just to test rapidly, without k8s
tools=(go kind k9s kubectl)

####################################################################################################

if [[ $(uname) != "Darwin" ]]; then
	# shellcheck disable=SC2046
	# shellcheck disable=SC2086
	echo For $(uname) please manually install the following tools: ${tools[*]}
	exit 1
fi

####################################################################################################

function cecho(){
  # shellcheck disable=SC2068
  echo $@
}

set -e
cmd=(install)
pkg_mgr=brew

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

function run() {
  read -e -p "-- $* [press 'n' to skip]" -n 1 -r
  REPLY=${REPLY:-Y}
  if [[  $REPLY =~ ^[Yy]$ ]]; then
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

####################################################################################################
run $pkg_mgr ${cmd[*]} ${tools[*]}

####################################################################################################
script_dir=$(dirname "${BASH_SOURCE[0]}")
cmd_create_cluster=(kind create cluster "--config=$script_dir/k8s/kind.yaml")
activate_cluster=(kubectl cluster-info --context kind-kind)
run ${cmd_create_cluster[*]}
run ${activate_cluster[*]}


