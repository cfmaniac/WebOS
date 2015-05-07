 <!---Set mycounter to 0 and increment my neighbor's counter --->
<cfset myplace = ListFindNoCase(Application.UserList, session.MyUsername)>
<cfset nextplace = myplace +1>
<cfif nextplace gt ListLen(Application.UserListCounter)><cfset nextplace = 1></cfif><!---wrap around list--->
<!---<cfset Application.UserListCounter = ListSetAt(Application.UserListCounter, myplace, 0)>--->
<!---<cfset value = ListGetAt(Application.UserListCounter, nextplace) + 1>--->
<!---<cfset Application.UserListCounter = ListSetAt(Application.UserListCounter, nextplace, value)>--->

<!---Perform Cleanup operation by looking for 4's --->
<cfset counters = listtoarray(Application.UserListCounter)>
<cfloop from="1" to="#ArrayLen(counters)#" index="i">
<cfif counters[i] gte 5>
<cfset delete = i>
</cfif>
</cfloop>
<cfif isDefined("delete")>
<cfset Application.UserListCounter = ListDeleteAt(Application.UserListCounter, delete)>
<cfset Application.UserList = ListDeleteAt(Application.UserList, delete)>
</cfif>
<html>
  <head>
     <title>Message Log</title>
      <script language="JavaScript1.2">
window.setInterval(reloadpage, 3000);
function reloadpage(){location.reload();}
</script>
  </head>

  <body>

  <cfoutput>
     #Application.MessageLog#
  </cfoutput>

  </body>
</html>