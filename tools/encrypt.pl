#!/usr/bin/perl
# Perl payload encipher for OfuscMandy
use strict; use warnings;

my $msg = "OFUSCMANDY\n";
my $key = int(rand(255)) + 1;
print "Clave usada: ", sprintf("0x%02x", $key), "\n";
my @bytes = map { $_ ^ $key } unpack("C*", $msg);
print "db ", join(", ", map { sprintf("0x%02x", $_) } @bytes), "\n";
