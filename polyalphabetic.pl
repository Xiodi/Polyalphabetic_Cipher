#!/usr/bin/perl

use strict;
use warnings;
use PolyAlpha;

die ("Usage: $0 {1|2} <nameOfFile> <keyfile>\n") if (!defined($ARGV[2]));
die ("Usage : $ARGV[0] must be 1 (Encrypt) or 2 (Decrypt)") if ( $ARGV[0] != 1 && $ARGV[0] != 2);

open(my $sourceFile, '<', $ARGV[1]) or die("open: $!");
open(my $keyfile, '<', $ARGV[2]) or die("open: $!");
my $key = <$keyfile>;
my @keytab = split '', $key;
my $i = 0;
my $keychar = '';
while (defined(my $text = <$sourceFile>))
{
    foreach (split //, $text)
    {
	$keychar = abs(ord($keytab[$i % @keytab]) - 65) % 26;
	$keychar = -$keychar if ($ARGV[0] == 2);
	print(poly($_, $keychar));
	++$i;
    }
}
