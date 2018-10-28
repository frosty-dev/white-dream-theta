/*
Realistic chem by qwaszx000
*/

//TODO set correct valences
#define LANTAN 19
#define ACTIN 20
#define Solid SOLID
#define true TRUE
#define false FALSE

#define NON_OXYDE 0
#define BASE_OXYDE 1
#define ACID_OXYDE 2

#define IS_ORGANIC 0
#define BASE 1
#define ACID 2
/datum/reagent/tru
	var/isMetal = true
	var/formula = ""
	var/valence = 1
	var/period= 1
	var/M = 1//gramm/mol
	var/group = 1
	var/oxyde_type
	var/non_organic_type

/datum/reagent/tru/proc/create_data()
	data["isMetal"] 		  = isMetal
	data["formula"] 		  = formula
	data["valence"] 		  = valence
	data["period"]  		  = period
	data["M"] 				  = M
	data["group"] 			  = group
	data["color"]			  = color
	data["name"]			  = name
	data["id"]				  = id
	data["taste_description"] = taste_description
/*
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
	var/M = 1*/
//---------------------------------------------------------

//-----------Not metals-------------------
/datum/reagent/tru/Hidrogen
	isMetal = false
	name = "Hidrogen"
	id = "Hidrogen"
	formula = "H"
	group = 1
	valence = 1
	period = 1
	M = 1
	reagent_state = GAS
//-----------

/datum/reagent/tru/Boron
	isMetal = false
	name = "Boron"
	id = "Boron"
	formula = "B"
	group = 13
	valence = 13
	period = 2
	M = 11
	reagent_state = Solid

//-----------------

/datum/reagent/tru/Carbon
	isMetal = false
	name = "Carbon"
	id = "Carbon"
	formula = "C"
	group = 14
	valence = 4
	period = 2
	M = 12
	reagent_state = Solid
	data = list("isMetal" = false,
				"formula" = "C",
				"valence" = 4,
				"period" = 2,
				"M" = 12,
				"group" = 14,
				"name" = "Carbon",
				"id" = "Carbon")

/datum/reagent/tru/Sillicon
	isMetal = false
	name = "Sillicon"
	id = "Sillicon"
	formula = "Si"
	group = 14
	valence = 14
	period = 3
	M = 28
	reagent_state = Solid

/datum/reagent/tru/Germanium
	isMetal = false
	name = "Germanium"
	id = "Germanium"
	formula = "Ge"
	group = 14
	valence = 14
	period = 4
	M = 73
	reagent_state = Solid

//-----------------

/datum/reagent/tru/Nitrogen
	isMetal = false
	name = "Nitrogen"
	id = "Nitrogen"
	formula = "N"
	group = 15
	valence = 15
	period = 2
	M = 14
	reagent_state = GAS

/datum/reagent/tru/Phosphorus
	isMetal = false
	name = "Phosphorus"
	id = "Phosphorus"
	formula = "P"
	group = 15
	valence = 15
	period = 3
	M = 31
	reagent_state = Solid

/datum/reagent/tru/Arsenic
	isMetal = false
	name = "Arsenic"
	id = "Arsenic"
	formula = "As"
	group = 15
	valence = 15
	period = 4
	M = 75
	reagent_state = Solid

/datum/reagent/tru/Antimony
	isMetal = false
	name = "Antimony"
	id = "Antimony"
	formula = "Sb"
	group = 15
	valence = 15
	period = 5
	M = 122
	reagent_state = Solid

//------------------

/datum/reagent/tru/Oxygen
	isMetal = false
	name = "Oxygen"
	id = "Oxygen"
	formula = "O"
	group = 16
	valence = 2
	period = 2
	M = 16
	reagent_state = GAS
	data = list("isMetal" = false,
				"formula" = "O",
				"valence" = 2,
				"period" = 2,
				"M" = 16,
				"group" = 16,
				"name" = "Oxygen",
				"id" = "Oxygen")

/datum/reagent/tru/Sulfur
	isMetal = false
	name = "Sulfur"
	id = "Sulfur"
	formula = "S"
	group = 16
	valence = 3
	period = 3
	M = 32
	reagent_state = SOLID

/datum/reagent/tru/Selenium
	isMetal = false
	name = "Selenium"
	id = "Selenium"
	formula = "Se"
	group = 16
	valence = 16
	period = 4
	M = 79
	reagent_state = SOLID

/datum/reagent/tru/Tellurium
	isMetal = false
	name = "Tellurium"
	id = "Tellurium"
	formula = "Te"
	group = 16
	valence = 16
	period = 5
	M = 128
	reagent_state = SOLID

//-----------------

/datum/reagent/tru/Fluorine
	isMetal = false
	name = "Fluorine"
	id = "Fluorine"
	formula = "F"
	group = 17
	valence = 17
	period = 2
	M = 19
	reagent_state = GAS

/datum/reagent/tru/Chlorine
	isMetal = false
	name = "Chlorine"
	id = "Chlorine"
	formula = "Cl"
	group = 17
	valence = 17
	period = 2
	M = 36
	reagent_state = GAS

/datum/reagent/tru/Bromine
	isMetal = false
	name = "Bromine"
	id = "Bromine"
	formula = "Br"
	group = 17
	valence = 17
	period = 4
	M = 80
	reagent_state = LIQUID

/datum/reagent/tru/Iodine
	isMetal = false
	name = "Iodine"
	id = "Iodine"
	formula = "I"
	group = 17
	valence = 17
	period = 5
	M = 127
	reagent_state = SOLID

/datum/reagent/tru/Astatine
	isMetal = false
	name = "Astatine"
	id = "Astatine"
	formula = "At"
	group = 17
	valence = 17
	period = 6
	M = 210
	reagent_state = SOLID

//----------------

