#!/usr/bin/env -S awk -f

# Pre definitions.
BEGIN {
	 
}

# The lexer.
{
	print("line:", $0)
	for (i = 1; i <= NF; i++) {
		if ($i == "if") {
			lex("if", $i, i)
		} else if ($i == "else") {
			lex("else", $i, i)
		} else if ($i == "while") {
			lex("while", $i, i)
		} else if ($i == "(") {
			lex("lbracket", $i, i)
		} else if ($i == ")") {
			lex("rbracket", $i, i)
		} else if ($i == "{") {
			lex("lsbracket", $i, i)
		} else if ($i == "}") {
			lex("rsbracket", $i, i)
		} else if ($i == "\"") { 
			lex("quato", $i, i)
		} else if ($i == "#") {
			lex("comment", $i, i)
		} else if ($i == "true") {
			lex("true", $i, i)
		} else if ($i == "false") {
			lex("false", $i, i)
		} else if ($i == "function") {
			lex("function", $i, i)
		} else if (number($i)) {
			lex("number", $i, i)
		} else {
			lex("raw", $i, i)
		}
	}
	
}

# Tail of the code.
END {
	
}

function lex(el, va, n) {
	print(toupper(el), va, NR, n)
}


function number(val) {
	return val ~ /^[0-9]+(\.[0-9]+)?$/
}

# Düşman değilse bizdendir.
function string(val) {
	return !number(val)
}
