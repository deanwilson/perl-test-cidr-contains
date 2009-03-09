#!perl -w
use strict;
use Test::More tests => 2;

BEGIN { use_ok('Test::CIDR::Contains'); }

can_ok('Test::CIDR::Contains', 'cidr_contains'  );
