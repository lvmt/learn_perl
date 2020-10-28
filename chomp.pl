#!/usr/bin/perl


die "need input file." unless @ARGV == 1;
$file = shift;
open(INFILE,"<$file") or die "file not exists. $1";

while(<INFILE>){

	chomp($_);
	print "$_". "\n";

}
