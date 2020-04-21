#!/usr/bin/perl


#数组排序

#定义数组

@site = qw/google taobo runoob facebook/  ;

print  "排序前：@site\n"  ;

#对数组进行排序

@sites = sort(@site)  ;

print "排序后： @sites\n"  ;
