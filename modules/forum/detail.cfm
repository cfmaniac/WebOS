<CFQUERY datasource=#datasrc# name=detail>
SELECT * FROM #table_forum_entries# WHERE EntryID = #EntryID#
</cfquery>

<CFQUERY datasource=#datasrc# name=list cachedwithin="#CreateTimeSpan(0,0,QueryCacheTime,0)#">
SELECT ThreadCount,ThreadEnd, EntryID, PostNum, Author, CreateDate, Title,Thread FROM #table_forum_entries# WHERE PostNum = #PostNum# ORDER BY Thread
</cfquery>
<CFOUTPUT query=detail>

<table border="0" cellspacing="0" cellpadding="0" width="100%"><tr><td bgcolor="000000">
<table width="100%" border="0" cellspacing="1" cellpadding="2">
	<tr>
		<td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="breadcrumb_nav">Topic: <b>#Title#</b></font></td>
	</tr>
	<tr bgcolor="FFFFFF">
		<td valign="MIDDLE">
<br>
Name: <b>#Author#</b> (<a href="mailto:#email#">#Email#</a>) #DateFormat(CreateDate,'mm/dd/yyyy')#<br><br>
#ParagraphFormat(Message)#
</font>
		</td>
	</tr>
</table>
</td>	</tr>
</table>
</CFOUTPUT>
<cfoutput>
<br>
<table cellspacing="0" cellpadding="1"  width=100% border=0><tr><td align="CENTER" bgcolor="black">
	<table border="0" cellspacing="0" cellpadding="0" width=100%>
		<tr >
			<td height="25" align="left" valign="left" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="breadcrumb_nav">&nbsp;Topics </font></td>
			<td height="25" align="left" valign="left" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="breadcrumb_nav">Posted by</font></td>
			<td height="25" align="left" valign="left" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="breadcrumb_nav">Date</font></td>
		</tr>
		<tr bgcolor="black"><td colspan=3></td></tr>
</cfoutput>

<cfoutput query=list>
		<cfif Thread eq 1>
			<tr <CFIF CurrentRow MOD 2 eq 1>bgcolor="white"<CFELSE>bgcolor="##eeeeee"</cfif> ><td height="20" valign=middle nowrap>&nbsp;<cfif EntryID eq Url.EntryID><b>#Title#</b><cfelse><a href="?module=forum&action=detail&PostNum=#PostNum#&Thread=#Thread#&roomID=#roomID#&entryID=#EntryID#">#title#</a></cfif>
			(Current Posts: #ThreadCount#)
			</td>
			<td height=13 valign=middle>#Author#&nbsp;</td>
			<td height=13 valign=middle>#DateFormat(CreateDate,'mm/dd/yyyy')# <!--- #TimeFormat(Date,'h:MM tt')# ---></td>
			</tr>

		<cfelse>
			  <tr <cfif #CurrentRow# MOD 2 eq 1>bgcolor="white"<CFELSE>bgcolor="##eeeeee"</cfif>>
					<td height="13" valign="MIDDLE" nowrap><img src="#ImagePath##IIF(ThreadEnd,DE('l.gif'),DE('t.gif'))#" align="TOP" width=20 height=20 border=0><cfif EntryID eq Url.EntryID><b>#Title#</b><cfelse><a href="?module=forum&action=detail&PostNum=#PostNum#&Thread=#Thread#&roomID=#roomID#&entryID=#EntryID#">#title#</a></cfif>
				</td>
				<td>#Author#&nbsp;</td>
				<td>#DateFormat(CreateDate,'mm/dd/yyyy')#</td>
				</tr> 
		</cfif>
	
</cfoutput>

</td></tr></table>
</td></tr></table>


</center>
<CFOUTPUT>
<form name="form" action="#SubmitAlias#" method="POST" onSubmit="return checkFields();">

<input type="Hidden" name="postnum" value="#detail.PostNum#">
<input type="hidden" name="action" value="reply">
<input type="hidden" name="RoomID" value="#RoomID#">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td bgcolor="black">
			<table width="100%" border="0" cellspacing="1" cellpadding="2">
				<tr bgcolor="##eeeeee">
					<td height="25" align="left" valign="left" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="breadcrumb_nav">
						Reply To This Topic</font>
					</td>
				</tr>
				<tr bgcolor="white">
					<td width="100%" colspan="2" valign="MIDDLE" nowrap>
						<font face="Verdana,Helvetica,Arial" size="1" color="##eeeeee">
						<table cellspacing="0" cellpadding="2" border=0 width=100%>
							<tr>
								<td valign="TOP"><FONT face = "Verdana,Helvetica,Arial" size="1">Name:</font></td>
								<td><input type="Text" name="author" size=30 maxlength=50 value=""></td>
							</tr>
							<tr>
								<td valign="TOP"><FONT face = "Verdana,Helvetica,Arial" size="1">Email:</font></td>
								<td><input type="Text" name="email" size=30 maxlength=100 value=""></td>
							</tr>
							<tr>
								<td valign="TOP"><FONT face = "Verdana,Helvetica,Arial" size=1>Topic:</font></td>
								<td><input type="Text" name="title" size="30" maxlength="50"></font></td>
							</tr>
							<tr>
								<td valign="TOP"><FONT face = "Verdana,Helvetica,Arial" size=1>Body:</font></td>
								<td><textarea name="message" cols=60 rows=8 wrap="VIRTUAL"></textarea></font></td>
							</tr>
							<tr>
								<td colspan=2 align="RIGHT" valign="MIDDLE"><input type="Submit" name="submit" value=" Post Reply " align="Left">&nbsp;&nbsp;<input type="Hidden" name="hide" value="#Detail.Author# wrote:
-------------------------------
#REReplace(Detail.Message,'<[^>]*','','ALL')#"><input type="Button" name="quote" value="Quote Text" onClick="this.form.message.value=this.form.message.value + this.form.hide.value;">&nbsp;</td>
							</tr>
						</table>
						</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form></center>
</cfoutput>
