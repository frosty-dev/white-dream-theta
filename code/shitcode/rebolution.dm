/client
	var/petukh = 0

/obj
	var/zashkvareno = 0

/obj/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(user.client && user.client.petukh && !zashkvareno)
		zashkvareno = 1
		src.visible_message("<span class='danger'>[src.name] зашкваривается от петушиного ксания!</span>")
		name = "petushinii " + name

