function summon_huskar( keys )
	local caster = keys.caster
	local ability = keys.ability
	local target = keys.target
	local huskar = CreateUnitByName("npc_dazzle_huskar_summon", caster:GetAbsOrigin() + RandomVector(math.random(1000, 50)), true, caster, nil, caster:GetTeam())
	huskar:FindAbilityByName("huskar_burning_spear"):UpgradeAbility(true)
	huskar:FindAbilityByName("dazzle_shallow_grave"):UpgradeAbility(true)
	huskar:FindAbilityByName("huskar_berserkers_blood"):UpgradeAbility(true)

end