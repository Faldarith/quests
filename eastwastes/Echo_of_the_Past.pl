my $expedition_name = "Eastern Wastes";
my $min_players     = 1;
my $max_players     = 72;
my $dz_zone         = "eastwastes";

sub EVENT_SAY {
  plugin::OfferStandardInstance($expedition_name, $min_players, $max_players, $dz_zone);
}