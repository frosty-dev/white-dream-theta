/proc/r_capitalize(t as text)
    var/first = ascii2text(text2ascii(t))
    return r_uppertext(first) + copytext(t, length(first) + 1)

/proc/r_uppertext(text)
	var/t = ""
	for(var/i = 1, i <= length(text), i++)
		var/a = text2ascii(text, i)
		if (a == 1105 || a == 1025)
			t += ascii2text(1025)
			continue
		if (a < 1072 || a > 1105)
			t += ascii2text(a)
			continue
		t += ascii2text(a - 32)
	return uppertext(t)

/proc/ru_slur(n)
	var/phrase = html_decode(n)
	var/leng = length(phrase)
	var/counter=length(phrase)
	var/newphrase=""
	var/newletter=""
	while(counter>=1)
		newletter=copytext_char(phrase,(leng-counter)+1,(leng-counter)+2)
		if(rand(1,3)==3)
			if(lowertext(newletter)=="д")
				newletter="т"
			if(lowertext(newletter)=="ш")
				newletter="щ"
			if(lowertext(newletter)=="а")
				newletter="ах"
			if(lowertext(newletter)=="ч")
				newletter="щ"
			if(lowertext(newletter)=="з")
				newletter="с"
		if(rand(1,20)==20)
			if(newletter==" ")
				newletter="...ууууххххххх..."
			if(newletter==".")
				newletter=" *ИК*."
		switch(rand(1,20))
			if(1)
				newletter+="'"
			if(10)
				newletter+="[newletter]"
			if(20)
				newletter+="[newletter][newletter]"
		newphrase+="[newletter]";counter-=1
	return newphrase
