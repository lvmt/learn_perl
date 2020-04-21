#!/usr/bin/perl

#将数组转换为字符串
# join函数


$var_string = "www-runoob-com"  ;

$var_names = "google,taobo,runoob,weibo"  ;

#字符串转换为数组
@string = split("-", $var_string)  ;
@names  = split(",", $var_names)  ;


#将数组转换为字符串

$string1 = join("-", @string) ;
$names = join("-", @names)   ;

print "转化结果：$string1\n" ;

print "转化结果：$names\n" ;
