#!/usr/bin/perl


$str = "mike:28:male:math";


## 方法三

@array = split /:/, $str;

($name, $age) = @array[0, 1];

print '姓名: '. $name. "\n";
print '年龄：'. $age. "\n";


