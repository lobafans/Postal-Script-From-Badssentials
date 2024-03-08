tickDegree = 0;
local nearest = nil;
local postals = Postals;
function round(num, numDecimalPlaces)
  if numDecimalPlaces and numDecimalPlaces>0 then
    local mult = 10^numDecimalPlaces
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end


RegisterCommand(Config.Misc.PostalCommand, function(source, args, raw)
	if #args > 0 then 
		local postalCoords = getPostalCoords(args[1]);
		if postalCoords ~= nil then 
			-- It is valid 
			SetNewWaypoint(postalCoords.x, postalCoords.y);
			TriggerEvent('chatMessage', Config.Prefix .. "Your waypoint has been set to postal ^5" .. args[1]);
		else 
			TriggerEvent('chatMessage', Config.Prefix .. "^1ERROR: That is not a valid postal code...");
		end
	else 
		SetWaypointOff();
		TriggerEvent('chatMessage', Config.Prefix .. "Your waypoint has been reset!");
	end
end)
function getPostalCoords(postal)
	for _, v in pairs(postals) do 
		if v.code == postal then 
			return {x=v.x, y=v.y};
		end
	end
	return nil;
end
