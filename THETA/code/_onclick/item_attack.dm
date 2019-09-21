GLOBAL_LIST_INIT(ru_dictionary, list(
	"struck"					= "атакует",
	"pistol whipped"			= "пистолетирует",
	"hit"						= "бьёт",
	"attacked"					= "атакует",
	"pricked"					= "протыкает",
	"struck"					= "вмазывает",
	"absorbed"					= "пожирает",
	"gored"						= "унижает",
	"robusted"					= "робастит",
	"slashed"					= "кромсает",
	"stabbed"					= "втыкает",
	"sliced"					= "рубит",
	"diced"						= "нарезает",
	"cut"						= "нарезает",
	"stabbed"					= "протыкает",
	"poked"						= "дырявит",
	"torn"						= "тычет",
	"ripped"					= "рвёт",
	"cleaved"					= "мясует",
	"shanked"					= "тычет",
	"shivved"					= "насаживает",
	"battered"					= "колошматит",
	"bludgeoned"				= "месит",
	"thrashed"					= "учит готовить",
	"whacked"					= "раскатывает",
	"bashed"					= "колотит"
	))
/proc/ru_attack_verb(var/attack_verb, var/item)
	. = attack_verb
	if(!attack_verb)
		return
	if(GLOB.ru_dictionary[attack_verb])
		return GLOB.ru_dictionary[attack_verb]
	log_admin("Нет локализации для слова или фразы '[attack_verb]' для '[item]'")
