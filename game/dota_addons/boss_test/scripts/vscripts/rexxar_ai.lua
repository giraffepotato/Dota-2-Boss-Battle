function Spawn(entityKeyValues)
	ABILITY_tentacle_mess_spell = thisEntity:FindAbilityByName("tentacle_mess")
	ABILITY_beetle_swarm_spell = thisEntity:FindAbilityByName("beetle_swarm")
	ABILITY_bird_flare_spell = thisEntity:FindAbilityByName("bird_flare")
	ABILITY_create_wolves_spell = thisEntity:FindAbilityByName("create_wolves")
	ABILITY_overpower_spell = thisEntity:FindAbilityByName("ursa_overpower")

	print("Starting AI for "..thisEntity:GetUnitName().." "..thisEntity:GetEntityIndex())
	Timers:CreateTimer(function()

		local index = thisEntity:GetEntityIndex()
		local healthRemaining = thisEntity:GetHealth() / thisEntity:GetMaxHealth()
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1000, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )

		if not ABILITY_tentacle_mess_spell:GetToggleState() and units ~= nil and #units >= 1 then
			thisEntity:CastAbilityToggle(ABILITY_tentacle_mess_spell, index)
			
		end	 
		
		if ABILITY_beetle_swarm_spell:IsFullyCastable() and units ~= nil and #units >= 1 then
			thisEntity:CastAbilityNoTarget(ABILITY_beetle_swarm_spell, index)	
		end	

		if ABILITY_bird_flare_spell:IsFullyCastable() and units ~= nil and #units >= 1 then
			local target = units[1]
			thisEntity:CastAbilityOnTarget(target, ABILITY_bird_flare_spell, index)
		end	

		if ABILITY_overpower_spell:IsFullyCastable() and units ~= nil and #units >= 1 then
			thisEntity:CastAbilityNoTarget(ABILITY_overpower_spell, index)
			
		end

		if healthRemaining <= 0.35 and ABILITY_create_wolves_spell:IsFullyCastable() then
			Timers:CreateTimer(0.06, function()	
				thisEntity:CastAbilityNoTarget(ABILITY_create_wolves_spell, index)
			end)
		end
		return 2.5
	end) 
end