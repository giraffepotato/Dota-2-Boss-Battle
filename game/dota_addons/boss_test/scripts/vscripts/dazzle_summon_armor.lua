function stack_armor( keys )
	local caster = keys.caster
	local target = keys.target
	local modifier = keys.modifier

	local current_stack = target:GetModifierStackCount(modifier,caster)
	local units = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, caster:GetAbsOrigin(), nil, 800, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false )
	print("spike finds "..#units)
	if (current_stack < 1) then
		target:SetModifierStackCount(modifier,caster,1)
	elseif (current_stack <= 31) and (#units > 1) then
		target:SetModifierStackCount(modifier,caster,current_stack + 1)
	end
end