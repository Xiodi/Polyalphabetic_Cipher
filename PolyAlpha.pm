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
    return chr(ord($char) + $key) if ($char =~ /[A-Z]/);
    return "";
}
1;
