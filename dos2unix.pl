#!/usr/bin/perl -w

# \r\n -> \n

use strict;

while(<>) {
    s/[\r\n]+//g;
    print $_ . "\n";
}

