package ReadFromFile;

use strict;
use warnings;

sub new {
	my($class,$args) = @_;
	my $self = bless {file => $args->{file}
	 }, $class;
}


sub print {
 
print "-------------------------------------------------------\n";
my $self = shift;
 
 open(my $data, '<', $self->{file}) or die "Could not open '$self->{file}' $!\n";

	while(my $line = <$data>) {
		chomp $line;
		print "$line\n";
	}
}

1;



