#!/usr/bin/perl

#last  语句

$a = 10 ;
while( $a < 20) {
	if( $a == 15) 
	{
		$a = $a +1 ;
		last ;
	}
	print "a 的值为：$a \n " ;
	$a = $a + 1 ;
} 
