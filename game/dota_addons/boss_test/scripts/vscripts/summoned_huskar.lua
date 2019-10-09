--big nice huge thanks to noya's warchasers steamtank miniboss for helping my dumb ass
function Spawn(entityKeyValues)
	ABILITY_dazzle_shallow_grave_spell = thisEntity:FindAbilityByName("dazzle_shallow_grave")
	ABILITY_burning_spear_spell = thisEntity:FindAbilityByName("huskar_burning_spear")
	print("Starting AI for "..thisEntity:GetUnitName().." "..thisEntity:GetEntityIndex())
	

	Timers:CreateTimer(function()
		if thisEntity:IsNull() ~= true then
local healthRemaining = thisEntity:GetHealth() / thisEntity:GetMaxHealth()
		local index = thisEntity:GetEntityIndex()
	if ABILITY_burning_spear_spell:IsFullyCastable() then	
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1000, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				print(#units.." units in radius of huskar_burning_spear")
				local target = units[1]
				thisEntity:CastAbilityOnTarget(target, ABILITY_burning_spear_spell, index)
				print("Burning Spear casted")
			end
		end
	end	
	if ABILITY_dazzle_shallow_grave_spell:IsFullyCastable() and healthRemaining <= 0.15 then
				local units = FindUnitsInRadius( DOTA_TEAM_NEUTRALS, thisEntity:GetAbsOrigin(), nil, 10, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )
				local target = units[1]
				thisEntity:CastAbilityOnTarget(target, ABILITY_dazzle_shallow_grave_spell, index)
				print("grave casted")
	end	 
	end	
	return 1.5
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