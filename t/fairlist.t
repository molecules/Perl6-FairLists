use Test;
use lib 'lib';
use FairLists;

my @a = 1 .. 13;
my $num-lists = 3;

my @results = fair-lists(@a, $num-lists);
my @expecteds = (1, 2, 3, 4), (5, 6, 7, 8), (9, 10 , 11, 12, 13); 

is-deeply(@results, @expecteds, 'fair list generated');

done-testing;
