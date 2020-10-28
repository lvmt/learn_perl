#!/usr/bin/perl
use strict;
use FindBin qw($Bin);
die "perl $0 <sample.csv> <out dir>" unless @ARGV == 2;
my %info;
my %dir;
my %lane;
my %path;
my %chips;
my $tot;
my $file = shift;
my $outdir = shift;
my @file_tmp=split('\.',$file);
if($outdir){
	$outdir = $outdir."/$file_tmp[0]" ; 
}else{
	$outdir||="/jdfstj1/B2C_COM_P1/pancancer/AIO/$file_tmp[0]";
}
print "OutDir : $outdir \n\n" ;
system("mkdir -p $outdir");
open IN,$file or die $!;
my @DIR;
my $dir_line;
system("cd /jdfstj1/solexa_A");
system("cd - ");
system("cd /jdfstj2/solexa_A");
system("cd - ");
my $pathfile="$outdir/4Pipe.path";
open O , "> $pathfile" or die $! ;
open SH , "> $outdir/4Pipe.sh" or die $! ;
print O "#Bed\tUSE.Patient\tType\tLibrary\tChip\tLane\tBarcode\tUMI\tFq1\tFq2\n";

print "################# Start Find Raw Data ########################\n" ;
while(my $i=<IN>){
	chomp $i;
	next if $i=~/^#/;
	$i=~s# #_#g;
	my($Product,$Patch,$Date,$Chip,$Lane,$use,$DNA,$Sam,$Patient,$type,$Bed,$Barcode,$umi)=split("\t",$i);
	$umi=$Barcode unless ($umi=~/\d/);
	$type="Tissue" if $type=~/P|T/;
	$type="Normal" if $type=~/ctrl/;
	$Bed="PanCancer" if $Bed=~/pancancer/i;
	system("mkdir -p $outdir ") ;
	$Lane=~s#[a-zA-Z]##g;
	print $Lane."\n";
	my @lanes=split(",",$Lane);
	foreach my $lane(@lanes){
		$lane=~s#[^\d]##g;
		$lane="$lane";
		my @dir ;
			print "/jdfstj1/solexa*/fqdata*/Zebra/MGISEQ-2000/*/*/*${Chip}_L${lane}_*-${Barcode}/${Chip}_L0${lane}_${Barcode}_1.fq.gz\n";
# print "/share/nastj6/solexa*/fqdata*/Zebra/MGISEQ-2000/*/*/*${Chip}_L${lane}_*-${Barcode}/${Chip}_L0${lane}_${Barcode}_1.fq.gz\n"; 
# /jdfstj1/BC_RAWDATA_01/mgiseq/R100400180003/V300076408/L03/V300076408_L03_1204_1.fq.gz
		@dir=glob("/jdfstj1/BC_RAWDATA_01/mgiseq/*/$Chip/L0$lane/${Chip}_L0${lane}_${Barcode}_1.fq.gz") unless (defined $dir[0]);
		@dir=glob("/jdfstj2/solexa*/fqdata*/Zebra/MGISEQ-2000/\*/\*/\*${Chip}_L${lane}_\*-${Barcode}/\*_1.fq.gz") unless (defined $dir[0]);
		@dir=glob("/jdfstj1/solexa*/fqdata*/Zebra/MGISEQ-2000/\*/\*/\*${Chip}_L${lane}_\*-${Barcode}/\*_1.fq.gz ") unless (defined $dir[0]);
		@dir=glob("/zfstj1/solexa*/fqdata*/Zebra/MGISEQ-2000/\*/\*/\*${Chip}_L${lane}_\*-${Barcode}/\*_1.fq.gz") unless (defined $dir[0]);
		@dir=glob("/zfstj1/solexa*/fqdata*/Zebra/\*/\*/\*${Chip}_L${lane}_\*-${Barcode}/${Chip}_L0${lane}_${Barcode}_1.fq.gz") unless (defined $dir[0]);
		@dir=glob("/share/solexa*/fqdata*/Zebra/*/*/\*${Chip}_L${lane}_\*-${Barcode}/${Chip}_L0${lane}_${Barcode}_1.fq.gz") unless (defined $dir[0]);
		@dir=glob("/share/nastj6/solexa*/fqdata*/Zebra/MGISEQ-2000/*/*/*${Chip}_L${lane}_*-${Barcode}/${Chip}_L0${lane}_${Barcode}_1.fq.gz") unless (defined $dir[0]);
		@dir=glob("/zfstj1/solexa*/*/MGISEQ-2000/*/*/*${Chip}_L${lane}_*-${Barcode}/${Chip}_L0${lane}_${Barcode}_1.fq.gz") unless (defined $dir[0]);
		if(!defined $dir[0]){
			print "## Error : Can't Find Raw Data for # $i \n\n";
			exit(0);		
		}
		for my $i(@dir){
			my $path=$i ;
			my $key="Pancancer688\t$use.$Patient\t$type\t$DNA\t$Chip\t$lane\t$Barcode\t$umi" ;
			$path=~s/1.fq.gz$/2.fq.gz/g;
			print O $key."\t$i\t$path\n";
		}
	}
}

close O;
my $file = "$outdir/4Pipe.path";
my %dict;
open I,"< $file " or die;
while(<I>){
	    chomp;
		next if(/^#/);
		my($USER,$type)= (split "\t" )[1,2];
					$dict{$USER}{$type}++;

}
for my $key (keys %dict){
		if(!exists($dict{$key}{"Normal"})){
			foreach my $i (1..4){
				my $cmd = "PanCancer\t$key\tNormal\tlibrary\tV300040729\t$i\t30\t30\t/jdfstj2/solexa_A/fqdata23A/Zebra/MGISEQ-2000/T055_DX0503/BGISEQ-50019TJ0004062/191213_I20_V300040729_L${i}_DX0503BWWRAAAPEI-30/V300040729_L0${i}_30_1.fq.gz\t/jdfstj2/solexa_A/fqdata23A/Zebra/MGISEQ-2000/T055_DX0503/BGISEQ-50019TJ0004062/191213_I20_V300040729_L${i}_DX0503BWWRAAAPEI-30/V300040729_L0${i}_30_2.fq.gz";
				system("echo '$cmd' >> $file");
			}
		}
}

system("cd $outdir");
system("mkdir -p $outdir/sh");
print  SH "/jdfstj1/B2C_COM_P1/PipeAdmin/02.software/Conda/bin/snakemake -s /jdfstj1/B2C_COM_P1/PipeAdmin/04.Pipeline/aio.v2.Dev/PanCancer.Pipeline.bak.smk  -p -C UnAnalysis=\"Drug_ct,final_hereditary_tumor\" S=$pathfile O=$outdir --cluster \"qsub -clear -cwd -P B2C_Cancer -q bc_b2c.q -l num_proc={threads} -l vf={resources.mem_mb}M -binding linear:{threads}\" --rerun-incomplete --jobs 1000 --restart-times 5 --keep-going --rerun-incomplete --latency-wait 60 --stats runtime.json --drmaa-log-dir $outdir/sh " ;

close IN;
