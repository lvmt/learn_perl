#!/usr/bin/perl


#将字符串转化为数组

$var_test = "runoob"  ;

$var_string = "wwww-runoob-com"  ;

$var_names = "google,taobo,runoob,weibo";


#指定分割符

@test = split('', $var_test)  ;
@string = split("-", $var_string)  ;
@names = split(",", $var_names) ;


print "分割后的元祖 @string\n"  ;

print "分割的元祖中元素提取 $string[1]\n"  ;


#指定返回的字数

@string_1 = split("-", $var_string, 2)  ;

print "指定反馈字段：@string_1\n"   ;