/datum/reagent/tru/Helium
	isMetal = false
	name = "Helium"
	id = "Helium"
	formula = "He"
	group = 18
	valence = 18
	period = 1
	M = 4
	reagent_state = GAS

/datum/reagent/tru/Neon
	isMetal = false
	name = "Neon"
	id = "Neon"
	formula = "Ne"
	group = 18
	valence = 18
	period = 2
	M = 20
	reagent_state =  GAS

/datum/reagent/tru/Argon
	isMetal = false
	name = "Argon"
	id = "Argon"
	formula = "Ar"
	group = 18
	valence = 18
	period = 3
	M = 40
	reagent_state = GAS

/datum/reagent/tru/Krypton
	isMetal = false
	name = "Krypton"
	id = "Krypton"
	formula = "Kr"
	group = 18
	valence = 18
	period = 4
	M = 84
	reagent_state = GAS

/datum/reagent/tru/Xenon
	isMetal = false
	name = "Xenon"
	id = "Xenon"
	formula = "Xe"
	group = 18
	valence = 18
	period = 5
	M = 131
	reagent_state = GAS

/datum/reagent/tru/Radon
	isMetal = false
	name = "Radon"
	id = "Radon"
	formula = "Rn"
	group = 18
	valence = 18
	period = 6
	M = 222
	reagent_state = GAS

//----------------------------------------
//-----------Metals-----------------------

/datum/reagent/tru/Lithium
	isMetal = true
	name = "Lithium"
	id = "Lithium"
	formula = "Li"
	group = 1
	valence = 1
	period = 2
	M = 7
	reagent_state = Solid

/datum/reagent/tru/Natrium
	isMetal = true
	name = "Sodium"
	id = "Sodium"
	formula = "Na"
	group = 1
	valence = 1
	period = 3
	M = 23
	reagent_state = Solid

/datum/reagent/tru/Kalium
	isMetal = true
	name = "Potassium"
	id = "Potassium"
	formula = "K"
	group = 1
	valence = 1
	period = 4
	M = 39
	reagent_state = Solid

/datum/reagent/tru/Rubidium
	isMetal = true
	name = "Rubidium"
	id = "Rubidium"
	formula = "Rb"
	group = 1
	valence = 1
	period = 5
	M = 85
	reagent_state = Solid

/datum/reagent/tru/Caesium
	isMetal = true
	name = "Caesium"
	id = "Caesium"
	formula = "Cs"
	group = 1
	valence = 1
	period = 6
	M = 133
	reagent_state = Solid

/datum/reagent/tru/Francium
	isMetal = true
	name = "Francium"
	id = "Francium"
	formula = "Fr"
	group = 1
	valence = 1
	period = 7
	M = 223
	reagent_state = Solid
//-----------
/datum/reagent/tru/Beryllium
	isMetal = true
	name = "Beryllium"
	id = "Beryllium"
	formula = "Be"
	group = 2
	valence = 2
	period = 2
	M = 9
	reagent_state = Solid

/datum/reagent/tru/Magnesium
	isMetal = true
	name = "Magnesium"
	id = "Magnesium"
	formula = "Mg"
	group = 2
	valence = 2
	period = 3
	M = 24
	reagent_state = Solid

/datum/reagent/tru/Calcium
	isMetal = true
	name = "Calcium"
	id = "Calcium"
	formula = "Ca"
	group = 2
	valence = 2
	period = 4
	M = 40
	reagent_state = Solid

/datum/reagent/tru/Strontium
	isMetal = true
	name = "Strontium"
	id = "Strontium"
	formula = "Sr"
	group = 2
	valence = 2
	period = 5
	M = 88
	reagent_state = Solid

/datum/reagent/tru/Barium
	isMetal = true
	name = "Barium"
	id = "Barium"
	formula = "Ba"
	group = 2
	valence = 2
	period = 6
	M = 137
	reagent_state = Solid

/datum/reagent/tru/Radium
	isMetal = true
	name = "Radium"
	id = "Radium"
	formula = "Ra"
	group = 2
	valence = 2
	period = 7
	M = 226
	reagent_state = Solid

//----------

/datum/reagent/tru/Scandium
	isMetal = true
	name = "Scandium"
	id = "Scandium"
	formula = "Sc"
	group = 3
	valence = 3
	period = 4
	M = 45
	reagent_state = Solid

/datum/reagent/tru/Yttrium
	isMetal = true
	name = "Yttrium"
	id = "Yttrium"
	formula = "Y"
	group = 3
	valence = 3
	period = 5
	M = 89
	reagent_state = Solid

/datum/reagent/tru/Lanthanum
	isMetal = true
	name = "Lanthanum"
	id = "Lanthanum"
	formula = "La"
	group = 3
	valence = 3
	period = 6
	M = 139
	reagent_state = Solid

/datum/reagent/tru/Actinium
	isMetal = true
	name = "Actinium"
	id = "Actinium"
	formula = "Ac"
	group = 3
	valence = 3
	period = 7
	M = 227
	reagent_state = Solid

//-------

/datum/reagent/tru/Titanium
	isMetal = true
	name = "Titanium"
	id = "Titanium"
	formula = "Ti"
	group = 4
	valence = 4
	period = 4
	M = 48
	reagent_state = Solid

/datum/reagent/tru/Zirconium
	isMetal = true
	name = "Zirconium"
	id = "Zirconium"
	formula = "Zr"
	group = 4
	valence = 4
	period = 5
	M = 91
	reagent_state = Solid

/datum/reagent/tru/Hafnium
	isMetal = true
	name = "Hafnium"
	id = "Hafnium"
	formula = "Hf"
	group = 4
	valence = 4
	period = 6
	M = 178
	reagent_state = Solid

