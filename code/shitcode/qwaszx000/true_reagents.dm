/*
Realistic chem by qwaszx000
*/
#define LANTAN 19
#define ACTIN 20
#define Solid SOLID
#define true True
#define false False

/datum/reagent/true
	var/isMetal = true
	var/formula = ""
	var/valence = 1
	var/period= 1
	var/M = 1//gramm/mol
	var/group = 1

/datum/substance
	var/name = "Reagent"
	var/id = "reagent"
	var/description = ""
	var/specific_heat = SPECIFIC_HEAT_DEFAULT		//J/(K*mol)
	var/taste_description = "metaphorical salt"
	var/taste_mult = 1 //how this taste compares to others. Higher values means it is more noticable
	var/glass_name = "glass of ...what?" // use for specialty drinks.
	var/glass_desc = "You can't really tell what this is."
	var/glass_icon_state = null // Otherwise just sets the icon to a normal glass with the mixture of the reagents in the glass.
	var/shot_glass_icon_state = null
	var/datum/reagents/holder = null
	var/reagent_state = LIQUID
	var/list/data
	var/current_cycle = 0
	var/volume = 0									//pretend this is moles
	var/color = "#000000" // rgb: 0, 0, 0
	var/can_synth = TRUE // can this reagent be synthesized? (for example: odysseus syringe gun)
	var/metabolization_rate = REAGENTS_METABOLISM //how fast the reagent is metabolized by the mob
	var/overrides_metab = 0
	var/overdose_threshold = 0
	var/addiction_threshold = 0
	var/addiction_stage = 0
	var/overdosed = 0 // You fucked up and this is now triggering its overdose effects, purge that shit quick.
	var/self_consuming = FALSE
	var/formula = ""
//---------------------------------------------------------

//-----------Not metals-------------------
/datum/reagent/true/Hidrogen
	isMetal = false
	name = "Hidrogen"
	id = name
	formula = "H"
	group = 1
	valence = group
	period = 1
	M = 1
	reagent_state = GAS
//-----------

/datum/reagent/true/Boron
	isMetal = false
	name = "Boron"
	id = name
	formula = "B"
	group = 13
	valence = group
	period = 2
	M = 11
	reagent_state = Solid

//-----------------

/datum/reagent/true/Carbon
	isMetal = false
	name = "Carbon"
	id = name
	formula = "C"
	group = 14
	valence = group
	period = 2
	M = 12
	reagent_state = Solid

/datum/reagent/true/Sillicon
	isMetal = false
	name = "Sillicon"
	id = name
	formula = "Si"
	group = 14
	valence = group
	period = 3
	M = 28
	reagent_state = Solid

/datum/reagent/true/Germanium
	isMetal = false
	name = "Germanium"
	id = name
	formula = "Ge"
	group = 14
	valence = group
	period = 4
	M = 73
	reagent_state = Solid

//-----------------

/datum/reagent/true/Nitrogen
	isMetal = false
	name = "Nitrogen"
	id = name
	formula = "N"
	group = 15
	valence = group
	period = 2
	M = 14
	reagent_state = GAS

/datum/reagent/true/Phosphorus
	isMetal = false
	name = "Phosphorus"
	id = name
	formula = "P"
	group = 15
	valence = group
	period = 3
	M = 31
	reagent_state = Solid

/datum/reagent/true/Arsenic
	isMetal = false
	name = "Arsenic"
	id = name
	formula = "As"
	group = 15
	valence = group
	period = 4
	M = 75
	reagent_state = Solid

/datum/reagent/true/Antimony
	isMetal = false
	name = "Antimony"
	id = name
	formula = "Sb"
	group = 15
	valence = group
	period = 5
	M = 122
	reagent_state = Solid

//------------------

/datum/reagent/true/Oxygen
	isMetal = false
	name = "Oxygen"
	id = name
	formula = "O"
	group = 16
	valence = 2
	period = 2
	M = 16
	reagent_state = GAS

/datum/reagent/true/Sulfur
	isMetal = false
	name = "Sulfur"
	id = name
	formula = "S"
	group = 16
	valence = 3
	period = 3
	M = 32
	reagent_state = SOLID

/datum/reagent/true/Selenium
	isMetal = false
	name = "Selenium"
	id = name
	formula = "Se"
	group = 16
	valence = group
	period = 4
	M = 79
	reagent_state = SOLID

