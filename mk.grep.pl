#!/usr/bin/perl -w

# Input: file of strings
# Output: shell script with grep -E of the input strings.
# So you can futher modify the regex with common prefix/suffix etc.

print "#!/bin/bash\n\ngrep -E '(" . join('|', map { chomp; $_; } <>) . ")' " . '$@' . "\n";
