#!/usr/bin/env -S awk -f

# Pre definitions.
BEGIN {
	 
}

# The lexer.
{
	l = $0 "EOL"
	print(l)
	
}

# Tail of the code.
END {
	
}
