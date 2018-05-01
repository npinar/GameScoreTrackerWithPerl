package WriteToFile;

use strict;
use warnings;

sub new {
	
	my($class, $args) = @_;
	my $self = bless {fileName => $args->{filename},
			  mydata => $args->{data}
                       }, $class;
	
	}
	
sub write {

	my $self = shift;
	open(FH, '>>', $self->{fileName}) or die $!;
 
	print FH $self->{mydata};
 
	close(FH);
	print "Writing to file successfully!\n";	
}

1;