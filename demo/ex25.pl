#!/usr/bin/perl


#while 

$a = 0 ;
while( $a < 3) 
{
	print "a = $a \n ";
}
continue 
{
	$a = $a +1;
}

#foreach

@list = (1, 2, 3, 4, 5) ;
foreach $a (@list) 
{
	print "a = $a \n" ;
}
continue	
{
	last if $a == 4 ;
}
