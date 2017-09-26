# --- PolyAlpha Package --- 
package PolyAlpha;
use strict;
use warnings;                                                                               
use Exporter;                                                                               
our @ISA = qw(Exporter);                                                                    
our @EXPORT = qw(&poly);

sub poly
{
    my ($char, $key) = @_;
    if (ord($char) + $key > ord("Z")) {
	$key = - (26 - $key);
    }
    elsif (ord($char) + $key < ord("A"))
    {
	$key = ($key + 26);
    }
    return chr(ord($char) + $key) if ($char =~ /[A-Z]/);
    return "";
}
1;
