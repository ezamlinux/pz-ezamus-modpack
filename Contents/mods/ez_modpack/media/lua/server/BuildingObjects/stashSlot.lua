require "BuildingObjects/ISBuildingObject"

stashSlot = ISBuildingObject:derive("stashSlot");

function farmingPlot:new(handItem, character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	o:setNorthSprite("vegetation_farming_01_1");
	o:setSprite("vegetation_farming_01_1");
	o.handItem = handItem;
	o.skipBuildAction = true
    o.character = character;
    o.noNeedHammer = true;
	return o;
end