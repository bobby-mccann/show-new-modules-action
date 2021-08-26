#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my $files_scanned = 0;

while (<STDIN>) {
    chomp;
    open(FH, '<', $_) or die;
    while (<FH>) {
        if (/^use (.+);/ && !/^use (warnings|strict)/) {
            print ($1 . "\n") if defined $1;
        }
    }
    close(FH);
    $files_scanned++;
}

# ls -R ~/Code/secure/**/**.pm ~/Code/secure/**/**.pl | ./find_use.pl | sort | uniq