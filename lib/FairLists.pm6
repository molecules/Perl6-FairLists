#!/bin/env perl6
unit module FairLists;

sub fair-lists ( @array, $num-lists ) is export
{
    my $num-elements = @array.elems;
    my $num-large    = $num-elements % $num-lists; # remainder
    my $num-small    = $num-lists - $num-large;

    my $small-size = floor($num-elements/$num-lists);
    my $large-size = $small-size + 1; # same as ceiling($num-element/$num-lists);

    my $first-large = ($num-small * $small-size);
    my $last-small  = $first-large - 1;
     
    my @first-sublist  = @array[ 0 .. $last-small];
    my @second-sublist = @array[ $first-large .. $num-elements - 1 ];

    my @small-lists = @first-sublist.rotor($small-size);
    my @large-lists = @second-sublist.rotor($large-size);
    my @all-lists   = (@small-lists, @large-lists).flat;
    return @all-lists;
}
