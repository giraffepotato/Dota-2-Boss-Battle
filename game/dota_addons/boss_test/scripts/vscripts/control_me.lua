function Spawn( entityKeyValues )
	units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 9999999, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
	units[1]:GetEntityIndex() = first_player_index
	thisEntity:SetControllableByPlayer(first_player_index, true)
end