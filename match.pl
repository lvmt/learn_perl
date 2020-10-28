#!/usr/bin/perl

die "need input file." unless @ARGV == 1;

$file = shift;

open INFILE, "<$file";

while(<INFILE>){

	#print "$_"."\n";
	#if($_ =~ /(.+)(the.+)/){
	#	print "第一个匹配: ". $1."\n";
	#	print "第二个匹配：". $2."\n";
	/(.+)(the.+)/;
	print "第一个匹配: ". $1."\n";
	print "第二个匹配：". $2."\n";
	
}
