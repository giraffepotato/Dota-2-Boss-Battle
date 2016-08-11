function Spawn(entityKeyValues)
	ABILITY_tormentor_fire_spell = thisEntity:FindAbilityByName("tormentor_fire")
	ABILITY_dodge_circle_spell = thisEntity:FindAbilityByName("dodge_circle")
	print("Starting AI for "..thisEntity:GetUnitName().." "..thisEntity:GetEntityIndex())
	caster = keys.caster
	Timers:CreateTimer(function()
local index = thisEntity:GetEntityIndex()
--local healthRemaining = thisEntity:GetHealth() / thisEntity:GetMaxHealth()
	
	if ABILITY_tormentor_fire_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 825, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				target = units[1]
				thisEntity:CastAbilityOnPosition(target:GetAbsOrigin(), ABILITY_tormentor_fire_spell, index)
			end
		end
	end	

	if ABILITY_dodge_circle_spell:IsFullyCastable() then
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 1200, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
		if units ~= nil then
			if #units >= 1 then
				target = units[1]
				thisEntity:CastAbilityOnPosition(caster:GetAbsOrigin(), ABILITY_dodge_circle_spell, index)
			end
		end
	end 

	return 1.5
	end) 
end
