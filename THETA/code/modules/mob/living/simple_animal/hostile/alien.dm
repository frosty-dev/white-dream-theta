//dodging merge-conflicts (no-procs in file "backdoors")
/mob/living/proc/compoundDamage(var/mob/living/A,var/mod=1)
	adjustBruteLoss(A.bruteloss*mod)
	adjustOxyLoss(A.oxyloss*mod)
	adjustToxLoss(A.toxloss*mod)
	adjustFireLoss(A.fireloss*mod)
	adjustCloneLoss(A.cloneloss*mod)
	adjustStaminaLoss(A.staminaloss*mod)

/mob/living/simple_animal/hostile/alien/drone/death()
	var/mob/living/carbon/alien/humanoid/drone/M = new(loc)
	M.compoundDamage(src,2)
	qdel(src)

/mob/living/simple_animal/hostile/alien/sentinel/death()
	var/mob/living/carbon/alien/humanoid/sentinel/M = new(loc)
	M.compoundDamage(src,2)
	qdel(src)

/mob/living/simple_animal/hostile/alien/queen/death()
	var/mob/living/carbon/alien/humanoid/royal/praetorian/M = new(loc)
	M.compoundDamage(src,2)
	qdel(src)

/mob/living/simple_animal/hostile/alien/queen/large/death()
	var/mob/living/carbon/alien/humanoid/royal/queen/M = new(loc)
	M.compoundDamage(src,2)
	qdel(src)

/mob/living/simple_animal/hostile/alien/death()
	var/mob/living/carbon/alien/humanoid/hunter/M = new(loc)
	M.compoundDamage(src,2)
	qdel(src)
