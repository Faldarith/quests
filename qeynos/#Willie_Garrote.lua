---- Quest:Investigators Badge (Badge #1)
-- QGlobal Helpers for Badge Quest #1 (qeynos_badge1)
-- 1 = Received Investigator's Briefing
-- 2 = First Suspect
-- 3 = Rileys Confession
-- 4 = Summoned Guard for Riley
-- 5 = Willies Confession
-- 6 = Summoned Guard for Willie
-- 7 = Have the Investigators Badge
-- Failure of the an_investigator section will reset you back to QGlobal 1 so you can restart the escort portion

function event_spawn(e)
	eq.set_timer("depop",1800000);
end

function event_say(e)
	if e.message:findi("bloodsaber") then
		e.self:Say("A Bloodsaber? Of course I'm not, don't be ridiculous!");
		eq.signal(1031,1,5000); -- an_investigator
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 2344}) then  -- Item: Confession Document
		e.self:Say("Here's your confession.  I hope you choke on it!");
		e.other:SummonItem(2394);					-- Item: Willies Confession
		eq.set_global("qeynos_badge1","5",5,"F");	-- QGlobal: Badge Globals
		eq.unique_spawn(1197,0,0,55,-341,-16,0);	-- NPC: #Donally_Stultz
		eq.set_timer("depop", 5 * 60 * 1000);		-- reset time for guard to escort him before depopping
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text)
end

function event_timer(e)
	if e.timer == "depop" then
		e.self:Say("I'm outta here!");
		eq.depop();
	end
end

function event_signal(e)
	if e.signal == 1 then
		e.self:Emote("begins to perspire and says, 'Umm... Well, I don't know. It just started following me around.  You know, like a puppy. I didn't actually RAISE it. Really. Come on!'");
		eq.signal(1031,2,5000); -- NPC: an_investigator
	elseif e.signal == 2 then
		e.self:Say("You really believe that I would do that sort of thing? Undead scare me to death! Really, they do! You folks can not be serious about this, can you? Give me a break already!");
		eq.signal(1031,3,5000); -- NPC: an_investigator
	elseif e.signal == 3 then
		e.self:Say("All right! Fine! I admit I've raised a few servants in my time. I hold no love for Antonius Bayle and frankly, I tire of keeping to the shadows and crawling through the blasted sewers as a second class citizen in my home town! I'll sign your blasted document but know that this is only the tip of the shark's fin you see sticking out of the water. The next and last thing you'll see are its teeth before you are consumed!");
		eq.set_timer("depop",90 * 1000); -- reset timer to 1 minutes to trade for document
	elseif e.signal == 4 then
		eq.start(67);
	end
end
