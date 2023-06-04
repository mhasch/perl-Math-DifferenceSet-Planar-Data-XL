package Math::DifferenceSet::Planar::Data::XL;

use 5.010000;
use strict;
use warnings;

our $VERSION = '1.000';

1;
__END__

=head1 NAME

Math::DifferenceSet::Planar::Data::XL - data extension for M::DS::P

=head1 SYNOPSIS

  # no user-code-facing API

=head1 DESCRIPTION

With this module installed, Math::DifferenceSet::Planar will have
access to two additional databases of sample difference sets.

The first one, C<pds_12400.db>, extends the default collection
of samples up to order 131449 (slightly above 2 ** 17).

The second one, C<extra_2M.db>, provides some sample sets of orders
between two million and 2 ** 21.  Currently, there are two sets.
Their orders are 2096993 and 2097023.  Future releases may add more sets.

All sample sets come with standard references and rotator spaces.
Currently, 1394 small sets also have lex references and 644 small sets
have gap references.

=head1 SEE ALSO

See L<Math::DifferenceSet::Planar> for definitions and conventions.
The base module comes with 604 difference sets up to order 4096.

=head2 Other data extensions

=over 4

=item L<Math::DifferenceSet::Planar::Data::M>

1961 sets up to order 16384.

=item L<Math::DifferenceSet::Planar::Data::L>

4875 sets up to order 46337.

=back

=head1 AUTHOR

Martin Becker, E<lt>becker-cpan-mp I<at> cozap.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2022-2023 by Martin Becker, Blaubeuren.

This library is free software; you can distribute it and/or modify it
under the terms of the Artistic License 2.0 (see the LICENSE file).

=head1 DISCLAIMER OF WARRANTY

This library is distributed in the hope that it will be useful, but
without any warranty; without even the implied warranty of merchantability
or fitness for a particular purpose.

=cut
