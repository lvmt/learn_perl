#!/usr/bin/perl


die "need 2 paramaters.input and output." unless @ARGV == 2;

$input = shift;
$output = shift;

open(INFILE, "<$input");
open(OUTPUT, ">$output");

while(<INFILE>){

	if($_ =~ /first/) {

		print OUTPUT $_;

	}

}


close(INFILE);
close(OUTPUT);
