#!/usr/bin/perl

#替换元祖元素

@nums = (1..20)   ;

print "替换前  -  @nums \n"  ;
  
splice(@nums, 5, 5, 21..25)  ;

print "替换后 - @nums \n"  ;
