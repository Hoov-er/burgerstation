/obj/item/clothing/feet/socks/
	name = "sock"
	desc = "Don't wear socks with this or I'll fucking end you."
	desc_extended = "A sock. This can go on either foot."
	icon_state = "inventory"
	icon_state_worn = "worn"
	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET
	worn_layer = LAYER_MOB_CLOTHING_SOCKS
	item_slot = SLOT_FOOT_LEFT_U | SLOT_FOOT_RIGHT_U

	ignore_other_slots = TRUE

	slot_icons = TRUE

	protected_limbs = list(BODY_FOOT_RIGHT,BODY_FOOT_LEFT) //TODO: MAKE THIS DYNAMIC

	defense_rating = list(
		MAGIC = ARMOR_D,
		COLD = ARMOR_D
	)

	size = SIZE_0
	weight = WEIGHT_0

	value = 3

/obj/item/clothing/feet/socks/ankle
	name = "ankle high socks"
	icon = 'icons/obj/items/clothing/socks/normal.dmi'
	polymorphs = null

/obj/item/clothing/feet/socks/knee
	name = "knee high socks"
	icon = 'icons/obj/items/clothing/socks/knee.dmi'
	polymorphs = list(
		"sock" = COLOR_WHITE
	)

	value = 5

/obj/item/clothing/feet/socks/knee/white
	polymorphs = list(
		"sock" = COLOR_WHITE
	)

/obj/item/clothing/feet/socks/knee/striped
	polymorphs = list(
		"sock" = COLOR_WHITE,
		"stripes" = COLOR_GREY
	)

/obj/item/clothing/feet/socks/knee/striped/scottish
	polymorphs = list(
		"sock" = "#53512A",
		"stripes" = "#32321B"
	)

/obj/item/clothing/feet/socks/thigh/
	name = "thigh high sock"
	icon = 'icons/obj/items/clothing/socks/programmer.dmi'

	value = 10

	polymorphs = list(
		"sock" = COLOR_WHITE
	)

/obj/item/clothing/feet/socks/thigh/striped/
	polymorphs = list(
		"sock" = COLOR_WHITE,
		"stripes" = COLOR_GREY
	)

/obj/item/clothing/feet/socks/thigh/striped/pink
	name = "programmer sock"

	polymorphs = list(
		"sock" = "#FFFFFF",
		"stripes" = "#FFFFFF"
	)

/obj/item/clothing/feet/socks/thigh/striped/bee
	name = "bee stockings"

	polymorphs = list(
		"sock" = "#FFFFFF",
		"stripes" = "#FFFFFF"
	)
