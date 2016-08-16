--what the hell am i doing
--[[function Spawn( entityKeyValues )
	Timers:CreateTimer(function()
	units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 9999999, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
	for i=1,#units,1 do
		i_unit = units[i]:GetUnitName()
		i_unit_team_num = i_unit:GetTeamNumber
			if units ~= nil and (i_unit:GetTeamName(i_unit_team_num) == "DOTA_TEAM_GOODGUYS") then
				first_player_index = units[i]:GetEntityIndex()
				thisEntity:SetControllableByPlayer(first_player_index, true)
				print("set controllable by "..units[i]:GetUnitName())
			end
	end
		return 0.5
	end)
end