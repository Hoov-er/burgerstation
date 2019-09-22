mob/living/advanced/proc/handle_beardstyle_chargen(var/hair_num=1,var/desired_color) //This needs to be called when the buttons are made visible.

	var/choice01 = hair_num - 2
	var/choice02 = hair_num - 1
	var/choice_main = hair_num + 0
	var/choice03 = hair_num + 1
	var/choice04 = hair_num + 2

	for(var/obj/hud/button/chargen/beardstyle/slot01/B in buttons)
		B.hair_num = choice01
		if(desired_color)
			B.hair_color = desired_color
		B.update_icon()

	for(var/obj/hud/button/chargen/beardstyle/slot02/B in buttons)
		B.hair_num = choice02
		if(desired_color)
			B.hair_color = desired_color
		B.update_icon()

	for(var/obj/hud/button/chargen/beardstyle/main/B in buttons)
		B.hair_num = choice_main
		if(desired_color)
			B.hair_color = desired_color
		B.update_icon()

	for(var/obj/hud/button/chargen/beardstyle/slot03/B in buttons)
		B.hair_num = choice03
		if(desired_color)
			B.hair_color = desired_color
		B.update_icon()

	for(var/obj/hud/button/chargen/beardstyle/slot04/B in buttons)
		B.hair_num = choice04
		if(desired_color)
			B.hair_color = desired_color
		B.update_icon()

	for(var/obj/hud/button/chargen/change_beardstyle/B in buttons)
		B.hair_num = hair_num

	var/hair_id = hair_face_ids[choice_main]
	var/hair/face/H = hair_face_types[hair_id]
	if(desired_color)
		change_organ_visual("hair_face", desired_icon = H.icon, desired_icon_state = H.icon_state, desired_color = desired_color)
	else
		change_organ_visual("hair_face", desired_icon = H.icon, desired_icon_state = H.icon_state)

	update_all_blends()

	return TRUE

/obj/hud/button/chargen/change_beardstyle
	name = "cycle beardstyle right"
	dir = EAST
	icon_state = "arrow"

	var/hair_num = 1

	screen_loc = "CENTER+3,CENTER+3"

/obj/hud/button/chargen/change_beardstyle/clicked_by_object(var/mob/caller,object,location,control,params)

	if(is_advanced(caller))
		var/mob/living/advanced/A = caller
		hair_num = Clamp(hair_num + (dir == EAST ? 1 : -1),1,length(hair_face_types))
		A.handle_beardstyle_chargen(hair_num)

	return TRUE


/obj/hud/button/chargen/change_beardstyle/main/update_owner(var/mob/desired_owner)
	. = ..()
	if(. && is_advanced(desired_owner))
		var/mob/living/advanced/A = desired_owner
		hair_num = 1
		A.handle_beardstyle_chargen(1)
		world.log << "PENIS"

	return .

/obj/hud/button/chargen/change_beardstyle/left
	name = "cycle beardstyle left"
	dir = WEST

	screen_loc = "CENTER-3,CENTER+3"

/obj/hud/button/chargen/beardstyle/
	icon_state = "square_round"
	var/hair_num = 0
	var/hair_color = "#000000"

/obj/hud/button/chargen/beardstyle/update_icon()

	icon = initial(icon)
	icon_state = initial(icon_state)

	if(hair_num >= 1 && hair_num <= length(hair_face_types))
		var/hair_id = hair_face_ids[hair_num]
		if(hair_id)
			var/hair/face/H = hair_face_types[hair_id]
			if(H)
				name = H.name
				var/icon/I = new/icon(icon,icon_state)
				var/icon/I2 = new/icon('icons/mob/living/advanced/species/human.dmi',"head")
				var/icon/I3 = new/icon(H.icon,H.icon_state)
				I3.Blend(hair_color,ICON_MULTIPLY)
				I2.Blend(I3,ICON_OVERLAY)
				I2.Shift(SOUTH,9)
				I.Blend(I2,ICON_OVERLAY)
				icon = I

	..()

/obj/hud/button/chargen/beardstyle/clicked_by_object(var/mob/caller,object,location,control,params)
	if(is_advanced(caller))
		var/mob/living/advanced/A = caller
		A.handle_beardstyle_chargen(hair_num)
	return TRUE

/obj/hud/button/chargen/beardstyle/main
	icon_state = "square_round"
	screen_loc = "CENTER,CENTER+3"

/obj/hud/button/chargen/beardstyle/main/clicked_by_object(var/mob/caller,object,location,control,params)

	if(is_advanced(caller))
		var/mob/living/advanced/A = caller
		var/desired_color = input("Hair Color") as color
		A.handle_beardstyle_chargen(hair_num,desired_color)

	return TRUE

/obj/hud/button/chargen/beardstyle/slot01
	icon_state = "square_round_small"
	screen_loc = "CENTER-2,CENTER+3"

/obj/hud/button/chargen/beardstyle/slot02
	icon_state = "square_round_small"
	screen_loc = "CENTER-1,CENTER+3"

/obj/hud/button/chargen/beardstyle/slot03
	icon_state = "square_round_small"
	screen_loc = "CENTER+1,CENTER+3"

/obj/hud/button/chargen/beardstyle/slot04
	icon_state = "square_round_small"
	screen_loc = "CENTER+2,CENTER+3"



