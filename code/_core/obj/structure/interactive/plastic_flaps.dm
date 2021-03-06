/obj/structure/interactive/plastic_flaps
	name = "airtight plastic flaps"
	desc = "What sorcery is this?"
	desc_extended = "Somehow prevents air and large beings from crossing."
	anchored = TRUE
	icon = 'icons/obj/structure/plastic_flaps.dmi'
	icon_state = "plastic_flaps"
	plane = PLANE_WALL_ATTACHMENTS

/obj/structure/interactive/plastic_flaps/Cross(atom/movable/O)

	if(is_living(O))
		var/mob/living/L = O
		if(!L.horizontal)
			return FALSE

	return ..()