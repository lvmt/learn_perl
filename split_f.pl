#!/usr/bin/perl


$str = "mike:28:male:math";


## 方法一

($name,$age,$male,$class) = split /:/, $str;
print '姓名：'. $name. "\n";
print '年龄：'. $age. "\n";


