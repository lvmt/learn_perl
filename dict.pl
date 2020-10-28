#!/usr/bin/perl



# 创建哈希
$d{'a'} = 12;
$d{'b'} = 15;
$d{'c'} = 17;


# 访问哈希
print $d{'a'}. "\n";	#大括号包含,

# 获取哈希所有的键
@keys =  keys %d ;
print "@keys". "\n";

# 获取哈希所有的values
@values = values %d;
print "@values". "\n";

