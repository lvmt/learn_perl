#!/usr/bin/perl

#检查元素是否存在

%data = ('google' => 'google.com', 'runoob'=>'runoob.com', 'taobo'=>'taobo.com')  ;

if(exists($data{'facebook'})) 
{
	print "facebook 的网站为 $data{'facebook'} \n";
}
else
{
	print "facebook 键不存在 \n";
}