/datum/reagent/true/Tellurium
	isMetal = false
	name = "Tellurium"
	id = name
	formula = "Te"
	group = 16
	valence = group
	period = 5
	M = 128
	reagent_state = SOLID

//-----------------

/datum/reagent/true/Fluorine
	isMetal = false
	name = "Fluorine"
	id = name
	formula = "F"
	group = 17
	valence = group
	period = 2
	M = 19
	reagent_state = GAS

/datum/reagent/true/Chlorine
	isMetal = false
	name = "Chlorine"
	id = name
	formula = "Cl"
	group = 17
	valence = group
	period = 2
	M = 36
	reagent_state = GAS

/datum/reagent/true/Bromine
	isMetal = false
	name = "Bromine"
	id = name
	formula = "Br"
	group = 17
	valence = group
	period = 4
	M = 80
	reagent_state = LIQUID

/datum/reagent/true/Iodine
	isMetal = false
	name = "Iodine"
	id = name
	formula = "I"
	group = 17
	valence = group
	period = 5
	M = 127
	reagent_state = SOLID

/datum/reagent/true/Astatine
	isMetal = false
	name = "Astatine"
	id = name
	formula = "At"
	group = 17
	valence = group
	period = 6
	M = 210
	reagent_state = SOLID

//----------------

/datum/reagent/true/Helium
	isMetal = false
	name = "Helium"
	id = name
	formula = "He"
	group = 18
	valence = group
	period = 1
	M = 4
	reagent_state = GAS

/datum/reagent/true/Neon
	isMetal = false
	name = "Neon"
	id = name
	formula = "Ne"
	group = 18
	valence = group
	period = 2
	M = 20
	reagent_state =  GAS

/datum/reagent/true/Argon
	isMetal = false
	name = "Argon"
	id = name
	formula = "Ar"
	group = 18
	valence = group
	period = 3
	M = 40
	reagent_state = GAS

/datum/reagent/true/Krypton
	isMetal = false
	name = "Krypton"
	id = name
	formula = "Kr"
	group = 18
	valence = group
	period = 4
	M = 84
	reagent_state = GAS

/datum/reagent/true/Xenon
	isMetal = false
	name = "Xenon"
	id = name
	formula = "Xe"
	group = 18
	valence = group
	period = 5
	M = 131
	reagent_state = GAS

/datum/reagent/true/Radon
	isMetal = false
	name = "Radon"
	id = name
	formula = "Rn"
	group = 18
	valence = group
	period = 6
	M = 222
	reagent_state = GAS

//----------------------------------------
//-----------Metals-----------------------

/datum/reagent/true/Lithium
	isMetal = true
	name = "Lithium"
	id = name
	formula = "Li"
	group = 1
	valence = group
	period = 2
	M = 7
	reagent_state = Solid

/datum/reagent/true/Natrium
	isMetal = true
	name = "Sodium"
	id = name
	formula = "Na"
	group = 1
	valence = group
	period = 3
	M = 23
	reagent_state = Solid

/datum/reagent/true/Kalium
	isMetal = true
	name = "Potassium"
	id = name
	formula = "K"
	group = 1
	valence = group
	period = 4
	M = 39
	reagent_state = Solid

/datum/reagent/true/Rubidium
	isMetal = true
	name = "Rubidium"
	id = name
	formula = "Rb"
	group = 1
	valence = group
	period = 5
	M = 85
	reagent_state = Solid

/datum/reagent/true/Caesium
	isMetal = true
	name = "Caesium"
	id = name
	formula = "Cs"
	group = 1
	valence = group
	period = 6
	M = 133
	reagent_state = Solid

/datum/reagent/true/Francium
	isMetal = true
	name = "Francium"
	id = name
	formula = "Fr"
	group = 1
	valence = group
	period = 7
	M = 223
	reagent_state = Solid
//-----------
/datum/reagent/true/Beryllium
	isMetal = true
	name = "Beryllium"
	id = name
	formula = "Be"
	group = 2
	valence = group
	period = 2
	M = 9
	reagent_state = Solid

/datum/reagent/true/Magnesium
	isMetal = true
	name = "Magnesium"
	id = name
	formula = "Mg"
	group = 2
	valence = group
	period = 3
	M = 24
	reagent_state = Solid

