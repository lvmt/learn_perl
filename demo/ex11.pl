#!/usr/bin/perl 

#切割数组

@sites = qw/google taobo runoob weibo qq facebook 网易/ ;

#孤立索引，逗号分割

@site2s = @sites[3,4,5] ;

print "@site2s\n"  ;



##连续索引 ..

@sites3 = @sites[3..5] ;

print  "@sites3\n" ;


