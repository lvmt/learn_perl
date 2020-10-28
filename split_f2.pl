#!/usr/bin/perl


$str = "mike:28:male:math";


## 方法一

@array = split /:/, $str;
print '姓名：'. $array[0]. "\n";
print '年龄：'. $array[1]. "\n";


