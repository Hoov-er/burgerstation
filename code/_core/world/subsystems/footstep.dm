var/global/list/all_footsteps = list()

SUBSYSTEM_DEF(footstep)
	name = "Footstep Subsystem"
	desc = "Store all the footstep effects."
	priority = SS_ORDER_PRELOAD

/subsystem/footstep/Initialize()

	for(var/k in subtypesof(/footstep/))
		var/footstep/F = k
		var/id = initial(F.id)
		if(id)
			F = new k
			all_footsteps[id] = F

	log_subsystem(name,"Initialized [length(all_footsteps)] footstep types.")