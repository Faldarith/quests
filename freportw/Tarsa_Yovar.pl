sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Keep your voice down friend. The Dismal Rage and their fool pawns the Freeport Militia have eyes and ears in every corner of the city. It is not safe for you to be among us unless you too have been placed on the Militias most wanted list.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
