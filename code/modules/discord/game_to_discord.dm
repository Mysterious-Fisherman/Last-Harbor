// ported from BeeStation
/proc/msg2url(msg as text)
	var/list/conversions = list(
	"\[fwslash]"="/",
	"\[colon]"=",",
	"\[bslash]"="\\",
	"\[qmark]"="?",
	"\[space]"=" ",
	"\[quote]"="\"",
	"\[nl]" = "\n",
	"@" = "(a)" // no @ abuse
	)
	for(var/c in conversions)
		msg = replacetext(msg, conversions[c], c)
	return msg
	
/proc/discordsendmsg(channel as text, msg as text)
	if(!CONFIG_GET(flag/using_discord))
		return
	msg = msg2url(msg)
	world.Export("http://127.0.0.1:5000/api/[channel]/[msg]")
