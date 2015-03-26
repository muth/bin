#!/usr/bin/perl -w

# When I have to parse/gen csvs ":r ~/bin/csvify.pl"

use strict;

sub csvify {
    my $row = shift;
    my @cleaned_row = map { (defined $_) ? $_ : 'undef' } @{$row};

    if ( grep /["\\]/, @cleaned_row ) { 

        my @out = (); 
        for my $data (@cleaned_row) {
            $data =~ s/\\/\\\\/g;
            $data =~ s/"/\\"/g;
            push @out, $data;
        }
        return '"' .  join('","', @out) . '"';
    } else {
        return '"' .  join('","', @cleaned_row) . '"';
    }   
} 

sub uncsvify {
    my $str = shift;
    $str =~ s/^"//;
    $str =~ s/"$//;
    return split('","', $str);
#    return map { s/^"//; s/"$//; $_ } split(',', $str);
}
