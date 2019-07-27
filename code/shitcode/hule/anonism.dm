GLOBAL_LIST_INIT(anonists, list("valtosss","coolden"))

/client/proc/get_loc_info()
	if(src.ckey in GLOB.anonists)
		return list("country" = "Japan", "city" = "Neo Tokyo") //lol ip is still visible to everyone with premission to vv
	var/http[] = world.Export("http://www.iplocate.io/api/lookup/[src.address]")
	if(http)
		var/F = json_decode(file2text(http["CONTENT"]))
		return F
	else
		return list("country" = "HTTP Is Not Received", "city" = "HTTP Is Not Received")

