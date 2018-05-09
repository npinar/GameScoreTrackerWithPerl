package ReadFromFile;

use strict;
use warnings;

sub new {
	my($class,$args) = @_;
	my $self = bless {file => $args->{file}
	 }, $class;
}


sub displayFileContent {
 
	print "-------------------------------------------------------\n";
	my $self = shift;
	 
	 open(my $data, '<', $self->{file}) or die "Could not open '$self->{file}' $!\n";

		while(my $line = <$data>) {
			chomp $line;
			print "$line\n";
		}
}

sub printStats {
	
	my $numberOfGames = 0;
	my $numberOfGoals = 0;
	my $averageGoalStat;
	
	print "-------------------------------------------------------\n";
	my $self = shift;
	 
	 open(my $data, '<', $self->{file}) or die "Could not open '$self->{file}' $!\n";

		while(my $line = <$data>) {
			chomp $line;
			$numberOfGames++;
			
			if($line =~ /Goals/) {
				my @fields = split "Goals:" , $line;
				$numberOfGoals = $numberOfGoals + $fields[1];
			}
		}
	print "You had $numberOfGames games and scored $numberOfGoals goals so far. Great Job!!!\n";	
	$averageGoalStat  = sprintf "%.2f", ($numberOfGoals / $numberOfGames);
	print "Your goal average is $averageGoalStat per game. Keep it up!\n";
	
}

1;



