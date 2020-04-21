#!/usr/bin/perl

#读取所有的key值， keys %hash

%data = ('google' => 'google.com', 'runoob' => 'runoob.com', 'taobo' => 'taobo.com')  ;

@names = keys %data  ;  #返回所有的keys值
@values = values %data  ;  #返回所有的values值

print "所有的keys值为： @names\n"  ;

print "所有的values值为：@values\n" ;
