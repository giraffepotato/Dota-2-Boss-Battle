function Spawn( entityKeyValues )
	print("Starting AI for "..thisEntity:GetUnitName().." "..thisEntity:GetEntityIndex())
	Timers:CreateTimer(function()
		return 1.5
	end)
end