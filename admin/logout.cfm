<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body bgcolor="535087" text="FFFFFF">
<!--- ends the current user session --->
<CFLOCK SCOPE="SESSION" TYPE="EXCLUSIVE" TIMEOUT="2">
<CFSET StructClear(Session)>
</CFLOCK>

<cflocation url="index.cfm">

</body>
</html>
