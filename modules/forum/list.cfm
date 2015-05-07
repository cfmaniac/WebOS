<cfsetting enablecfoutputonly="Yes" >
<cfquery name="listPages" datasource="#datasrc#"  >
	SELECT EntryID, RoomID,Author, Thread, CreateDate,Title,ThreadCount, PostNum FROM #table_forum_entries#  WHERE RoomID = <cfif MultiRoom>#RoomID#<cfelse>1</cfif> AND Thread = 1
	ORDER BY PostNum desc, Thread Asc
</cfquery>

<cfquery name="getMaxPostNum" datasource="#datasrc#" >
	SELECT Max(PostNum) as maxPostNum FROM #table_forum_entries#
</cfquery>



<cfoutput> <b>Result Pages:</b> </cfoutput>
	
	<cfset pages = Ceiling(ListPages.RecordCount / MaxDisplay)>
	<cfloop index="count" from="1" to="#pages#" step="1">
		 <cfoutput><cfif CurrentPage  neq count> <a href="?module=forum&action=forum&CURRENTPage=#count#&roomID=#roomID#">#Count#</a> |<CFELSE> <b>#Count#</b> | </CFIF></cfoutput>
	</cfloop>
	<cfif CurrentPage LT Pages>
			<cfoutput> <a href="?module=forum&action=forum&CURRENTPage=#Evaluate(currentpage+1)#&roomID=#roomID#">Next Page&##187;</a></cfoutput>
	</cfif>
<cfoutput>
<br><br>
	<table cellspacing="0" cellpadding="1"  width=100% border=0><tr><td align="CENTER" bgcolor="black">
	<table border="0" cellspacing="0" cellpadding="0" width=100%>
		<tr>
			<td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" >&nbsp;Topics </font></td>
			<td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" >Posted by</font></td>
			<td height="25" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" >Date</font></td>
		</tr>
		<tr bgcolor="black"><td colspan=3></td></tr>
</cfoutput>

<cfif ViewThreads OR Flush>

	<cfif CurrentPage eq 1>
		<cfoutput query="listpages" startrow="#Evaluate(MaxDisplay)#" maxrows="1">
			<cfset EndPostNum = PostNum>
		</cfoutput>
		<cfset PostNum = getMaxPostNum.maxPostNUm>
	<cfelse>
		<cfoutput query="listpages" startrow="#Evaluate(CurrentPage*MaxDisplay)#" maxrows="1">
			<cfset EndPostNum = PostNum>
		</cfoutput>
		<cfoutput query="listpages" startrow="#Evaluate((CurrentPage-1)*MaxDisplay+1)#" maxrows="1">
			<cfset PostNum = PostNum>
		</cfoutput>
	</cfif>
		<cfquery name="list" datasource="#datasrc#" >
		SELECT PostNum, Thread, Author, CreateDate, Title, EntryID, ThreadCount, ThreadEnd FROM #table_forum_entries#  WHERE RoomID = <cfif MultiRoom>#RoomID#<cfelse>1</cfif> AND PostNum BETWEEN 0 AND #EndPostNum#
		ORDER BY PostNum desc, Thread Asc
		</cfquery>
	
	
	<cfloop query="list">
		<cfoutput>
		<cfif Thread eq 1>
			<tr <CFIF CurrentRow MOD 2 eq 1>bgcolor="white"<CFELSE>bgcolor="##eeeeee"</cfif> ><td height="20" valign=middle nowrap>&nbsp;<a href="?module=forum&action=detail&PostNum=#PostNum#&Thread=#Thread#&roomID=#roomID#&entryID=#EntryID#">#title#</a>
			(#ThreadCount#)
			</td>
			<td height=13 valign=middle>#Author#&nbsp;</td>
			<td height=13 valign=middle>#DateFormat(CreateDate,'mm/dd/yyyy')#</td>
			</tr>

		<cfelse>
			  <tr <cfif #CurrentRow# MOD 2 eq 1>bgcolor="white"<CFELSE>bgcolor="##eeeeee"</cfif>>
					<td height="13" valign="MIDDLE" nowrap><img src="#ImagePath##IIF(ThreadEnd,DE('l.gif'),DE('t.gif'))#" align="TOP" width=20 height=20 border=0><a href="?module=forum&action=detail&PostNum=#PostNum#&Thread=#Thread#&entryID=#EntryID#&roomID=#RoomID#">#title#</a>
				</td>
				<td>#Author#&nbsp;</td>
				<td>#DateFormat(CreateDate,'mm/dd/yyyy')#</td>
				</tr> 
		</cfif>
		</cfoutput>
	</cfloop>
<cfelse>
	<cfoutput query="listPages" startrow="#Evaluate(CurrentPage*MaxDisplay-MaxDisplay+1)#" maxrows="#MaxDisplay#">
	<tr <CFIF CurrentRow MOD 2 eq 1>bgcolor="white"<CFELSE>bgcolor="##eeeeee"</cfif> ><td height="20" valign=middle nowrap>&nbsp;<a href="?module=forum&action=detail&PostNum=#PostNum#&Thread=#Thread#&roomID=#roomID#&entryID=#EntryID#">#title#</a>
			(Current Posts: #ThreadCount#)
			</td>
			<td height=13 valign=middle>#Author#&nbsp;</td>
			<td height=13 valign=middle>#DateFormat(CreateDate,'mm/dd/yyyy')#</td>
	</tr>
	</cfoutput>
</cfif>
<cfoutput>
</td></tr></table>
</td></tr></table>
<br>
	
	<b>Result Pages:</b> <cfloop index="count" from="1" to="#pages#" step="1"> <CFIF CurrentPage  neq count> <a href="?module=forum&action=forum&CURRENTPage=#count#&startRow=#Evaluate(count*MaxDisplay-MaxDisplay+1)#&roomID=#roomID#">#Count#</a> | <CFELSE><b>#Count#</b> | </CFIF></cfloop>
	<cfif CurrentPage LT Pages>
					<a href="?module=forum&action=forum&CURRENTPage=#Evaluate(currentpage+1)#&startRow=#Evaluate((currentPage+1)*MaxDisplay-MaxDisplay)#&roomID=#roomID#">Next Page >></a>
	</cfif>
<br><br>
<cfquery name="version" datasource="#datasrc#">
select configuration_value from #table_config# where configuration_key ='webos_version'
</cfquery>
<div align="right">Powered By WebOS Forums #version.configuration_value#</div>
</cfoutput>
<cfsetting enablecfoutputonly="NO" >