/datum/reagent/tru/Rutherfordium
	isMetal = true
	name = "Rutherfordium"
	id = "Rutherfordium"
	formula = "Rf"
	group = 4
	valence = 4
	period = 7
	M = 267
	reagent_state = Solid

//--------

/datum/reagent/tru/Vanadium
	isMetal = true
	name = "Vanadium"
	id = "Vanadium"
	formula = "V"
	group = 5
	valence = 5
	period = 4
	M = 51
	reagent_state = Solid

/datum/reagent/tru/Niobium
	isMetal = true
	name = "Niobium"
	id = "Niobium"
	formula = "Nb"
	group = 5
	valence = 5
	period = 5
	M = 93
	reagent_state = Solid

/datum/reagent/tru/Tantalum
	isMetal = true
	name = "Tantalum"
	id = "Tantalum"
	formula = "Ta"
	group = 5
	valence = 5
	period = 6
	M = 181
	reagent_state = Solid

/datum/reagent/tru/Dubnium
	isMetal = true
	name = "Dubnium"
	id = "Dubnium"
	formula = "Db"
	group = 5
	valence = 5
	period = 7
	M = 268
	reagent_state = Solid

/datum/reagent/tru/Chromium
	isMetal = true
	name = "Chromium"
	id = "Chromium"
	formula = "Cr"
	group = 6
	valence = 6
	period = 4
	M = 52
	reagent_state = Solid

/datum/reagent/tru/Molybdenum
	isMetal = true
	name = "Molybdenum"
	id = "Molybdenum"
	formula = "Mo"
	group = 6
	valence = 6
	period = 5
	M = 96
	reagent_state = Solid

/datum/reagent/tru/Tungsten
	isMetal = true
	name = "Tungsten"
	id = "Tungsten"
	formula = "W"
	group = 6
	valence = 6
	period = 6
	M = 184
	reagent_state = Solid

/datum/reagent/tru/Seaborgium
	isMetal = true
	name = "Seaborgium"
	id = "Seaborgium"
	formula = "Sg"
	group = 6
	valence = 6
	period = 7
	M = 269
	reagent_state = Solid

/datum/reagent/tru/Manganese
	isMetal = true
	name = "Manganese"
	id = "Manganese"
	formula = "Mn"
	group = 7
	valence = 7
	period = 4
	M = 55
	reagent_state = Solid

/datum/reagent/tru/Technetium
	isMetal = true
	name = "Technetium"
	id = "Technetium"
	formula = "Tc"
	group = 7
	valence = 7
	period = 5
	M = 98
	reagent_state = Solid

/datum/reagent/tru/Rhenium
	isMetal = true
	name = "Rhenium"
	id = "Rhenium"
	formula = "Re"
	group = 7
	valence = 7
	period = 6
	M = 186
	reagent_state = Solid

/datum/reagent/tru/Bohrium
	isMetal = true
	name = "Bohrium"
	id = "Bohrium"
	formula = "Bh"
	group = 7
	valence = 7
	period = 7
	M = 270
	reagent_state = Solid

/datum/reagent/tru/Iron
	isMetal = true
	name = "Iron"
	id = "Iron"
	formula = "Fe"
	group = 8
	valence = 8
	period = 4
	M = 56
	reagent_state = Solid

/datum/reagent/tru/Ruthenium
	isMetal = true
	name = "Ruthenium"
	id = "Ruthenium"
	formula = "Ru"
	group = 8
	valence = 8
	period = 5
	M = 101
	reagent_state = Solid

/datum/reagent/tru/Osmium
	isMetal = true
	name = "Osmium"
	id = "Osmium"
	formula = "Os"
	group = 8
	valence = 8
	period = 6
	M = 190
	reagent_state = Solid

/datum/reagent/tru/Hassium
	isMetal = true
	name = "Hassium"
	id = "Hassium"
	formula = "Hs"
	group = 8
	valence = 8
	period = 7
	M = 270
	reagent_state = Solid

/datum/reagent/tru/Cobalt
	isMetal = true
	name = "Cobalt"
	id = "Cobalt"
	formula = "Co"
	group = 9
	valence = 2
	period = 4
	M = 59
	reagent_state = Solid

/datum/reagent/tru/Rhodium
	isMetal = true
	name = "Rhodium"
	id = "Rhodium"
	formula = "Rh"
	group = 9
	valence = 9
	period = 5
	M = 103
	reagent_state = Solid

/datum/reagent/tru/Iridium
	isMetal = true
	name = "Iridium"
	id = "Iridium"
	formula = "Ir"
	group = 9
	valence = 9
	period = 6
	M = 192
	reagent_state = Solid

/datum/reagent/tru/Meitnerium
	isMetal = true
	name = "Meitnerium"
	id = "Meitnerium"
	formula = "Mt"
	group = 9
	valence = 9
	period = 7
	M = 278
	reagent_state = Solid

//---------------

/datum/reagent/tru/Nickel
	isMetal = true
	name = "Nickel"
	id = "Nickel"
	formula = "Ni"
	group = 10
	valence = 10
	period = 4
	M = 59
	reagent_state = Solid

/datum/reagent/tru/Palladium
	isMetal = true
	name = "Palladium"
	id = "Palladium"
	formula = "Pd"
	group = 10
	valence = 10
	period = 5
	M = 106
	reagent_state = Solid

/datum/reagent/tru/Platinum
	isMetal = true
	name = "Platinum"
	id = "Platinum"
	formula = "Pt"
	group = 10
	valence = 10
	period = 6
	M = 195
	reagent_state = Solid

/datum/reagent/tru/Darmstadtium
	isMetal = true
	name = "Darmstadtium"
	id = "Darmstadtium"
	formula = "Ds"
	group = 10
	valence = 10
	period = 7
	M = 281
	reagent_state = Solid

