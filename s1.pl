#!/usr/bin/perl

$str = "/jdfstj1/B2C_COM_P1/5_Personal/lmt/Code/handConfig";

my @array = ('/a/b/1', '/a/b/2', '/a/b/3');

#print @array[0..2];

@a = @array[0..2];

foreach(@a){

	print "$_". "\n";

}


foreach $item (@array[1..$#t]){

	print "item". $item. "\n";

}
