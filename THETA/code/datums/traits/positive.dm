#define TRAIT_PROGRAMMER		"programmer"

/obj/item/integrated_circuit_printer/upgraded/prog
	name = "Advanced ICP"
	icon = 'THETA/icons/obj/assemblies/electronic_tools.dmi'
	icon_state = "adv_icp"
	w_class = WEIGHT_CLASS_NORMAL

/datum/quirk/programmer
	name = "Профессиональный IT-инженер"
	desc = "Прибывает на станцию со специальным принтером, если не забыл надеть свои носочки."
	value = 1
	mob_trait = TRAIT_PROGRAMMER
	gain_text = "<span class='notice'>Ты знаешь все о компилировании и траповании.</span>"
	lose_text = "<span class='danger'>Ты чувствуешь себя нормально.</span>"
	medical_record_text = "Пациент говорит, что ты будешь лучше кодить, одеваясь как японская школьница."

/datum/quirk/programmer/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	if(H.socks == "Stockings (Programmer)")
		var/obj/item/integrated_circuit_printer/upgraded/prog/P = new(get_turf(H))
		var/list/slots = list (
			"backpack" = ITEM_SLOT_BACKPACK,
			"hands" = ITEM_SLOT_HANDS,
		)
		H.equip_in_one_of_slots(P, slots , qdel_on_fail = TRUE)

/datum/quirk/surgeon
	name = "Хирург"
	desc = "Вы опытный хирург, посвятивший много лет лечению людей. Так несите же этот опыт и помните: НЕТ РАН КОТОРЫЕ НЕЛЬЗЯ ИСЦЕЛИТЬ!"
	value = 3
	mob_trait = TRAIT_SURGEON
	gain_text = "<span class='notice'>Ты чувствуешь себя опытным.</span>"
	lose_text = "<span class='danger'>Знания о жизни уходят от тебя.</span>"
	medical_record_text = "Это опытный хирург, рекомендуется для найма при нехватке медперсонала."