/datum/reagent/tru/Copper
	isMetal = true
	name = "Copper"
	id = "Copper"
	formula = "Cu"
	group = 11
	valence = 11
	period = 4
	M = 64
	reagent_state = Solid

/datum/reagent/tru/Silver
	isMetal = true
	name = "Silver"
	id = "Silver"
	formula = "Ag"
	group = 11
	valence = 11
	period = 5
	M = 108
	reagent_state = Solid

/datum/reagent/tru/Gold
	isMetal = true
	name = "Gold"
	id = "Gold"
	formula = "Au"
	group = 11
	valence = 11
	period = 6
	M = 197
	reagent_state = Solid

/datum/reagent/tru/Roentgenium
	isMetal = true
	name = "Roentgenium"
	id = "Roentgenium"
	formula = "Rg"
	group = 11
	valence = 11
	period = 7
	M = 282
	reagent_state = Solid

//----------------

/datum/reagent/tru/Zinc
	isMetal = true
	name = "Zinc"
	id = "Zinc"
	formula = "Zn"
	group = 12
	valence = 12
	period = 4
	M = 65
	reagent_state = Solid

/datum/reagent/tru/Cadmium
	isMetal = true
	name = "Cadmium"
	id = "Cadmium"
	formula = "Cd"
	group = 12
	valence = 12
	period = 5
	M = 112
	reagent_state = Solid

/datum/reagent/tru/Mercury
	isMetal = true
	name = "Mercury"
	id = "Mercury"
	formula = "Hg"
	group = 12
	valence = 12
	period = 6
	M = 201
	reagent_state = Solid

/datum/reagent/tru/Copernicium
	isMetal = true
	name = "Copernicium"
	id = "Copernicium"
	formula = "Cn"
	group = 12
	valence = 12
	period = 7
	M = 285
	reagent_state = Solid

//---------

/datum/reagent/tru/Aluminium
	isMetal = true
	name = "Aluminium"
	id = "Aluminium"
	formula = "Al"
	group = 13
	valence = 13
	period = 3
	M = 27
	reagent_state = Solid

/datum/reagent/tru/Gallium
	isMetal = true
	name = "Gallium"
	id = "Gallium"
	formula = "Ga"
	group = 13
	valence = 13
	period = 4
	M = 70
	reagent_state = Solid

/datum/reagent/tru/Indium
	isMetal = true
	name = "Indium"
	id = "Indium"
	formula = "In"
	group = 13
	valence = 13
	period = 5
	M = 115
	reagent_state = Solid

/datum/reagent/tru/Thallium
	isMetal = true
	name = "Thallium"
	id = "Thallium"
	formula = "Tl"
	group = 13
	valence = 13
	period = 6
	M = 204
	reagent_state = Solid

/datum/reagent/tru/Nihonium
	isMetal = true
	name = "Nihonium"
	id = "Nihonium"
	formula = "Nh"
	group = 13
	valence = 13
	period = 7
	M = 286
	reagent_state = Solid

//------------

/datum/reagent/tru/Tin
	isMetal = true
	name = "Tin"
	id = "Tin"
	formula = "Sn"
	group = 14
	valence = 14
	period = 5
	M = 119
	reagent_state = Solid

/datum/reagent/tru/Lead
	isMetal = true
	name = "Lead"
	id = "Lead"
	formula = "Pb"
	group = 14
	valence = 14
	period = 6
	M = 207
	reagent_state = Solid

//------------

/datum/reagent/tru/Bismuth
	isMetal = true
	name = "Bismuth"
	id = "Bismuth"
	formula = "Bi"
	group = 15
	valence = 15
	period = 6
	M = 209
	reagent_state = Solid

//----------

/datum/reagent/tru/Polonium
	isMetal = true
	name = "Polonium"
	id = "Polonium"
	formula = "Po"
	group = 16
	valence = 16
	period = 6
	M = 209
	reagent_state = Solid

//------------------------------------------------------
//--------------Lanthanums------------------------------
/datum/reagent/tru/Cerium
	isMetal = true
	name = "Cerium"
	id = "Cerium"
	formula = "Ce"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 140
	reagent_state = Solid

/datum/reagent/tru/Praseodymium
	isMetal = true
	name = "Praseodymium"
	id = "Praseodymium"
	formula = "Pr"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 141
	reagent_state = Solid

/datum/reagent/tru/Neodymium
	isMetal = true
	name = "Neodymium"
	id = "Neodymium"
	formula = "Nd"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 144
	reagent_state = Solid

/datum/reagent/tru/Promethium
	isMetal = true
	name = "Promethium"
	id = "Promethium"
	formula = "Pm"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 145
	reagent_state = Solid

/datum/reagent/tru/Samarium
	isMetal = true
	name = "Samarium"
	id = "Samarium"
	formula = "Sm"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 150
	reagent_state = Solid

/datum/reagent/tru/Europium
	isMetal = true
	name = "Europium"
	id = "Europium"
	formula = "Eu"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 152
	reagent_state = Solid

/datum/reagent/tru/Gadolinium
	isMetal = true
	name = "Gadolinium"
	id = "Gadolinium"
	formula = "Gd"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 157
	reagent_state = Solid

/datum/reagent/tru/Terbium
	isMetal = true
	name = "Terbium"
	id = "Terbium"
	formula = "Tb"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 159
	reagent_state = Solid

/datum/reagent/tru/Dysposium
	isMetal = true
	name = "Dysposium"
	id = "Dysposium"
	formula = "Dy"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 163
	reagent_state = Solid

/datum/reagent/tru/Holmium
	isMetal = true
	name = "Holmium"
	id = "Holmium"
	formula = "Ho"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 165
	reagent_state = Solid

/datum/reagent/tru/Erbium
	isMetal = true
	name = "Erbium"
	id = "Erbium"
	formula = "Er"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 167
	reagent_state = Solid

