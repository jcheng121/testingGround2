
use strict;
my @branches = `git branch`;
my $activeBranch;

chomp @branches;
foreach my $branch  (@branches)
{
   $branch =~ s/\s//g;
   if ($branch =~ /\*(\w+)/)
   {
      $activeBranch = $1;
   }
   print $branch, "\n";
}
print "Active Branch is <", $activeBranch, ">\n";
