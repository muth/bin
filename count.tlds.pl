#!/usr/bin/perl -w

# Input: domain names
# output: count of domains per tld

use strict;
use Data::Dumper;

my %tld_count = ();

while(<>) {
    chomp;
    if ( (! /^.*\.([^\.]+\.au)$/ ) && (! /^.*\.([^\.]+)$/ )) {
	print "MATCH FAILED ($_)\n";
	next;
    }
    my ($tld) = ($1);
    $tld = lc($tld);
    $tld_count{$tld}++;
}

print "tld_count       is (",Dumper(\%tld_count),")\n";



sub output_as_csv_table {

    my %tlds =  ();

    for my $tld (keys %tld_count) {
	$tlds{$tld} = 1;
    }

    my @tld_order = sort keys %tlds;

    print "rule,", join(",", @tld_order), "\n";
    my $row = '';

    for my $tld (@tld_order) {

	my $count = $tld_count{$tld};
	if ( $count ) {
	    $row .= ",$count";
	} else {
	    $row .= ",0";
	}
    }
    print $row, "\n";
}


output_as_csv_table();
