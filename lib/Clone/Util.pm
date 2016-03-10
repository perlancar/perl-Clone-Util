package Clone::Util;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Function::Fallback::CoreOrPP qw(clone);

use Exporter qw(import);
our @EXPORT_OK = qw(modclone);

sub modclone(&$) {
    my ($code, $data) = @_;
    my $clone = clone($data);
    local $_ = $clone;
    $code->($clone);
    $clone;
}

1;
#ABSTRACT: Utilities related to cloning

=head1 SYNOPSIS

 use Clone::Util qw(modclone);

 my $row = {name=>'ujang', gender=>'m', nationality=>'id'};
 my $table = [
     $row,
     (modclone { $_->{name} = 'budi' } $row),
     (modclone { $_->{name} = 'asep' } $row),
     (modclone { $_->{name} = 'rini'; $_->{gender} = 'f' } $row),
 ];


=head1 FUNCTIONS

=head2 modclone(\&code, $data) => $clone

Clone C<$data> and then run code. Code will be given the clone of data. For
convenience, C<$_> will also be localized and set to the clone of data. So you
can access the clone using C<$_> in addition to C<$_[0]>.


=head1 SEE ALSO

L<Function::Fallback::CoreOrPP>'s C<clone()> is used for cloning.

=cut
