function Spawn( entityKeyValues )
	print("Starting AI for "..thisEntity:GetUnitName().." "..thisEntity:GetEntityIndex())
	Timers:CreateTimer(function()
		units = FindUnitsInRadius( DOTA_TEAM_NEUTRALS, thisEntity:GetAbsOrigin(), nil, 9999999, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
		for i=1,#units,1 do
			local i_unit = units[i]:GetUnitName()
			if units ~= nil and i_unit ~= nil then 
				if i_unit == "npc_rexxar_boss" then
					thisEntity:MoveToPositionAggressive(i_unit:GetAbsOrigin())
				end
			end
		end
		return 1.5
	end)
end