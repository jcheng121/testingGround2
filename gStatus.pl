
use strict;
my @branches = `git branch`;
my $activeBranch = getActiveBranch(\@branches);
print "my active branch is ", $activeBranch,"\n";
#checkStatus();
findAllRepository("\/c");

sub checkStatus ()
{
   my @status = `git status -s`;
   chomp @status;
   my $lines = @status;
   if ($lines >= 1)
   {
      print @status;
   }
   else
   {
      print "Nothing to worry about, you can switch branch\n";
   }
}

sub getActiveBranch ()
{
   my ($ref_mybranches) = @_;  
   chomp @$ref_mybranches;

   foreach my $branch  (@$ref_mybranches)
   {
      $branch =~ s/\s//g;
      if ($branch =~ /\*(\w+)/)
      {
         $activeBranch = $1;
      }
   }
   return $activeBranch;
}

sub findAllRepository
{
   my ($dir) = @_;
   print ("Scanning through directory ", $dir);
   print "\n","-"x80,"\n";
   my (@repository) = system("find $dir -name \"\.git\"");
   print @repository;
}
