--big nice huge thanks to noya's warchasers steamtank miniboss for helping my dumb ass
function Spawn(entityKeyValues)
	ABILITY_poison_touch_spell = thisEntity:FindAbilityByName("poison_touch_datadriven")
	ABILITY_weave_spell = thisEntity:FindAbilityByName("dazzle_weave")
	ABILITY_shadow_wave_spell = thisEntity:FindAbilityByName("shadow_wave_datadriven")
	ABILITY_summon_spike_spell = thisEntity:FindAbilityByName("dazzle_summon_spike")
	ABILITY_enrage_huskar_spell = thisEntity:FindAbilityByName("enrage_huskar")
	print("Starting AI for "..thisEntity:GetUnitName().." "..thisEntity:GetEntityIndex())
	
	Timers:CreateTimer(function()
local index = thisEntity:GetEntityIndex()
local healthRemaining = thisEntity:GetHealth() / thisEntity:GetMaxHealth()
	if ABILITY_summon_spike_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1200, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
		if units ~= nil then
			--returns 2 when 1 unit near?? wtf
			if #units >= 2 then
				thisEntity:CastAbilityNoTarget(ABILITY_summon_spike_spell, index)
			end
		end
	end	 
	
	if ABILITY_shadow_wave_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_NEUTRALS, thisEntity:GetAbsOrigin(), nil, 2200, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 2 then
				local target = units[1]
				thisEntity:CastAbilityOnTarget(target, ABILITY_shadow_wave_spell, index)
			end
		end
	end	 

	if ABILITY_weave_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 700, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				local target = units[1]
				thisEntity:CastAbilityOnPosition(target:GetAbsOrigin(), ABILITY_weave_spell, index)
			end
		end
	end	 

	if ABILITY_poison_touch_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1000, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				local target = units[1]
				thisEntity:CastAbilityOnTarget(target, ABILITY_poison_touch_spell, index)
			end
		end
	end	

	if healthRemaining <= 0.35 and ABILITY_enrage_huskar_spell:IsFullyCastable() then
		print("Dazzle has been enraged")
		thisEntity:CastAbilityNoTarget(ABILITY_enrage_huskar_spell, index)
		ABILITY_weave_spell:EndCooldown() 
		ABILITY_poison_touch_spell:EndCooldown() 
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