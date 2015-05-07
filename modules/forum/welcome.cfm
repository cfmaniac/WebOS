<cfif multiRoom>
	<cfquery name="getRooms" datasource="#datasrc#" >
		SELECT * FROM #table_forum_rooms# where active='1'ORDER BY Title Asc
	</cfquery>

	<cfoutput>
	<table cellspacing="0" cellpadding="1"  width=100% border=0><tr><td align="CENTER" bgcolor="black">
	<table border="0" cellspacing="0" cellpadding="0" width=100%>
		<tr>
			<td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title">&nbsp;<b>Rooms</b> </font></td>
		</tr>
	</cfoutput>	
		
		<tr ><td align="left"></td></tr>
		<cfoutput query="getRooms">
		<tr <CFIF CurrentRow MOD 2 eq 1>bgcolor="white"<CFELSE>bgcolor="##eeeeee"</cfif> ><td height="20" valign=middle nowrap><a href="?module=forum&action=forum&roomID=#roomID#"><b>#title#</b></a> (Current Threads: #Threads#)<br />
       &nbsp;&nbsp; <i>#description#</i><br /><br />
		</td>
		</tr>
		</cfoutput>
		</table>
		</td></tr></table>
<cfelse>
	<cflocation url="?module=forum&action=forum">
</cfif>