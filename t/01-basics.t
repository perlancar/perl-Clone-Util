#!perl

use 5.010;
use strict;
use warnings;

use Clone::Util qw(modclone);
use Test::More 0.98;

subtest "modclone" => sub {
    my $data = [1,2,3];
    is_deeply((modclone { push @$_, 4 } $data), [1,2,3,4], '$_ in code');
    is_deeply((modclone { splice @{$_[0]}, 0, 0, 0 } $data), [0,1,2,3], '$_[0] in code');
    is_deeply($data, [1,2,3], "original data is not changed");
};

DONE_TESTING:
done_testing();
