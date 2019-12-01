/obj/item/organ/cyberimp/arm/surgery/alien
	icon = 'THETA/icons/icons.dmi'
	icon_state = "surgery"
	name = "alien surgical toolset implant"
	desc = "A set of alien surgical tools hidden behind a concealed panel on the user's arm."
	contents = newlist(/obj/item/retractor/alien, /obj/item/hemostat/alien, /obj/item/cautery/alien, /obj/item/surgicaldrill/alien, /obj/item/scalpel/alien, /obj/item/circular_saw/alien, /obj/item/surgical_drapes)

/obj/item/organ/cyberimp/eyes/hud/science
	name = "Science HUD implant"
	desc = "Cybernetic eye implants with an analyzer for scanning items and reagents."
	actions_types = list(/datum/action/item_action/toggle_research_scanner)
	var/scan_reagents = 1//something like that, i think
