#!/usr/bin/perl

# global
$conf_file = "./config";
my %config = {};

# default
$config{'seek'} = 0;

ReadConfig();

Status4xx();		# check log status 
CheckURLPatten();

Update2ApacheBlock();

WriteConfig();

sub Status4xx{
	# check if too many 4xx status at the same IP Address.


}

sub ReadConfig{
	my ( $file ) = @_;
	$conf_file = "$file" if ( $file );
	open( CONF, "< $conf_file");
	while( <CONF> ){
		/^([\w\-\_]+):([\w\-\_]+)/i;
		$config{ $1 } = $2;
	close( CONF );
}

sub WriteConfig{
	my ( $file ) = @_;
	$conf_file = "$file" if ( $file );
	open( CONF, "> $conf_file");
		for my $c ( keys %config ){
			print CONF "$c:$config{$c}"
		}
	close( CONF );
}