/datum/reagent/true/Calcium
	isMetal = true
	name = "Calcium"
	id = name
	formula = "Ca"
	group = 2
	valence = group
	period = 4
	M = 40
	reagent_state = Solid

/datum/reagent/true/Strontium
	isMetal = true
	name = "Strontium"
	id = name
	formula = "Sr"
	group = 2
	valence = group
	period = 5
	M = 88
	reagent_state = Solid

/datum/reagent/true/Barium
	isMetal = true
	name = "Barium"
	id = name
	formula = "Ba"
	group = 2
	valence = group
	period = 6
	M = 137
	reagent_state = Solid

/datum/reagent/true/Radium
	isMetal = true
	name = "Radium"
	id = name
	formula = "Ra"
	group = 2
	valence = group
	period = 7
	M = 226
	reagent_state = Solid

//----------

/datum/reagent/true/Scandium
	isMetal = true
	name = "Scandium"
	id = name
	formula = "Sc"
	group = 3
	valence = group
	period = 4
	M = 45
	reagent_state = Solid

/datum/reagent/true/Yttrium
	isMetal = true
	name = "Yttrium"
	id = name
	formula = "Y"
	group = 3
	valence = group
	period = 5
	M = 89
	reagent_state = Solid

/datum/reagent/true/Lanthanum
	isMetal = true
	name = "Lanthanum"
	id = name
	formula = "La"
	group = 3
	valence = group
	period = 6
	M = 139
	reagent_state = Solid

/datum/reagent/true/Actinium
	isMetal = true
	name = "Actinium"
	id = name
	formula = "Ac"
	group = 3
	valence = group
	period = 7
	M = 227
	reagent_state = Solid

//-------

/datum/reagent/true/Titanium
	isMetal = true
	name = "Titanium"
	id = name
	formula = "Ti"
	group = 4
	valence = group
	period = 4
	M = 48
	reagent_state = Solid

/datum/reagent/true/Zirconium
	isMetal = true
	name = "Zirconium"
	id = name
	formula = "Zr"
	group = 4
	valence = group
	period = 5
	M = 91
	reagent_state = Solid

/datum/reagent/true/Hafnium
	isMetal = true
	name = "Hafnium"
	id = name
	formula = "Hf"
	group = 4
	valence = group
	period = 6
	M = 178
	reagent_state = Solid

/datum/reagent/true/Rutherfordium
	isMetal = true
	name = "Rutherfordium"
	id = name
	formula = "Rf"
	group = 4
	valence = group
	period = 7
	M = 267
	reagent_state = Solid

//--------

/datum/reagent/true/Vanadium
	isMetal = true
	name = "Vanadium"
	id = name
	formula = "V"
	group = 5
	valence = group
	period = 4
	M = 51
	reagent_state = Solid

/datum/reagent/true/Niobium
	isMetal = true
	name = "Niobium"
	id = name
	formula = "Nb"
	group = 5
	valence = group
	period = 5
	M = 93
	reagent_state = Solid

/datum/reagent/true/Tantalum
	isMetal = true
	name = "Tantalum"
	id = name
	formula = "Ta"
	group = 5
	valence = group
	period = 6
	M = 181
	reagent_state = Solid

/datum/reagent/true/Dubnium
	isMetal = true
	name = "Dubnium"
	id = name
	formula = "Db"
	group = 5
	valence = group
	period = 7
	M = 268
	reagent_state = Solid

/datum/reagent/true/Chromium
	isMetal = true
	name = "Chromium"
	id = name
	formula = "Cr"
	group = 6
	valence = group
	period = 4
	M = 52
	reagent_state = Solid

/datum/reagent/true/Molybdenum
	isMetal = true
	name = "Molybdenum"
	id = name
	formula = "Mo"
	group = 6
	valence = group
	period = 5
	M = 96
	reagent_state = Solid

/datum/reagent/true/Tungsten
	isMetal = true
	name = "Tungsten"
	id = name
	formula = "W"
	group = 6
	valence = group
	period = 6
	M = 184
	reagent_state = Solid

/datum/reagent/true/Seaborgium
	isMetal = true
	name = "Seaborgium"
	id = name
	formula = "Sg"
	group = 6
	valence = group
	period = 7
	M = 269
	reagent_state = Solid

/datum/reagent/true/Manganese
	isMetal = true
	name = "Manganese"
	id = name
	formula = "Mn"
	group = 7
	valence = group
	period = 4
	M = 55
	reagent_state = Solid

