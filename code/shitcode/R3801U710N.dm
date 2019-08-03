GLOBAL_LIST_EMPTY(petushiniy_list)

/atom
	var/zashkvareno = 0

/proc/zashkvar_check(var/mob/M, var/atom/A) //nasral na other_mobs.dm
	if(M && M.ckey && !A.zashkvareno && M.ckey in GLOB.petushiniy_list)
		A.zashkvareno = 1
		A.visible_message("<span class='danger'>[A.name] �������������� �� ���������� ������!</span>")
		if(prob(50))
			A.name = "��������� " + A.name
		else
			A.name = "������������ " + A.name
