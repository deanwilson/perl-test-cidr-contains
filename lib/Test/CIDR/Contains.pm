=head1 NAME

Test::CIDR::Contains - test if a CIDR range contains an IP address

=head1 SYNOPSIS

  use Test::More tests => 1;
  use Test::CIDR::Contains;

  # ok
  cidr_contains( '127.0.0.0/24', '127.0.0.1' );

  # fail
  cidr_contains( '128.0.0.0/24', '127.0.0.1' );

=head1 DESCRIPTION

  Test::CIDR::Contains is a short testing module used to determine if a
  CIDR range contains a given IP address.

=head2 Functions

=over 4

=item cidr_contains ( <CIDR range>, <IP address> )

  This function checks if the given IP is contained within the given CIDR
  range.

=back

=cut


package Test::CIDR::Contains;
use strict;
use Net::IPv4Addr qw ( ipv4_in_network );
use Test::Builder;

use vars qw(@EXPORT $VERSION);
use base qw(Exporter);
use vars qw(@EXPORT $VERSION);

@EXPORT  = qw(cidr_contains);
$VERSION = 0.1;

my $Test = Test::Builder->new();

sub cidr_contains($$) {
  my $cidr = shift;
  my $ip   = shift;

  if ( ipv4_in_network( $cidr, $ip ) ) {
    $Test->ok(1);
  } else {
    $Test->ok(0);
    $Test->diag( "\t[$ip] is not within the [$cidr] range\n" );
  }

}

1;

=head1 DEPENDENCIES

   Net::IPv4Addr

=head1 LICENCE AND COPYRIGHT

Copyright (C) 2008 Dean Wilson.  All Rights Reserved.

This module is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=head1 AUTHOR

Dean Wilson <dean.wilson@gmail.com>

=cut
