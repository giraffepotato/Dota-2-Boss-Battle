--big nice huge thanks to noya's warchasers steamtank miniboss for helping my dumb ass
function Spawn(entityKeyValues)
	ABILITY_tentacle_mess_spell = thisEntity:FindAbilityByName("tentacle_mess")
	ABILITY_beetle_swarm_spell = thisEntity:FindAbilityByName("beetle_swarm")
	ABILITY_bird_flare_spell = thisEntity:FindAbilityByName("bird_flare")
	ABILITY_unit_spawn_spell = thisEntity:FindAbilityByName("unit_spawn_test")
	ABILITY_big_trees_spell = thisEntity:FindAbilityByName("rexxar_spawn_big_trees")
	print("Starting AI for "..thisEntity:GetUnitName().." "..thisEntity:GetEntityIndex())
	tentacles = "no"
	print("tentacles is "..tentacles)

	Timers:CreateTimer(function()
local index = thisEntity:GetEntityIndex()
local healthRemaining = thisEntity:GetHealth() / thisEntity:GetMaxHealth() 
	
	if (ABILITY_tentacle_mess_spell:IsFullyCastable()) and (tentacles == "no") then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1000, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				thisEntity:CastAbilityToggle(ABILITY_tentacle_mess_spell, index)
				tentacles = "yes"
				print("tentacles is "..tentacles)
			end
		end
	end	 
	
	if ABILITY_beetle_swarm_spell:IsFullyCastable() then
		print("beetle castable")
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1000, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				thisEntity:CastAbilityNoTarget(ABILITY_beetle_swarm_spell, index)
			end
		end
	end	 

	if ABILITY_bird_flare_spell:IsFullyCastable() then
		print("flare castable")
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1000, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				local target = units[1]
				thisEntity:CastAbilityOnTarget(target, ABILITY_bird_flare_spell, index)
			end
		end
	end	

	if ABILITY_unit_spawn_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1500, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )
		print("spawn small trees castable "..#units)
		if units ~= nil then
			if #units >= 2 then
				thisEntity:CastAbilityNoTarget(ABILITY_unit_spawn_spell, index)
			end
		end
	end

	if ABILITY_big_trees_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1500, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )
		print("big trees castable "..#units)
		if units ~= nil then
			if #units >= 2 then
				thisEntity:CastAbilityNoTarget(ABILITY_big_trees_spell, index)
			end
		end
	end

	return 1.5
	end) 
end