/datum/reagent/tru/Thulium
	isMetal = true
	name = "Thulium"
	id = "Thulium"
	formula = "Tm"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 169
	reagent_state = Solid

/datum/reagent/tru/Ytterbium
	isMetal = true
	name = "Ytterbium"
	id = "Ytterbium"
	formula = "Yb"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 173
	reagent_state = Solid

/datum/reagent/tru/Lutetium
	isMetal = true
	name = "Lutetium"
	id = "Lutetium"
	formula = "Lu"
	group = LANTAN
	valence = LANTAN
	period = 6
	M = 175
	reagent_state = Solid

//------------ACTINIUMS-------------

/datum/reagent/tru/Thorium
	isMetal = true
	name = "Thorium"
	id = "Thorium"
	formula = "Th"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 232
	reagent_state = Solid

/datum/reagent/tru/Protactinium
	isMetal = true
	name = "Protactinium"
	id = "Protactinium"
	formula = "Pa"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 231
	reagent_state = Solid

/datum/reagent/tru/Uranium
	isMetal = true
	name = "Uranium"
	id = "Uranium"
	formula = "U"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 238
	reagent_state = Solid

/datum/reagent/tru/Neptunium
	isMetal = true
	name = "Neptunium"
	id = "Neptunium"
	formula = "Np"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 237
	reagent_state = Solid

/datum/reagent/tru/Plutonium
	isMetal = true
	name = "Plutonium"
	id = "Plutonium"
	formula = "Pu"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 244
	reagent_state = Solid

/datum/reagent/tru/Americium
	isMetal = true
	name = "Americium"
	id = "Americium"
	formula = "Am"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 243
	reagent_state = Solid

/datum/reagent/tru/Curium
	isMetal = true
	name = "Curium"
	id = "Curium"
	formula = "Cm"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 247
	reagent_state = Solid

/datum/reagent/tru/Berkelium
	isMetal = true
	name = "Berkelium"
	id = "Berkelium"
	formula = "Bk"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 247
	reagent_state = Solid

/datum/reagent/tru/Californium
	isMetal = true
	name = "Californium"
	id = "Californium"
	formula = "Cf"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 251
	reagent_state = Solid

/datum/reagent/tru/Einstenium
	isMetal = true
	name = "Einstenium"
	id = "Einstenium"
	formula = "Es"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 252
	reagent_state = Solid

/datum/reagent/tru/Fermium
	isMetal = true
	name = "Fermium"
	id = "Fermium"
	formula = "Fm"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 257
	reagent_state = Solid

/datum/reagent/tru/Mendelevium
	isMetal = true
	name = "Mendelevium"
	id = "Mendelevium"
	formula = "Md"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 258
	reagent_state = SOLID

/datum/reagent/tru/Nobelium
	isMetal = true
	name = "Nobelium"
	id = "Nobelium"
	formula = "No"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 259
	reagent_state = SOLID

/datum/reagent/tru/Lawrencium
	isMetal = true
	name = "Lawrencium"
	id = "Lawrencium"
	formula = "Lr"
	group = ACTIN
	valence = ACTIN
	period = 7
	M = 266
	reagent_state = SOLID

/*
Creating list of metals and not.
This need to create bases and acids
*/
//WTF error?!!
/*
var/tru_reagents = subtypesof(/datum/reagent/tru/)
var/metalsList = new/list()
var/notMetals  = new/list()
for(var/datum/reagent/tru/regs in tru_reagents)
	if(regs.isMetal)
		metalsList += regs
	if(!regs.isMetal)
		notMetals += regs
*/
//---------utils----------------
/proc/getElemByFormula(var/f)
	var/tru_reagents = subtypesof(/datum/reagent/tru)
	for(var/datum/reagent/tru/regs in tru_reagents)
		if(regs.formula == f)
			return regs

/proc/getMetalElements()
	var/tru_reagents = subtypesof(/datum/reagent/tru)
	var/metals = new/list()
	for(var/datum/reagent/tru/regs in tru_reagents)
		regs.create_data()
		if(regs.isMetal)
			metals += regs
	return metals

/proc/getNonMetalElements()
	var/tru_reagents = subtypesof(/datum/reagent/tru)
	var/nonMetals = new/list()
	for(var/datum/reagent/tru/regs in tru_reagents)
		regs.create_data()
		if(!regs.isMetal)
			nonMetals += regs
	return nonMetals

/*/proc/getSubstanceByFormula(var/f)
	var/substances = subtypesof(/datum/substance)
	for(var/datum/substance/subst in substances)
		if(subst.formula == f)
			return subst*/
//-----------------------------------------------
var/metals 	  = getMetalElements()
var/nonMetals = getNonMetalElements()
var/allReagents = metals + nonMetals
//-------------conteiners-----------------
/obj/item/reagent_containers/glass/bottle/carbon_tru
	name = "Carbon bottle"
	list_reagents = list("Carbon" = 30)

/obj/item/reagent_containers/glass/bottle/oxygen_tru
	name = "Oxygen bottle"
	list_reagents = list("Oxygen" = 30)

/obj/item/reagent_containers/glass/bottle/hidrogen_tru
	name = "Hidrogen bottle"
	list_reagents = list("Hidrogen" = 30)

/obj/item/reagent_containers/glass/bottle/boron_tru
	name = "Boron bottle"
	list_reagents = list("Boron" = 30)

/obj/item/reagent_containers/glass/bottle/sillicon_tru
	name = "Sillicon bottle"
	list_reagents = list("Sillicon" = 30)

/obj/item/reagent_containers/glass/bottle/helium_tru
	name = "Helium bottle"
	list_reagents = list("Helium" = 30)

