use strict;
use Module::Build;

Module::Build
  ->new( module_name => 'Test::CIDR::Contains',
         license     => 'perl',
         build_requires => {
             'Net::IPv4Addr' => 0,
             'Test::More' => 0,
         },
   create_makefile_pl => 'traditional',
       )
  ->create_build_script;
