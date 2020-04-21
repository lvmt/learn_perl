#!/usr/bin/perl


#创建hash字典， 2种方式

#1、为每个key设置value
$date{'google'} = "goole.com"  ;
$data{'runoob'} = "runoob.com" ;
$data{'taobo'}  = "taobo.com"  ;

@all_keys = keys %data ;
@all_values = values %data  ;

print "创建的字典为 ：\n@all_keys\n@all_values\n" ;


#2.通过列表设置

#列表中第一个元素是key，第二个元素是value。
%data2 = ('google', 'google.com', 'runoob', 'runoob.com', 'taobo', 'taobo.com') ;



#使用 => 符号设置key/value:
%data3 = ('google'=>'google.com', 'runoob'=>'runoob.com', 'taobo'=>'taobo.com')  ;



#上述的变异使用:   使用这种方式不能出现空格
%data4 = (-google=>'google.com', -runoob=>'runoob.com', -taobo=>'taobo.com')  ;

##读取元素的方法：

$var1 = $data4{-google}   ;

print "选择的变量：$var1\n"   ;