/obj/item/reagent_containers/glass/bottle/lithium_tru
	name = "Lithium bottle"
	list_reagents = list("Lithium" = 30)

/obj/item/reagent_containers/glass/bottle/carbon_tru
	name = "Carbon bottle"
	list_reagents = list("Carbon" = 30)

/obj/item/reagent_containers/glass/bottle/beryllium_tru
	name = "Beryllium bottle"
	list_reagents = list("Beryllium" = 30)

/obj/item/reagent_containers/glass/bottle/nitrogen_tru
	name = "Nitrogen bottle"
	list_reagents = list("Nitrogen" = 30)

/obj/item/reagent_containers/glass/bottle/fluorine_tru
	name = "Fluorine bottle"
	list_reagents = list("Fluorine" = 30)

/obj/item/reagent_containers/glass/bottle/neon_tru
	name = "Neon bottle"
	list_reagents = list("Neon" = 30)

/obj/item/reagent_containers/glass/bottle/potassium_tru
	name = "Potassium bottle"
	list_reagents = list("Potassium" = 30)

/obj/item/reagent_containers/glass/bottle/sodium_tru
	name = "Sodium bottle"
	list_reagents = list("Sodium" = 30)

/obj/item/reagent_containers/glass/bottle/magnesium_tru
	name = "Magnesium bottle"
	list_reagents = list("Magnesium" = 30)

/obj/item/reagent_containers/glass/bottle/aluminium_tru
	name = "Aluminium bottle"
	list_reagents = list("Aluminium" = 30)

/obj/item/reagent_containers/glass/bottle/phosphorus_tru
	name = "Phosphorus bottle"
	list_reagents = list("Phosphorus" = 30)

/obj/item/reagent_containers/glass/bottle/sulfur_tru
	name = "Sulfur bottle"
	list_reagents = list("Sulfur" = 30)

/obj/item/reagent_containers/glass/bottle/chlorine_tru
	name = "Chlorine bottle"
	list_reagents = list("Chlorine" = 30)

/obj/item/reagent_containers/glass/bottle/argon_tru
	name = "Argon bottle"
	list_reagents = list("Argon" = 30)

/obj/item/reagent_containers/glass/bottle/calcium_tru
	name = "Calcium bottle"
	list_reagents = list("Calcium" = 30)

/obj/item/reagent_containers/glass/bottle/scandium_tru
	name = "Scandium bottle"
	list_reagents = list("Scandium" = 30)

/obj/item/reagent_containers/glass/bottle/titanium_tru
	name = "Titanium bottle"
	list_reagents = list("Titanium" = 30)

/obj/item/reagent_containers/glass/bottle/vanadium_tru
	name = "Vanadium bottle"
	list_reagents = list("Vanadium" = 30)

/obj/item/reagent_containers/glass/bottle/chromium_tru
	name = "Chromium bottle"
	list_reagents = list("Chromium" = 30)

/obj/item/reagent_containers/glass/bottle/manganese_tru
	name = "Manganese bottle"
	list_reagents = list("Manganese" = 30)

/obj/item/reagent_containers/glass/bottle/iron_tru
	name = "Iron bottle"
	list_reagents = list("Iron" = 30)

/obj/item/reagent_containers/glass/bottle/cobalt_tru
	name = "Cobalt bottle"
	list_reagents = list("Cobalt" = 30)

/obj/item/reagent_containers/glass/bottle/nickel_tru
	name = "Nickel bottle"
	list_reagents = list("Nickel" = 30)

/obj/item/reagent_containers/glass/bottle/copper_tru
	name = "Copper bottle"
	list_reagents = list("Copper" = 30)

/obj/item/reagent_containers/glass/bottle/zinc_tru
	name = "Zinc bottle"
	list_reagents = list("Zinc" = 30)

/obj/item/reagent_containers/glass/bottle/gallium_tru
	name = "Gallium bottle"
	list_reagents = list("Gallium" = 30)

/obj/item/reagent_containers/glass/bottle/germanium_tru
	name = "Germanium bottle"
	list_reagents = list("Germanium" = 30)

/obj/item/reagent_containers/glass/bottle/arsenic_tru
	name = "Arsenic bottle"
	list_reagents = list("Arsenic" = 30)

/obj/item/reagent_containers/glass/bottle/selenium_tru
	name = "Selenium bottle"
	list_reagents = list("Selenium" = 30)

/obj/item/reagent_containers/glass/bottle/bromine_tru
	name = "Bromine bottle"
	list_reagents = list("Bromine" = 30)

/obj/item/reagent_containers/glass/bottle/krypton_tru
	name = "Krypton bottle"
	list_reagents = list("Krypton" = 30)

/obj/item/reagent_containers/glass/bottle/rubidium_tru
	name = "Rubidium bottle"
	list_reagents = list("Rubidium" = 30)

/obj/item/reagent_containers/glass/bottle/strontium_tru
	name = "Strontium bottle"
	list_reagents = list("Strontium" = 30)

/obj/item/reagent_containers/glass/bottle/yttrium_tru
	name = "Yttrium bottle"
	list_reagents = list("Yttrium" = 30)

/obj/item/reagent_containers/glass/bottle/zirconium_tru
	name = "Zirconium bottle"
	list_reagents = list("Zirconium" = 30)

/obj/item/reagent_containers/glass/bottle/niobium_tru
	name = "Niobium bottle"
	list_reagents = list("Niobium" = 30)

/obj/item/reagent_containers/glass/bottle/molybdenum_tru
	name = "Molybdenum bottle"
	list_reagents = list("Molybdenum" = 30)

/obj/item/reagent_containers/glass/bottle/technetium_tru
	name = "Technetium bottle"
	list_reagents = list("Technetium" = 30)

/obj/item/reagent_containers/glass/bottle/ruthenium_tru
	name = "Ruthenium bottle"
	list_reagents = list("Ruthenium" = 30)