/datum/reagent/true/Technetium
	isMetal = true
	name = "Technetium"
	id = name
	formula = "Tc"
	group = 7
	valence = group
	period = 5
	M = 98
	reagent_state = Solid

/datum/reagent/true/Rhenium
	isMetal = true
	name = "Rhenium"
	id = name
	formula = "Re"
	group = 7
	valence = group
	period = 6
	M = 186
	reagent_state = Solid

/datum/reagent/true/Bohrium
	isMetal = true
	name = "Bohrium"
	id = name
	formula = "Bh"
	group = 7
	valence = group
	period = 7
	M = 270
	reagent_state = Solid

/datum/reagent/true/Iron
	isMetal = true
	name = "Iron"
	id = name
	formula = "Fe"
	group = 8
	valence = group
	period = 4
	M = 56
	reagent_state = Solid

/datum/reagent/true/Ruthenium
	isMetal = true
	name = "Ruthenium"
	id = name
	formula = "Ru"
	group = 8
	valence = group
	period = 5
	M = 101
	reagent_state = Solid

/datum/reagent/true/Osmium
	isMetal = true
	name = "Osmium"
	id = name
	formula = "Os"
	group = 8
	valence = group
	period = 6
	M = 190
	reagent_state = Solid

/datum/reagent/true/Hassium
	isMetal = true
	name = "Hassium"
	id = name
	formula = "Hs"
	group = 8
	valence = group
	period = 7
	M = 270
	reagent_state = Solid

/datum/reagent/true/Cobalt
	isMetal = true
	name = "Cobalt"
	id = name
	formula = "Co"
	group = 9
	valence = 2
	period = 4
	M = 59
	reagent_state = Solid

/datum/reagent/true/Rhodium
	isMetal = true
	name = "Rhodium"
	id = name
	formula = "Rh"
	group = 9
	valence = group
	period = 5
	M = 103
	reagent_state = Solid

/datum/reagent/true/Iridium
	isMetal = true
	name = "Iridium"
	id = name
	formula = "Ir"
	group = 9
	valence = group
	period = 6
	M = 192
	reagent_state = Solid

/datum/reagent/true/Meitnerium
	isMetal = true
	name = "Meitnerium"
	id = name
	formula = "Mt"
	group = 9
	valence = group
	period = 7
	M = 278
	reagent_state = Solid

//---------------

/datum/reagent/true/Nickel
	isMetal = true
	name = "Nickel"
	id = name
	formula = "Ni"
	group = 10
	valence = group
	period = 4
	M = 59
	reagent_state = Solid

/datum/reagent/true/Palladium
	isMetal = true
	name = "Palladium"
	id = name
	formula = "Pd"
	group = 10
	valence = group
	period = 5
	M = 106
	reagent_state = Solid

/datum/reagent/true/Platinum
	isMetal = true
	name = "Platinum"
	id = name
	formula = "Pt"
	group = 10
	valence = group
	period = 6
	M = 195
	reagent_state = Solid

/datum/reagent/true/Darmstadtium
	isMetal = true
	name = "Darmstadtium"
	id = name
	formula = "Ds"
	group = 10
	valence = group
	period = 7
	M = 281
	reagent_state = Solid

/datum/reagent/true/Copper
	isMetal = true
	name = "Copper"
	id = name
	formula = "Cu"
	group = 11
	valence = group
	period = 4
	M = 64
	reagent_state = Solid

/datum/reagent/true/Silver
	isMetal = true
	name = "Silver"
	id = name
	formula = "Ag"
	group = 11
	valence = group
	period = 5
	M = 108
	reagent_state = Solid

/datum/reagent/true/Gold
	isMetal = true
	name = "Gold"
	id = name
	formula = "Au"
	group = 11
	valence = group
	period = 6
	M = 197
	reagent_state = Solid

/datum/reagent/true/Roentgenium
	isMetal = true
	name = "Roentgenium"
	id = name
	formula = "Rg"
	group = 11
	valence = group
	period = 7
	M = 282
	reagent_state = Solid

//----------------

/datum/reagent/true/Zinc
	isMetal = true
	name = "Zinc"
	id = name
	formula = "Zn"
	group = 12
	valence = group
	period = 4
	M = 65
	reagent_state = Solid

