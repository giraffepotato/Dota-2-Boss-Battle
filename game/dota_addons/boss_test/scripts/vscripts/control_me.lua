function Spawn( entityKeyValues )
	Timers:CreateTimer(function()
	units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 9999999, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
	for i=1,#units,1 do
			if units ~= nil and i_unit ~= nil then
				first_player_index = units[i]:GetEntityIndex()
			end
	end
	thisEntity:SetControllableByPlayer(first_player_index, true
		return 0.5
	end)
end