/obj/item/reagent_containers/glass/bottle/rhodium_tru
	name = "Rhodium bottle"
	list_reagents = list("Rhodium" = 30)

/obj/item/reagent_containers/glass/bottle/palladium_tru
	name = "Palladium bottle"
	list_reagents = list("Palladium" = 30)

/obj/item/reagent_containers/glass/bottle/silver_tru
	name = "Silver bottle"
	list_reagents = list("Silver" = 30)

/obj/item/reagent_containers/glass/bottle/cadmium_tru
	name = "Cadmium bottle"
	list_reagents = list("Cadmium" = 30)

/obj/item/reagent_containers/glass/bottle/indium_tru
	name = "Indium bottle"
	list_reagents = list("Indium" = 30)

/obj/item/reagent_containers/glass/bottle/tin_tru
	name = "Tin bottle"
	list_reagents = list("Tin" = 30)

/obj/item/reagent_containers/glass/bottle/antimony_tru
	name = "Antimony bottle"
	list_reagents = list("Antimony" = 30)

/obj/item/reagent_containers/glass/bottle/tellurium_tru
	name = "Tellurium bottle"
	list_reagents = list("Tellurium" = 30)

/obj/item/reagent_containers/glass/bottle/iodine_tru
	name = "Iodine bottle"
	list_reagents = list("Iodine" = 30)

/obj/item/reagent_containers/glass/bottle/xenon_tru
	name = "Xenon bottle"
	list_reagents = list("Xenon" = 30)

/obj/item/reagent_containers/glass/bottle/caesium_tru
	name = "Caesium bottle"
	list_reagents = list("Caesium" = 30)

/obj/item/reagent_containers/glass/bottle/barium_tru
	name = "Barium bottle"
	list_reagents = list("Barium" = 30)

/obj/item/reagent_containers/glass/bottle/lanthanum_tru
	name = "Lanthanum bottle"
	list_reagents = list("Lanthanum" = 30)

/obj/item/reagent_containers/glass/bottle/cerium_tru
	name = "Cerium bottle"
	list_reagents = list("Cerium" = 30)

/obj/item/reagent_containers/glass/bottle/praseodymium_tru
	name = "Praseodymium bottle"
	list_reagents = list("Praseodymium" = 30)

/obj/item/reagent_containers/glass/bottle/neodymium_tru
	name = "Neodymium bottle"
	list_reagents = list("Neodymium" = 30)

/obj/item/reagent_containers/glass/bottle/promethium_tru
	name = "Promethium bottle"
	list_reagents = list("Promethium" = 30)

/obj/item/reagent_containers/glass/bottle/samarium_tru
	name = "Samarium bottle"
	list_reagents = list("Samarium" = 30)

/obj/item/reagent_containers/glass/bottle/europium_tru
	name = "Europium bottle"
	list_reagents = list("Europium" = 30)

/obj/item/reagent_containers/glass/bottle/gadolinium_tru
	name = "Gadolinium bottle"
	list_reagents = list("Gadolinium" = 30)

/obj/item/reagent_containers/glass/bottle/terbium_tru
	name = "Terbium bottle"
	list_reagents = list("Terbium" = 30)

/obj/item/reagent_containers/glass/bottle/dysprosium_tru
	name = "Dysprosium bottle"
	list_reagents = list("Dysprosium" = 30)

/obj/item/reagent_containers/glass/bottle/holmium_tru
	name = "Holmium bottle"
	list_reagents = list("Holmium" = 30)

/obj/item/reagent_containers/glass/bottle/erbium_tru
	name = "Erbium bottle"
	list_reagents = list("Erbium" = 30)

/obj/item/reagent_containers/glass/bottle/thulium_tru
	name = "Thulium bottle"
	list_reagents = list("Thulium" = 30)

/obj/item/reagent_containers/glass/bottle/ytterbium_tru
	name = "Ytterbium bottle"
	list_reagents = list("Ytterbium" = 30)

/obj/item/reagent_containers/glass/bottle/lutetium_tru
	name = "Lutetium bottle"
	list_reagents = list("Lutetium" = 30)

/obj/item/reagent_containers/glass/bottle/hafnium_tru
	name = "Hafnium bottle"
	list_reagents = list("Hafnium" = 30)

/obj/item/reagent_containers/glass/bottle/tantalum_tru
	name = "Tantalum bottle"
	list_reagents = list("Tantalum" = 30)

/obj/item/reagent_containers/glass/bottle/tungsten_tru
	name = "Tungsten bottle"
	list_reagents = list("Tungsten" = 30)

/obj/item/reagent_containers/glass/bottle/rhenium_tru
	name = "Rhenium bottle"
	list_reagents = list("Rhenium" = 30)

/obj/item/reagent_containers/glass/bottle/osmium_tru
	name = "Osmium bottle"
	list_reagents = list("Osmium" = 30)

/obj/item/reagent_containers/glass/bottle/iridium_tru
	name = "Iridium bottle"
	list_reagents = list("Iridium" = 30)

/obj/item/reagent_containers/glass/bottle/platinum_tru
	name = "Platinum bottle"
	list_reagents = list("Platinum" = 30)

/obj/item/reagent_containers/glass/bottle/gold_tru
	name = "Gold bottle"
	list_reagents = list("Gold" = 30)

/obj/item/reagent_containers/glass/bottle/mercury_tru
	name = "Mercury bottle"
	list_reagents = list("Mercury" = 30)

/obj/item/reagent_containers/glass/bottle/thallium_tru
	name = "Thallium bottle"
	list_reagents = list("Thallium" = 30)

/obj/item/reagent_containers/glass/bottle/lead_tru
	name = "Lead bottle"
	list_reagents = list("Lead" = 30)

