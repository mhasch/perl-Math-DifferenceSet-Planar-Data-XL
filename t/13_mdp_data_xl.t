# Copyright (c) 2022-2023 Martin Becker, Blaubeuren.
# This package is free software; you can distribute it and/or modify it
# under the terms of the Artistic License 2.0 (see LICENSE file).

# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl 13_mdp_data_xl.t'

#########################

use strict;
use warnings;
use FindBin;
use File::Spec;
use Config;
use Test::More tests => 5;

use Math::DifferenceSet::Planar 1.000;

require_ok('Math::DifferenceSet::Planar::Data::XL');

diag("ivsize = $Config{'ivsize'}, nvsize = $Config{'nvsize'}");

my ($vol, $dirs) = File::Spec->splitpath($FindBin::RealBin, 1);
my @comp         = File::Spec->splitdir($dirs);
$comp[-1]        = 'share';
$dirs            = File::Spec->catdir(@comp);
my $file1        = File::Spec->catpath($vol, $dirs, 'pds_12400.db');
my $file2        = File::Spec->catpath($vol, $dirs, 'extra_2M.db');

my $count = eval { Math::DifferenceSet::Planar->set_database($file1) };
diag($@) if !defined $count;
is($count, 12400, 'size XL database available');

my $ds = Math::DifferenceSet::Planar->std_reference(59049);
my $sx = $ds && $ds->lambda;
is($sx, 1, 'std reference 59049');

$count = eval { Math::DifferenceSet::Planar->set_database($file2) };
diag($@) if !defined $count;
is($count, 3, 'extra database available');

$ds = Math::DifferenceSet::Planar->std_reference(2096993);
$sx = $ds && $ds->lambda;
is($sx, 1, 'std reference 2096993');

