
require "Map/CGlobalObjectSystem"

CStashSystem = CGlobalObjectSystem:derive("CStashSystem")

function CStashSystem:new()
	local o = CGlobalObjectSystem.new(self, "farming")
	if not o.hoursElapsed then error "hoursElapsed wasn't sent from the server?" end
	return o
end

-- make the player more tired etc. when burry/digup stash
function CStashSystem:changePlayer(player)
	player:getStats():setFatigue(player:getStats():getFatigue() + 0.006)
	player:getStats():setEndurance(player:getStats():getEndurance() - 0.0013)
end