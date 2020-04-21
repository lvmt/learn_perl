#!/usr/bin/perl

#定义子程序私有变量

# sub somefunc {
#     my $variable;    #$variable 在方法 somefunc()外不可见
#     my ($another, @an_array, %a_hash);   #同时声明多个变量
# }



#全局变量
$string = 'Hello World!' ;

#函数定义
sub PrintHello {
    #函数的私有变量
    my $string ;
    $string = 'Hello, Runoob!';
    print "函数内部字符串:$string \n" ;
}

#函数调用
PrintHello();
print "函数外字符串：$string \n" ;