#!/usr/bin/perl

#redo语句

$a = 0;

while( $a < 10 )
{
	if( $a == 5)
	{
		$a = $a + 1  ;
		redo   ;
	}
	print "a = $a \n ";
}

continue 
{
	$a = $a +1 ;
}

