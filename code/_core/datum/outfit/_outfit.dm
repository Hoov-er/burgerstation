/loadout/
	var/id = null
	var/list/obj/item/spawning_items = list() //Remember, order matters!

/loadout/proc/get_spawning_items()
	return spawning_items.Copy()

/loadout/proc/on_add(var/mob/living/advanced/A,var/obj/item/I)

	I.on_spawn()

	if(!I.quick_equip(A))
		qdel(I)
		return FALSE

	if(is_clothing(I))
		var/obj/item/clothing/C = I
		if(!C.additional_clothing)
			return TRUE
		C.equip_additional_clothing(A)

	return TRUE
