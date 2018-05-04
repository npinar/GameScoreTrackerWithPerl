package SoccerJournal;

use strict;
use warnings;


sub new {

    my $class = shift;
    my $self = {};
    bless $self, $class;
    return $self;
	
}

sub get_myTeam{
  my $self = shift;
  return $self->{myTeam};
}

sub set_myTeam{
  my ($self, $value) = @_;
  $self->{myTeam}=$value;  
 }
 
sub get_date{
  my $self = shift;
  return $self->{date};
 }
 
sub set_date{
  my ($self, $value) =@_;
  $self->{date}=$value;
}

sub  get_goals{
  my $self = shift;
  return $self->{goals};
  }
 
sub set_goals{
  my ($self, $value) =@_;
  return $self->{goals}=$value;
  }
  
sub to_string{
   my $self = shift;
   
   return "My Team: $self->{myTeam},Date: $self->{date},Goals: $self->{goals}\n";
   
}

1;