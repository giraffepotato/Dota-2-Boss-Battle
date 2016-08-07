--big nice huge thanks to noya's warchasers steamtank miniboss for helping my dumb ass
function Spawn(entityKeyValues)
	ABILITY_static_remnant_spell = thisEntity:FindAbilityByName("storm_spirit_static_remnant_datadriven")
	ABILITY_electric_vortex_spell = thisEntity:FindAbilityByName("storm_spirit_electric_vortex")
	ABILITY_enrage_heal_spell = thisEntity:FindAbilityByName("enrage_heal")
	print("Starting AI for "..thisEntity:GetUnitName().." "..thisEntity:GetEntityIndex())
	Timers:CreateTimer(function()

local index = thisEntity:GetEntityIndex()
local healthRemaining = thisEntity:GetHealth() / thisEntity:GetMaxHealth()

	if ABILITY_electric_vortex_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 400, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				thisEntity:CastAbilityNoTarget(ABILITY_electric_vortex_spell, index)
			end
		end
		--[[For some reason this check and the ones below it never return 1 so idk what is happening pls help bug pls 
			So the #units >= 0 is just a placeholder
		]]
	end	 
	

	if ABILITY_static_remnant_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1000, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				thisEntity:CastAbilityNoTarget(ABILITY_static_remnant_spell, index)
			end
		end
	end	

	if healthRemaining <= 0.35 and ABILITY_enrage_heal_spell:IsFullyCastable() then
		thisEntity:CastAbilityNoTarget(ABILITY_enrage_heal_spell, index)
		ABILITY_static_remnant_spell:EndCooldown() 
		ABILITY_electric_vortex_spell:EndCooldown() 
	end	
	return 2.5
	end) 
end

--[[function CollectWaypoints()
	
	local waypoint1 = Vector(0,0,0)
	local waypoint2 = Vector(100,100,100)
	local waypoint3 = Vector(-100,-100,-100)
	local waypoint4 = Vector(100,-100,-100)

	local waypoints = {waypoint1,waypoint2,waypoint3,waypoint4}

	for k,v in pairs(waypoints) do
		print(k,v)
	end

	return waypoints

end

POSITIONS = CollectWaypoints()

currentWaypoint = 1
givenOrder = false
reachedWaypoint = true
]]