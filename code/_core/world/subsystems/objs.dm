SUBSYSTEM_DEF(obj)
	name = "Objs Subsystem"
	desc = "Initialize objs after they are made."
	priority = SS_ORDER_OBJS

/subsystem/obj/Initialize()

	set background = 1

	var/obj_count = 0

	for(var/obj/O in world)
		INITIALIZE(O)
		obj_count++

	log_subsystem(name,"Initialized [obj_count] objects in world.")
