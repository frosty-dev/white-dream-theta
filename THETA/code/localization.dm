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

//513 TEXT PROCS (copytext_char and so on)
#if DM_VERSION >= 513 && DM_BUILD >= 1493
/proc/r_slur(n)
	var/phrase = html_decode(n)
	var/leng = length(phrase)
	var/counter=length(phrase)
	var/newphrase=""
	var/newletter=""
	while(counter>=1)
		newletter=copytext_char(phrase,(leng-counter)+1,(leng-counter)+2)
		if(rand(1,3)==3)
			if(lowertext(newletter)=="в")
				newletter="ф"
			if(lowertext(newletter)=="ш")
				newletter="щ"
			if(lowertext(newletter)=="р")
				newletter="л"
			if(lowertext(newletter)=="ч")
				newletter="щ"
			if(lowertext(newletter)=="з")
				newletter="с"
		if(rand(1,20)==20)
			if(newletter==" ")
				newletter="...э-э-ы-ы..."
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

/proc/r_stutter(n)
	var/te = html_decode(n)
	var/t = ""//placed before the message. Not really sure what it's for.
	n = length(n)//length of the entire word
	var/p = null
	p = 1//1 is the start of any word
	while(p <= n)//while P, which starts at 1 is less or equal to N which is the length.
		var/n_letter = copytext_char(te, p, p + 1)//copies text from a certain distance. In this case, only one letter at a time.
		if (prob(80) && (ckey(n_letter) in list("з","с","б","д","т","к","г","п","в","р","ч","а","у","о","м","е","и","э","х","н","л")))
			if (prob(10))
				n_letter = text("[n_letter]-[n_letter]-[n_letter]-[n_letter]")//replaces the current letter with this instead.
			else
				if (prob(20))
					n_letter = text("[n_letter]-[n_letter]-[n_letter]")
				else
					if (prob(5))
						n_letter = null
					else
						n_letter = text("[n_letter]-[n_letter]")
		t = text("[t][n_letter]")//since the above is ran through for each letter, the text just adds up back to the original word.
		p++//for each letter p is increased to find where the next letter will be.
	return copytext_char(sanitize(t),1,MAX_MESSAGE_LEN)
#endif