/datum/reagent/true/Cadmium
	isMetal = true
	name = "Cadmium"
	id = name
	formula = "Cd"
	group = 12
	valence = group
	period = 5
	M = 112
	reagent_state = Solid

/datum/reagent/true/Mercury
	isMetal = true
	name = "Mercury"
	id = name
	formula = "Hg"
	group = 12
	valence = group
	period = 6
	M = 201
	reagent_state = Solid

/datum/reagent/true/Copernicium
	isMetal = true
	name = "Copernicium"
	id = name
	formula = "Cn"
	group = 12
	valence = group
	period = 7
	M = 285
	reagent_state = Solid

//---------

/datum/reagent/true/Aluminium
	isMetal = true
	name = "Aluminium"
	id = name
	formula = "Al"
	group = 13
	valence = group
	period = 3
	M = 27
	reagent_state = Solid

/datum/reagent/true/Gallium
	isMetal = true
	name = "Gallium"
	id = name
	formula = "Ga"
	group = 13
	valence = group
	period = 4
	M = 70
	reagent_state = Solid

/datum/reagent/true/Indium
	isMetal = true
	name = "Indium"
	id = name
	formula = "In"
	group = 13
	valence = group
	period = 5
	M = 115
	reagent_state = Solid

/datum/reagent/true/Thallium
	isMetal = true
	name = "Thallium"
	id = name
	formula = "Tl"
	group = 13
	valence = group
	period = 6
	M = 204
	reagent_state = Solid

/datum/reagent/true/Nihonium
	isMetal = true
	name = "Nihonium"
	id = name
	formula = "Nh"
	group = 13
	valence = group
	period = 7
	M = 286
	reagent_state = Solid

//------------

/datum/reagent/true/Tin
	isMetal = true
	name = "Tin"
	id = name
	formula = "Sn"
	group = 14
	valence = group
	period = 5
	M = 119
	reagent_state = Solid

/datum/reagent/true/Lead
	isMetal = true
	name = "Lead"
	id = name
	formula = "Pb"
	group = 14
	valence = group
	period = 6
	M = 207
	reagent_state = Solid

//------------

/datum/reagent/true/Bismuth
	isMetal = true
	name = "Bismuth"
	id = name
	formula = "Bi"
	group = 15
	valence = group
	period = 6
	M = 209
	reagent_state = Solid

//----------

/datum/reagent/true/Polonium
	isMetal = true
	name = "Polonium"
	id = name
	formula = "Po"
	group = 16
	valence = group
	period = 6
	M = 209
	reagent_state = Solid

//------------------------------------------------------
//--------------Lanthanums------------------------------
/datum/reagent/true/Cerium
	isMetal = true
	name = "Cerium"
	id = name
	formula = "Ce"
	group = LANTAN
	valence = group
	period = 6
	M = 140
	reagent_state = Solid

/datum/reagent/true/Praseodymium
	isMetal = true
	name = "Praseodymium"
	id = name
	formula = "Pr"
	group = LANTAN
	valence = group
	period = 6
	M = 141
	reagent_state = Solid

/datum/reagent/true/Neodymium
	isMetal = true
	name = "Neodymium"
	id = name
	formula = "Nd"
	group = LANTAN
	valence = group
	period = 6
	M = 144
	reagent_state = Solid

/datum/reagent/true/Promethium
	isMetal = true
	name = "Promethium"
	id = name
	formula = "Pm"
	group = LANTAN
	valence = group
	period = 6
	M = 145
	reagent_state = Solid

/datum/reagent/true/Samarium
	isMetal = true
	name = "Samarium"
	id = name
	formula = "Sm"
	group = LANTAN
	valence = group
	period = 6
	M = 150
	reagent_state = Solid

/datum/reagent/true/Europium
	isMetal = true
	name = "Europium"
	id = name
	formula = "Eu"
	group = LANTAN
	valence = group
	period = 6
	M = 152
	reagent_state = Solid

/datum/reagent/true/Gadolinium
	isMetal = true
	name = "Gadolinium"
	id = name
	formula = "Gd"
	group = LANTAN
	valence = group
	period = 6
	M = 157
	reagent_state = Solid

/datum/reagent/true/Terbium
	isMetal = true
	name = "Terbium"
	id = name
	formula = "Tb"
	group = LANTAN
	valence = group
	period = 6
	M = 159
	reagent_state = Solid

