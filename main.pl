#!/usr/bin/perl
use warnings;
use strict;

use WriteToFile;
use SoccerJournal;


#default values
my $data = SoccerJournal->new({
                        myteam =>"unknown",
                        date => "unknown", 
			goals => -1});
			
print "default values are:\n", $data->to_string();			
		
#let's get user inputs
my $input;
do {
 {
    print "enter exit to quit\n";
    print "Enter the team you played for:\n";
    chomp($input = <STDIN>);
    last if($input eq "exit");
    $data->set_myTeam($input);
    
    print "Enter the date of the game: MM/DD/YEAR\n";
    chomp($input=<STDIN>);
    last if($input eq "exit");
    $data->set_date($input);
   
    print "Enter the number of goals you scored:\n";
    chomp($input = <STDIN>);
    last if($input eq "exit");
    $data->set_goals($input);         
    
    print "Enter to continue to enter another game or type exit to quit.\n";
    chomp($input = <STDIN>);
 }               
} until($input eq "exit");

	  
print $data->to_string();
 
my $filename = 'c:\perl_tests\gamestats.txt';

my $appendFile = WriteToFile->new({
                        filename => $filename, 
                        data => $data->to_string()
                        });
$appendFile->write(); 



	  