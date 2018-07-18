/obj/item/kitchen/knife/combat/prikol
	name = "Prikol!"
	desc = "Дебилка и дебил генерал."

/obj/item/kitchen/knife/combat/prikol/attack(mob/living/target, mob/living/user)
	if(get_dir(get_turf(target), get_turf(user)) != get_dir(get_turf(user), get_turf(target)))
		target.ex_act(EXPLODE_HEAVY)
		target.throw_at(target, 5, 1, spin = FALSE, diagonals_first = TRUE)
		H.visible_message("<span class='danger'>Свежий кабанчик!</span>")