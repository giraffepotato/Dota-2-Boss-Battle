--big nice huge thanks to noya's warchasers steamtank miniboss for helping my dumb ass
function Spawn(entityKeyValues)
	ABILITY_tentacle_mess_spell = thisEntity:FindAbilityByName("tentacle_mess")
	ABILITY_beetle_swarm_spell = thisEntity:FindAbilityByName("beetle_swarm")
	ABILITY_bird_flare_spell = thisEntity:FindAbilityByName("bird_flare")
	ABILITY_unit_spawn_spell = thisEntity:FindAbilityByName("unit_spawn_test")
	--ABILITY_enrage_huskar_spell = thisEntity:FindAbilityByName("enrage_huskar")
	print("Starting AI for "..thisEntity:GetUnitName().." "..thisEntity:GetEntityIndex())
	
	Timers:CreateTimer(function()
local index = thisEntity:GetEntityIndex()
local healthRemaining = thisEntity:GetHealth() / thisEntity:GetMaxHealth() 
	
	if ABILITY_tentacle_mess_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 950, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				thisEntity:CastAbilityNoTarget(ABILITY_tentacle_mess_spell, index)
			end
		end
	end	 

	if ABILITY_beetle_swarm_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 800, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				thisEntity:CastAbilityNoTarget(ABILITY_beetle_swarm_spell, index)
			end
		end
	end	 

	if ABILITY_bird_flare_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1000, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				local target = units[1]
				thisEntity:CastAbilityOnTarget(target, ABILITY_bird_flare_spell, index)
			end
		end
	end	

	if ABILITY_unit_spawn_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1000, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				thisEntity:CastAbilityNoTarget(ABILITY_unit_spawn_spell, index)
			end
		end
	end

	return 1.5
	end) 
end
