//traits with no real impact that can be taken freely
//MAKE SURE THESE DO NOT MAJORLY IMPACT GAMEPLAY. those should be positive or negative traits.

/datum/quirk/no_taste
	name = "�������"
	desc = "�� �������� ���� �������� ��������� � �� ������ ������������� ���� �����-���� ���! �� ��������� ���� ��-����� ����� ��������� ���."
	value = 0
	mob_trait = TRAIT_AGEUSIA
	gain_text = "<span class='notice'>�� ������ �� ���������� ���� ���!</span>"
	lose_text = "<span class='notice'>������ �� ������ ������������� ���� ���!</span>"
	medical_record_text = "������� �������� �� ������� � ���������� ����������� ���� ��� ��� ��������."

/datum/quirk/vegetarian
	name = "������������"
	desc = "�� �������� ���� ���� ���� ��������� � �������� �������������."
	value = 0
	gain_text = "<span class='notice'>�� �������� ���� ���� ���� ��������� � �������� �������������.</span>"
	lose_text = "<span class='notice'>�� ����������, ��� ��������� ���� �������������..</span>"
	medical_record_text = "������� �������� � �������������� �����.."

/datum/quirk/vegetarian/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food &= ~MEAT
	species.disliked_food |= MEAT

/datum/quirk/vegetarian/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		if(initial(species.liked_food) & MEAT)
			species.liked_food |= MEAT
		if(!initial(species.disliked_food) & MEAT)
			species.disliked_food &= ~MEAT

/datum/quirk/pineapple_liker
	name = "�������� ��������"
	desc = "�� ����� ������ ������ �������. �� ������� ��� �� ���������!"  
	value = 0
	gain_text = "<span class='notice'>�� ����������, ��� ����������� ������� ���� � ��������..</span>"
	lose_text = "<span class='notice'>���� ������ � �������� �������� �������..</span>"
	medical_record_text = "������� ������������� �������������� ������ � �������."

/datum/quirk/pineapple_liker/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= PINEAPPLE

/datum/quirk/pineapple_liker/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food &= ~PINEAPPLE

/datum/quirk/pineapple_hater
	name = "���������� � ��������"
	desc = "�� ���������� �������. ��������, ���, ���� ������, � ������� ��� ������, ��� ��� �������? � ����� �������� ������ �� �������� ��� � �����?!"
	value = 0
	gain_text = "<span class='notice'>�� ������� ��� ���, ����� ����� ������ ����� �������...</span>" 
	lose_text = "<span class='notice'>���� ��������� � �������� ��������� �������...</span>"
	medical_record_text = "������� �������, ��� ������� �������������."

/datum/quirk/pineapple_hater/add() 
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food |= PINEAPPLE

/datum/quirk/pineapple_hater/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.disliked_food &= ~PINEAPPLE

/datum/quirk/deviant_tastes
	name = "���������� �����"
	desc = "�� �� ������ �� ���, ������� ����������� ������������ �����������. ��� �� �����, �� ������ ��, ��� �� ����� ���."
	value = 0
	gain_text = "<span class='notice'>� ��� ��������� ����� ������ ���-������ �������� �� ����.</span>"
	lose_text = "<span class='notice'>��� ������� ������ ���������� ���.</span>"
	medical_record_text = "������� ������������� ��������� ������������ � ���."

/datum/quirk/deviant_tastes/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	var/liked = species.liked_food
	species.liked_food = species.disliked_food
	species.disliked_food = liked

/datum/quirk/deviant_tastes/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)

/datum/quirk/monochromatic
	name = "����������"
	desc = "�� �� ������ ��������� ����� � ������ ���� ��� � �����-����� �����."
	value = 0
	medical_record_text = "� �������� ���� ���������� ��������� ��������� ������."

/datum/quirk/monochromatic/add()
	quirk_holder.add_client_colour(/datum/client_colour/monochrome)

/datum/quirk/monochromatic/post_add()
	if(quirk_holder.mind.assigned_role == "Detective")
		to_chat(quirk_holder, "<span class='boldannounce'>���. �� ���� ������� ��� ������ �������. ��� �� ������� ������...</span>")
		quirk_holder.playsound_local(quirk_holder, 'sound/ambience/ambidet1.ogg', 50, FALSE)

/datum/quirk/monochromatic/remove()
	if(quirk_holder)
		quirk_holder.remove_client_colour(/datum/client_colour/monochrome)

/datum/quirk/phobia
	name = "Phobia"
	desc = "You are irrationally afraid of something."
	value = 0
	medical_record_text = "Patient has an irrational fear of something."

/datum/quirk/phobia/post_add()
	var/mob/living/carbon/human/H = quirk_holder
	H.gain_trauma(new /datum/brain_trauma/mild/phobia(H.client.prefs.phobia), TRAUMA_RESILIENCE_ABSOLUTE)
	
/datum/quirk/phobia/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		H.cure_trauma_type(/datum/brain_trauma/mild/phobia, TRAUMA_RESILIENCE_ABSOLUTE)