/datum/reagent/true/Dysposium
	isMetal = true
	name = "Dysposium"
	id = name
	formula = "Dy"
	group = LANTAN
	valence = group
	period = 6
	M = 163
	reagent_state = Solid

/datum/reagent/true/Holmium
	isMetal = true
	name = "Holmium"
	id = name
	formula = "Ho"
	group = LANTAN
	valence = group
	period = 6
	M = 165
	reagent_state = Solid

/datum/reagent/true/Erbium
	isMetal = true
	name = "Erbium"
	id = name
	formula = "Er"
	group = LANTAN
	valence = group
	period = 6
	M = 167
	reagent_state = Solid

/datum/reagent/true/Thulium
	isMetal = true
	name = "Thulium"
	id = name
	formula = "Tm"
	group = LANTAN
	valence = group
	period = 6
	M = 169
	reagent_state = Solid

/datum/reagent/true/Ytterbium
	isMetal = true
	name = "Ytterbium"
	id = name
	formula = "Yb"
	group = LANTAN
	valence = group
	period = 6
	M = 173
	reagent_state = Solid

/datum/reagent/true/Lutetium
	isMetal = true
	name = "Lutetium"
	id = name
	formula = "Lu"
	group = LANTAN
	valence = group
	period = 6
	M = 175
	reagent_state = Solid

//------------ACTINIUMS-------------

/datum/reagent/true/Thorium
	isMetal = true
	name = "Thorium"
	id = name
	formula = "Th"
	group = ACTIN
	valence = group
	period = 7
	M = 232
	reagent_state = Solid

/datum/reagent/true/Protactinium
	isMetal = true
	name = "Protactinium"
	id = name
	formula = "Pa"
	group = ACTIN
	valence = group
	period = 7
	M = 231
	reagent_state = Solid

/datum/reagent/true/Uranium
	isMetal = true
	name = "Uranium"
	id = name
	formula = "U"
	group = ACTIN
	valence = group
	period = 7
	M = 238
	reagent_state = Solid

/datum/reagent/true/Neptunium
	isMetal = true
	name = "Neptunium"
	id = name
	formula = "Np"
	group = ACTIN
	valence = group
	period = 7
	M = 237
	reagent_state = Solid

/datum/reagent/true/Plutonium
	isMetal = true
	name = "Plutonium"
	id = name
	formula = "Pu"
	group = ACTIN
	valence = group
	period = 7
	M = 244
	reagent_state = Solid

/datum/reagent/true/Americium
	isMetal = true
	name = "Americium"
	id = name
	formula = "Am"
	group = ACTIN
	valence = group
	period = 7
	M = 243
	reagent_state = Solid

/datum/reagent/true/Curium
	isMetal = true
	name = "Curium"
	id = name
	formula = "Cm"
	group = ACTIN
	valence = group
	period = 7
	M = 247
	reagent_state = Solid

/datum/reagent/true/Berkelium
	isMetal = true
	name = "Berkelium"
	id = name
	formula = "Bk"
	group = ACTIN
	valence = group
	period = 7
	M = 247
	reagent_state = Solid

/datum/reagent/true/Californium
	isMetal = true
	name = "Californium"
	id = name
	formula = "Cf"
	group = ACTIN
	valence = group
	period = 7
	M = 251
	reagent_state = Solid

/datum/reagent/true/Einstenium
	isMetal = true
	name = "Einstenium"
	id = name
	formula = "Es"
	group = ACTIN
	valence = group
	period = 7
	M = 252
	reagent_state = Solid

/datum/reagent/true/Fermium
	isMetal = true
	name = "Fermium"
	id = name
	formula = "Fm"
	group = ACTIN
	valence = group
	period = 7
	M = 257
	reagent_state = Solid

/datum/reagent/true/Mendelevium
	isMetal = true
	name = "Mendelevium"
	id = name
	formula = "Md"
	group = ACTIN
	valence = group
	period = 7
	M = 258
	reagent_state = SOLID

/datum/reagent/true/Nobelium
	isMetal = true
	name = "Nobelium"
	id = name
	formula = "No"
	group = ACTIN
	valence = group
	period = 7
	M = 259
	reagent_state = SOLID

/datum/reagent/true/Lawrencium
	isMetal = true
	name = "Lawrencium"
	id = name
	formula = "Lr"
	group = ACTIN
	valence = group
	period = 7
	M = 266
	reagent_state = SOLID

#undef true
#undef false
#undef Solid