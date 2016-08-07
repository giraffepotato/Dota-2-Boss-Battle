--big nice huge thanks to noya's warchasers steamtank miniboss for helping my dumb ass
function Spawn(entityKeyValues)
	ABILITY_revive_drow_spell = thisEntity:FindAbilityByName("boss_revive_drow")
	print("Starting AI for "..thisEntity:GetUnitName().." "..thisEntity:GetEntityIndex())
	
	Timers:CreateTimer(function()
local index = thisEntity:GetEntityIndex()
local healthRemaining = thisEntity:GetHealth() / thisEntity:GetMaxHealth()
	if ABILITY_revive_drow_spell:IsFullyCastable() then
		units = FindUnitsInRadius( DOTA_TEAM_NEUTRALS, thisEntity:GetAbsOrigin(), nil, 9999999, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
		detected = "false"
		for i=1,#units,1 do
			local i_unit = units[i]:GetUnitName() 
			if units ~= nil and i_unit ~= nil then
				if i_unit == "npc_clinkz_boss" then
					detected = "true"
					--for the purpose of bool concat xD
				end
			end
		end
		if not (detected == "true") then
			thisEntity:CastAbilityNoTarget(ABILITY_revive_drow_spell, index)
		end
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