#define TRAIT_PROGRAMMER		"programmer"

/obj/item/integrated_circuit_printer/upgraded/prog
	name = "Advanced ICP"
	icon_state = "adv_icp"
	w_class = WEIGHT_CLASS_NORMAL

/datum/quirk/programmer
	name = "���������������� IT-�������"
	desc = "��������� �� ������� �� ����������� ���������, ���� �� ����� ������ ���� �������."
	value = 1
	mob_trait = TRAIT_PROGRAMMER
	gain_text = "<span class='notice'>�� ������ ��� � �������������� � '������������'.</span>"
	lose_text = "<span class='danger'>�� ���������� ���� ���������.</span>"
	medical_record_text = "������� �������, ��� �� ������ ����� ������, �������� ��� �������� ���������."

/datum/quirk/programmer/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	if(H.socks == "Stockings (Programmer)")
		var/obj/item/integrated_circuit_printer/upgraded/prog/P = new(get_turf(H))
		var/list/slots = list (
			"backpack" = SLOT_IN_BACKPACK,
			"hands" = SLOT_HANDS,
		)
		H.equip_in_one_of_slots(P, slots , qdel_on_fail = TRUE)

/datum/quirk/surgeon
	name = "������"
	desc = "�� ������� ������, ����������� ����� ��� ������� �����. ��� ������ �� ���� ���� � �������: ��� ��� ������� ������ ��������!"
	value = 3
	mob_trait = TRAIT_SURGEON
	gain_text = "<span class='notice'>�� ���������� ���� �������.</span>"
	lose_text = "<span class='danger'>������ � ����� ������ �� ����.</span>"
	medical_record_text = "��� ������� ������, ������������� ��� ����� ��� �������� ������������."