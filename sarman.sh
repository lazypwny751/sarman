#!/bin/sh

set -e

export OPT="help" PAR=""
export status="true"

for c in "awk" "sh"
do
	if ! command -v "${c}" > /dev/null
	then
		echo "${0##*/}: \"${c}\" is a required runtime dependency."
		export status="false"		
	fi
done
! "${status}" && exit 1


while [ "${#}" -gt 0 ]
do
	case "${1}" in
		"--help"|"-h")
			export OPT="help"
		;;		
		*)
			[ "${PARAMETER}" = "" ] && {
				export PAR="${1}"
			} || {
				export PAR="${PARAMETER}:${1}"
			}
			shift
		;;
	esac
done

case "${OPT}" in
	*)
		echo "this is help."
	;;
esac
