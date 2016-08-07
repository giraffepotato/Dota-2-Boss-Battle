--[[
	Author: kritth
	Date: 11.01.2015.
	Create a listener to listen to the abiltiy casted in the game

	Changed: 25.03.2015. - Implemented a bugfix by NEO
]]
function overload_check_order( keys )
	local caster = keys.caster
	local ability = keys.ability
	
	ability:ApplyDataDrivenModifier( caster, caster, "modifier_overload_damage_datadriven", {} )

end