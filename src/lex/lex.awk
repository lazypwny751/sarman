#!/usr/bin/env -S awk -f

function lex(el, va, n) {
	print(toupper(el), va, NR, n)
}


function number(val) {
	return val ~ /^[0-9]+(\.[0-9]+)?$/
}

function string(val) {
	return !number(val)
}

# Pre definitions.
BEGIN {
	FS = ""
}

# The lexer.
{
	TOKEN = ""
	print("line:", $0)
	for (i = 1; i <= NF; i++) {
		if ($i != " ") {
			TOKEN = TOKEN $i
		}
	}
	print(TOKEN)
}

# Tail of the code.
END {
	
}
