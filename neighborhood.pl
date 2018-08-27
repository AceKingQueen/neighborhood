use DBI
use strict;

my $driver = "mysql"; 
my $database = "chinook";
my $dsn = "DBI:$driver:database=$database";
#userid & password are both empty strings
my $userid = "";
my $password = "";

my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;

my $sth = $dbh->prepare("SELECT * FIRST_NAME, LAST_NAME, HOME
                        FROM NEIGHBORHOOD");
$sth->execute() or die $DBI::errstr;
print "Number of rows found :" + $sth->rows;
while (my @row = $sth->fetchrow_array()) {
   my ($first_name, $last_name, $home ) = @row;
   print "First Name = $first_name, Last Name = $last_name\n, Home = $home\n";
}
$sth->finish();