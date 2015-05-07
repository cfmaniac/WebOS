<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<cfif isDefined("form.siteID")>

	<cfdump var="#session#">

<cfinvoke component="sites" method="setSite" siteID="#form.siteID#" returnvariable="rslt">

	<cfdump var="#session#"> / <cfdump var="#rslt#">
    
<CFLOCATION url="../INDEX.CFM">

</cfif>
</body>
</html>
