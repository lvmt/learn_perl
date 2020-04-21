#!/usr/bin/perl

#获取哈希大小

%data = ('google'=>'goole.com', 'runoob'=>'runoob.com', 'taobo'=>'taobo.com')  ;

@kyes = keys %data  ;

$size = @kyes ;

print "1 - 哈希大小： $size \n"