/obj/item/reagent_containers/glass/bottle/bismuth_tru
	name = "Bismuth bottle"
	list_reagents = list("Bismuth" = 30)

/obj/item/reagent_containers/glass/bottle/polonium_tru
	name = "Polonium bottle"
	list_reagents = list("Polonium" = 30)

/obj/item/reagent_containers/glass/bottle/astatine_tru
	name = "Astatine bottle"
	list_reagents = list("Astatine" = 30)

/obj/item/reagent_containers/glass/bottle/radon_tru
	name = "Radon bottle"
	list_reagents = list("Radon" = 30)

/obj/item/reagent_containers/glass/bottle/francium_tru
	name = "Francium bottle"
	list_reagents = list("Francium" = 30)

/obj/item/reagent_containers/glass/bottle/radium_tru
	name = "Radium bottle"
	list_reagents = list("Radium" = 30)

/obj/item/reagent_containers/glass/bottle/actinium_tru
	name = "Actinium bottle"
	list_reagents = list("Actinium" = 30)

/obj/item/reagent_containers/glass/bottle/thorium_tru
	name = "Thorium bottle"
	list_reagents = list("Thorium" = 30)

/obj/item/reagent_containers/glass/bottle/protactinium_tru
	name = "Protactinium bottle"
	list_reagents = list("Protactinium" = 30)

/obj/item/reagent_containers/glass/bottle/uranium_tru
	name = "Uranium bottle"
	list_reagents = list("Uranium" = 30)

/obj/item/reagent_containers/glass/bottle/neptunium_tru
	name = "Neptunium bottle"
	list_reagents = list("Neptunium" = 30)

/obj/item/reagent_containers/glass/bottle/plutonium_tru
	name = "Plutonium bottle"
	list_reagents = list("Plutonium" = 30)

/obj/item/reagent_containers/glass/bottle/americium_tru
	name = "Americium bottle"
	list_reagents = list("Americium" = 30)

/obj/item/reagent_containers/glass/bottle/curium_tru
	name = "Curium bottle"
	list_reagents = list("Curium" = 30)

/obj/item/reagent_containers/glass/bottle/berkelium_tru
	name = "Berkelium bottle"
	list_reagents = list("Berkelium" = 30)

/obj/item/reagent_containers/glass/bottle/californium_tru
	name = "Californium bottle"
	list_reagents = list("Californium" = 30)

/obj/item/reagent_containers/glass/bottle/einsteinium_tru
	name = "Einsteinium bottle"
	list_reagents = list("Einsteinium" = 30)

/obj/item/reagent_containers/glass/bottle/fermium_tru
	name = "Fermium bottle"
	list_reagents = list("Fermium" = 30)

/obj/item/reagent_containers/glass/bottle/mendelevium_tru
	name = "Mendelevium bottle"
	list_reagents = list("Mendelevium" = 30)

/obj/item/reagent_containers/glass/bottle/nobelium_tru
	name = "Nobelium bottle"
	list_reagents = list("Nobelium" = 30)

/obj/item/reagent_containers/glass/bottle/lawrencium_tru
	name = "Lawrencium bottle"
	list_reagents = list("Lawrencium" = 30)

/obj/item/reagent_containers/glass/bottle/rutherfordium_tru
	name = "Rutherfordium bottle"
	list_reagents = list("Rutherfordium" = 30)

/obj/item/reagent_containers/glass/bottle/dubnium_tru
	name = "Dubnium bottle"
	list_reagents = list("Dubnium" = 30)

/obj/item/reagent_containers/glass/bottle/seaborgium_tru
	name = "Seaborgium bottle"
	list_reagents = list("Seaborgium" = 30)

/obj/item/reagent_containers/glass/bottle/bohrium_tru
	name = "Bohrium bottle"
	list_reagents = list("Bohrium" = 30)

/obj/item/reagent_containers/glass/bottle/hassium_tru
	name = "Hassium bottle"
	list_reagents = list("Hassium" = 30)

/obj/item/reagent_containers/glass/bottle/meitnerium_tru
	name = "Meitnerium bottle"
	list_reagents = list("Meitnerium" = 30)

/obj/item/reagent_containers/glass/bottle/darmstadtium_tru
	name = "Darmstadtium bottle"
	list_reagents = list("Darmstadtium" = 30)

/obj/item/reagent_containers/glass/bottle/roentgenium_tru
	name = "Roentgenium bottle"
	list_reagents = list("Roentgenium" = 30)

/obj/item/reagent_containers/glass/bottle/copernicium_tru
	name = "Copernicium bottle"
	list_reagents = list("Copernicium" = 30)

/obj/item/reagent_containers/glass/bottle/nihonium_tru
	name = "Nihonium bottle"
	list_reagents = list("Nihonium" = 30)

/obj/item/reagent_containers/glass/bottle/flerovium_tru
	name = "Flerovium bottle"
	list_reagents = list("Flerovium" = 30)

/obj/item/reagent_containers/glass/bottle/moscovium_tru
	name = "Moscovium bottle"
	list_reagents = list("Moscovium" = 30)

/obj/item/reagent_containers/glass/bottle/livermorium_tru
	name = "Livermorium bottle"
	list_reagents = list("Livermorium" = 30)

/obj/item/reagent_containers/glass/bottle/tennessine_tru
	name = "Tennessine bottle"
	list_reagents = list("Tennessine" = 30)

/obj/item/reagent_containers/glass/bottle/oganesson_tru
	name = "Oganesson bottle"
	list_reagents = list("Oganesson" = 30)


//----------------------------------------
/*
/datum/substance/CarbonDiOx
	name = "carbon dioxyde"
	id = "co2"
	formula = "CO"
	*/
#undef true
#undef false
#undef Solid
#undef LANTAN
#undef ACTIN