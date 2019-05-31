# -*- encoding: utf-8 -*-

import os, io, re
from glob import glob
result = [y for x in os.walk('.')
for y in glob(os.path.join(x[0], '*.dm'))]

ft_obj		= r'^/obj/[a-zA-Z_/]+'
ft_obj_p	= r'obj/[a-zA-Z_/]+'
ft_obj_f	= r'^/obj/[a-zA-Z/\d_]*\n\t[a-zA-Z =\d\"\'\\\n\t\-,\._]*'

ft_proc 	= r'^/obj/[a-zA-Z_/]+[(]+'

ft_icon 	= r'\ticon\s'
ft_icon_p 	= r'icons/[a-zA-Z/_\d]+.dmi'

ft_state 	= r'\ticon_state\s'
ft_state_p 	= r'\"[a-zA-Z/_\-\d]+\"'

ft_name 	= r'\tname\s'
ft_name_p 	= r'\"[a-zA-Z/_\-\d\/\s.\[\]\\!\'*+]+\"'

o = open("objects.txt", "w")

c = 0

for x in range(len(result)):
	with io.open((result[x])) as file:
		data = str(file.read())
		if re.findall(ft_obj_f, data):
			ob = (re.findall(ft_obj_f, data))
			for i in range(len(ob)):
				c += 1
				wr = ob[i].split('\n')
				for l in range(len(wr)):
					an = wr[l].strip('\n')
					o.write(str(an)+' ::: ')
				o.write('\n')

print ('Objects count: ' + str(c))
file.close()
