<cfif MultiRoom>
	<cfquery datasource="#datasrc#" name="getRoom" cachedwithin="#CreateTimeSpan(0,0,IIF(Flush,0,QueryCacheTime),0)#">
		SELECT * FROM #table_forum_rooms# WHERE RoomID = #RooMID#
	</cfquery>
</cfif>
<cfoutput>
<SCRIPT LANGUAGE="JavaScript">
function checkFields() {
missinginfo = "";
if ((document.form.email.value == "") ||
(document.form.email.value.indexOf('@') == -1) || 
(document.form.email.value.indexOf('.') == -1)) {
missinginfo += "\n     -  Email address";
}
if (document.form.author.value == "") {
missinginfo += "\n     -  Name";
}
if (document.form.title.value == "") {
missinginfo += "\n     -  Topic";
}
if (document.form.message.value == "") {
missinginfo += "\n     -  Message Body";
}
if (missinginfo != "") {
missinginfo ="eForum v1.0:\n_____________________________\n" +
"You failed to correctly fill in your:\n" +
missinginfo + "\n_____________________________";
alert(missinginfo);
return false;
}
else return true;
}
</script>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="breadcrumb_nav"><a href="?module=forum" class="breadcrumb_nav">#ForumTitle#</a></b> <cfif MultiRoom AND ParameterExists(url.roomid)> :: <a href="?module=forum&action=forum&roomID=#RoomID#" class="breadcrumb_nav">#getRoom.Title#</a></cfif></td>
  </tr>
  <tr>
    <td><cfif action is "forum">
	&nbsp;
	
	<a href="?module=forum&action=forum&roomID=#roomID#&CURRENTPage=#CurrentPage#&viewThreads=0">Expand Threads</a>
	&nbsp;|&nbsp;	<a href="?module=forum&action=forum&viewThreads=1&roomID=#roomID#&CURRENTPage=#CurrentPage#">Collapse Threads</a>
	&nbsp;| &nbsp;<a href="?module=forum&action=new&roomID=#roomID#">Post A New Message</a>&nbsp; |
</cfif>
	&nbsp;<a href="?module=forum&action=search&roomID=#roomID#">Search the Forum</a>&nbsp;</font></td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;
    </td>
  </tr>
</table>


<!---<table bgcolor="black" cellspacing="0" cellpadding="0" border=0><tr><td>
<table border="0" cellspacing="1" cellpadding="2"><tr><td bgcolor="white">#DefaultFont#&nbsp;&nbsp;<font size="+1"><b><a href="#SubmitAlias#">#ForumTitle#</a></b> <cfif MultiRoom AND ParameterExists(url.roomid)>&##187 <a href="?module=forum&action=forum&roomID=#RoomID#">#getRoom.Title#</a></cfif></font>&nbsp;&nbsp;</td><td align="CENTER" valign="MIDDLE" bgcolor=white>
#DefaultFont#
<cfif action is "forum">
	&nbsp;
	<cfif ViewThreads OR Flush>
	<a href="?module=forum&action=forum&roomID=#roomID#&CURRENTPage=#CurrentPage#&viewThreads=0">Collapse Threads</a>
	<cfelse>
	<a href="?module=forum&action=forum&viewThreads=1&roomID=#roomID#&CURRENTPage=#CurrentPage#">Expand Threads</a>
	</cfif>
	&nbsp;| &nbsp;<a href="?module=forum&action=new&roomID=#roomID#">Post A New Message</a>&nbsp; |
</cfif>
	&nbsp;<a href="?module=forum&action=search&roomID=#roomID#">Search the Forum</a>&nbsp;</font>
</td></tr></table>
</td></tr></table>
<hr size=1 noshade>
</cfoutput>
--->
</cfoutput>