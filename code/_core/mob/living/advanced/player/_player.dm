var/global/list/mob/living/advanced/player/all_players = list()

/mob/living/advanced/player/
	desc = "Seems a little smarter than most, you think."
	desc_extended = "This is a player."

	starting_factions = list(
		FACTION_PLAYER
	)
	class = "default"

	var/dialogue_target_id
	var/atom/dialogue_target

	invisibility = INVISIBILITY_PLAYERS

	var/spam_protection_command = 0
	//Increases by a certain amount every time something is used.
	//Measured in seconds.
	//Reduces by 1 every second.

	var/last_track_time = -1

	//var/spawn_protection = 0

	respawn = FALSE

	has_hard_crit = TRUE

	movement_delay = DECISECONDS_TO_TICKS(1)

	var/list/attack_logs = list()

	var/currency = 1000

	var/savedata/client/mob/mobdata

	var/logout_time = 0

	health_base = 100
	stamina_base = 100
	mana_base = 100

	var/attack_mode = 1
	var/list/attack_left = list(
		list(16,16),
		list(16,16),
		list(16,16),
		list(16,16)

	)
	var/list/attack_right = list(
		list(16,16),
		list(16,16),
		list(16,16),
		list(16,16)
	)

	allow_experience_gains = TRUE

	var/obj/item/device/active_device
	var/obj/structure/active_structure
	var/obj/item/paper/active_paper

	var/squad/current_squad

	var/geared_up

/mob/living/advanced/player/apply_mob_parts(var/teleport=TRUE,var/do_load=TRUE,var/update_blends=TRUE)

	if(!mobdata || !length(mobdata.loaded_data["organs"]) || !do_load)
		return ..()

	mobdata.apply_data_to_mob(src,teleport,update_blends)

	if(client)
		add_species_buttons()
		add_species_health_elements()

	return TRUE

/mob/living/advanced/player/Initialize()
	. = ..()
	all_players += src
	return .

/mob/living/advanced/player/setup_name()

	if(real_name == "humanoid")
		real_name = "[gender == MALE ? FIRST_NAME_MALE : FIRST_NAME_FEMALE] [LAST_NAME]"

	name = "[real_name] ([client ? client : "NO CKEY"])"

	return TRUE

/mob/living/advanced/player/Destroy()

	if(client)
		make_ghost(src.loc ? src.loc : locate(1,1,1))

	dialogue_target = null

	if(src in equipped_players)
		equipped_players -= src

	if(current_squad)
		current_squad.remove_member(src)
		current_squad = null

	if(area && area.players_inside)
		area.players_inside -= src
	all_players -= src
	qdel(mobdata)
	mobdata = null
	attack_logs.Cut()

	active_device = null
	active_structure = null
	active_paper = null

	return ..()

mob/living/advanced/player/on_life_client()
	. = ..()
	spam_protection_command = max(0,spam_protection_command-TICKS_TO_SECONDS(1))
	return .

/mob/living/advanced/player/Move(var/atom/NewLoc,Dir=0,desired_step_x=0,desired_step_y=0,var/silent=FALSE)

	. = ..()

	if(.)

		if(dialogue_target_id)
			dialogue_target_id = null
			close_menu(src,"dialogue")

		if(active_structure && get_dist(src,active_structure) > 1)
			set_structure_unactive()

		if(active_device && get_dist(src,active_device) > 1)
			set_device_unactive()

		for(var/mob/living/advanced/npc/L in view(src,VIEW_RANGE))
			if(!L.ai)
				continue
			var/ai/AI = L.ai
			AI.enabled = TRUE

		for(var/mob/living/simple/npc/L in view(src,VIEW_RANGE))
			if(!L.ai)
				continue
			var/ai/AI = L.ai
			AI.enabled = TRUE


	return .