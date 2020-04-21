#!/usr/bin/perl


#向子程序传递参数

sub Average{

	$n = scalar(@_)  ;  #变量上下文
	$sum = 0  ;
	
	foreach $item (@_) {
		$sum += $item ;
	}
	
	$average = $sum / $n  ;
	
	print "传入的参数是：@_ \n"  ; 
	print "第一个参数是：$_[0] \n"  ;
	print "传入参数的平均值是：$average \n" ;
}

#函数调用

Average(10, 20, 30);



#向子程序传递哈希
#!/usr/bin/perl

#定义方法
sub  PrintHash{
	my (%hash) = @_ ;
	
	foreach my $key  (keys %hash) {
		my $value = $hash{$key} ;
		print "$key : $value \n";
	}
}


%hash = ('name'=>'runoob', 'age'=>'3') ;

#传递哈希
PrintHash(hash);
