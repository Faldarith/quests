#berzerker epic
#written:wizardam
#9/13/07

sub EVENT_SAY {
    if ($text =~ /Hail/i) {
        quest::me("You feel the spirits rage being released...");
        quest::say(". . . [return]");
    }
    if ($text =~ /return/i) {
        quest::movepc(78, 3603, 2088, -155); # Zone: fieldofbone
        quest::depop();
    }
}

sub EVENT_KILLED_MERIT {
    $client->SetBucket("ber_1_berserker_image", "complete");
}
