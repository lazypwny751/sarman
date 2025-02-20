#!/bin/sh

set -e

export OPT="build" PAR=""
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
			shift
		;;		
		*)
			[ "${PAR}" = "" ] && {
				export PAR="${1}"
			} || {
				export PAR="${PAR}:${1}"
			}
			shift
		;;
	esac
done

case "${OPT}" in
	"help")
		echo "usage: ${0##*/} [OPT] <files..>.
\t--help: show's this helper text.
\t--version: show the current version."
	;;
	*)
		if [ "${PAR}" != "" ]
		then
			IFS=":"
			for e in ${PAR}
			do
				if { 
					[ -f "${e}" ] && { 
						case "${e}" in
							*".sr")
								true
							;;
							*)
								false
							;;
						esac
					}
				} 
				then
					awk -f "src/lex/lex.awk" "${e}"
				else
					echo "${0##*/}: \"${e}\" isn't a sarman file."
				fi 
			done
		else
			echo "${0##*/}: no files given."
			exit 1
		fi
	;;
esac
