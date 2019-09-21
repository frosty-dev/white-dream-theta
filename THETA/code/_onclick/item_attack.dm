GLOBAL_LIST_INIT(ru_dictionary, list(
	"struck"					= "атакует",
	"pistol whipped"			= "пистолетирует",
	"hit"						= "бьёт",
	"bashed"					= "колотит"
	))
/proc/ru_attack_verb(var/attack_verb)
	. = attack_verb
	if(!attack_verb)
		return
	if(GLOB.ru_dictionary[attack_verb])
		return GLOB.ru_dictionary[attack_verb]
	message_admins("Нет локализации для слова или фразы '[attack_verb]'")
