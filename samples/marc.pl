#!/usr/bin/env perl
use MARC::Record;
my $record = MARC::Record->new();

## add the leader to the record. optional.
$record->leader(’00903pam 2200265 a 4500’);
 
## create an author field.
my $author = MARC::Field->new(
  ’100’,1,’’,
  a => ’Logan, Robert K.’,
  d => ’1939-’
);

$record->append_fields($author);

## create a title field.
my $title = MARC::Field->new(
  ’245’,’1’,’4’,
  a => ’The alphabet effect /’,
  c => ’Robert K. Logan.’
  );

$record->append_fields($title); 
