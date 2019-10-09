function FindAbilityTest( keys )
	print("1") 
	local caster = keys.caster
	print("2")
	local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, caster:GetOrigin(), nil, 500, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )
	print("Units "..#units)
end