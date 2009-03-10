#!perl -w
use strict;
use Test::Builder::Tester  tests => 4;
use Test::More;

BEGIN { use_ok('Test::CIDR::Contains'); }

can_ok('Test::CIDR::Contains', 'cidr_contains'  );

test_out("ok 1");
cidr_contains( '127.0.0.0/24', '127.0.0.1' );
test_test("Simple CIDR Check");

# line_num(+3) shouod point to the line running the actual test
# 18 and 21 in this case.

test_out("not ok 1");
test_diag("  Failed test at $0 line " . line_num(+3) . ".",
         "\t[127.0.0.1] is not within the [128.0.0.0/24] range"
         );
cidr_contains( '128.0.0.0/24', '127.0.0.1' );
test_test("Picks up IP address that isn't in the CIDR");
