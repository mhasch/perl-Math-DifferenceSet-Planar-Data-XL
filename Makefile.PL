# Copyright (c) 2022-2023 Martin Becker, Blaubeuren.
# This package is free software; you can distribute it and/or modify it
# under the terms of the Artistic License 2.0 (see LICENSE file).

use strict;
use ExtUtils::MakeMaker;
use File::Spec;

my @PARENT = qw(Math DifferenceSet Planar);
my $PDIST  = join q[-],  @PARENT;
my @MODULE = qw(Math DifferenceSet Planar Data XL);
my $DIST   = join q[-],  @MODULE;
my $NAME   = join q[::], @MODULE;
my $FILE   = join(q[/],  'lib', @MODULE) . q[.pm];
my $OSFILE = File::Spec->catfile(split m{/}, $FILE);
my %versions = (
    $NAME => {
        file    => $FILE,
        version => MM->parse_version($OSFILE),
    }
);
my @SHARE = map {; "$_.db", "$_.pod" } qw(pds_12400 extra_2M);

# simulating File::ShareDir::Install of parent project
sub MY::postamble {
    my ($self) = @_;
    my $idir =
        File::Spec->catdir('$(INST_LIB)', 'auto', 'share', 'dist', $PDIST);
    my %files =
        map {;
            File::Spec->catdir('share', $_) => File::Spec->catdir($idir, $_)
        } @SHARE;
    my $pm_to_blib =
        $self->oneliner(
            q[pm_to_blib({@ARGV}, '$(INST_LIB)')], ['-MExtUtils::Install']
        );
    my @cmds = 
        $self->split_command(
            $pm_to_blib,
            map {;
                $self->quote_literal($_) => $self->quote_literal($files{$_})
            } sort keys %files
        );
    return join q[], "config::\n", map {; "\t\$(NOECHO) $_\n" } @cmds;
}

WriteMakefile(
    NAME                => $NAME,
    VERSION_FROM        => $FILE,
    PREREQ_PM           => {
    },
    ABSTRACT_FROM       => $FILE,
    AUTHOR              => 'Martin Becker <becker-cpan-mp (at) cozap.com>',
    SIGN                => 1,
    LICENSE             => 'artistic_2',
    META_MERGE          => {
        'meta-spec'     => { version => 2 },
        provides        => \%versions,
        dynamic_config  => 0,
        resources       => {
            bugtracker      => {
                web => "https://github.com/mhasch/perl-$DIST/issues",
            },
            homepage        => 'https://vera.in-ulm.de/planar-diffsets/',
            license         => [
                'https://www.perlfoundation.org/artistic-license-20.html',
            ],
            repository      => {
                url  => "git://github.com/mhasch/perl-$DIST.git",
                web  => "https://github.com/mhasch/perl-$DIST",
                type => 'git',
            },
        },
    },
    MIN_PERL_VERSION    => '5.010',
    CONFIGURE_REQUIRES  => {
        'ExtUtils::MakeMaker'         => '7.06',
        'File::Spec'                  => 0,
    },
    TEST_REQUIRES       => {
        'FindBin'                     => 0,
        'Math::DifferenceSet::Planar' => '1.000',
        'Test::More'                  => 0,
    },
);
