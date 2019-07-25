/client
	var/petukh = 0

/obj
	var/zashkvareno = 0

/obj/attack_hand(mob/user)
	..()
	if(user.client && user.client.petukh && !zashkvareno)
		zashkvareno = 1
		name = "petushinii " + name

