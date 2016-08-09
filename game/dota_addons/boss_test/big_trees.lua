--big nice huge thanks to noya's warchasers steamtank miniboss for helping my dumb ass
function Spawn(entityKeyValues)
	ABILITY_quill_spray_spell = thisEntity:FindAbilityByName("bristleback_quill_spray")
	print("Starting AI for "..thisEntity:GetUnitName().." "..thisEntity:GetEntityIndex())
	
	Timers:CreateTimer(function()
local index = thisEntity:GetEntityIndex()
local healthRemaining = thisEntity:GetHealth() / thisEntity:GetMaxHealth()
	
	if ABILITY_quill_spray_spell:IsFullyCastable() then
		print("quill spray castable")
		local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 625, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
		if units ~= nil then
			print("units quill not nil")
			if #units >= 1 then
				print("quill casted")
				thisEntity:CastAbilityNoTarget(target, ABILITY_quill_spray_spell, index)
				print("post quill")
			end
		end
	end	 

	return 1.5
	end) 
end
