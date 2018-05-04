#!/usr/bin/perl
use warnings;
use strict;

use WriteToFile;
use SoccerJournal;
use ReadFromFile;
use Switch;

my $filename = 'gamestats.csv';

print "What would you like to do?\n";
print "Please choose one of the options from below.\n";
print "print - to display the existing game stats.\n";
print "add - to add a new game stat.\n";

my $userInput = <STDIN>;
chomp $userInput;

switch($userInput) {
   
   case "print" {
      my $existingData = ReadFromFile->new({file => $filename});
      $existingData->print();
      }
   case "add" {
      addGameStat();
      }
   }




sub addGameStat {

   my $data = SoccerJournal->new();	
		
   #let's get user inputs
   my $input;
   do {
    {
       print "----------------------------------------\n";	
       print "Type exit at any time to quit entry\n";
       print "Enter the team you played for:\n";
       chomp($input = <STDIN>);
       last if($input eq "exit");
       $data->set_myTeam($input);
       
       print "Enter the date of the game: MM-DD-YEAR\n";
       chomp($input=<STDIN>);
       last if($input eq "exit");
       $data->set_date($input);
      
       print "Enter the number of goals you scored:\n";
       chomp($input = <STDIN>);
       last if($input eq "exit");
       $data->set_goals($input);         
       
       print "Press Enter to add another game or type exit to quit.\n";
       chomp($input = <STDIN>);
    }               
   } until($input eq "exit");


    if(defined $data->get_myTeam() && defined $data->get_date() && defined $data->get_goals()) {
        if(!$data->get_myTeam() eq '' && !$data->get_date() eq '' && !$data->get_goals() eq '') {
         my $appendFile = WriteToFile->new({
                           filename => $filename, 
                           data => $data->to_string()
                           });
      $appendFile->write(); 
      print $data->to_string();
     
      }
    
   }
 
}


	  