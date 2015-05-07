
<CFIF Action is "search">
	<cfoutput>
	<FORM ACTION="#SubmitAlias#" METHOD="POST">
	
	<table cellspacing="0" cellpadding="1" border=0><tr><td align="CENTER" bgcolor="black">
	<table border="0" cellspacing="0" cellpadding="2" width="100%">
		<tr bgcolor="##eeeeee">
			<td height="20" valign="TOP" nowrap colspan=2>&nbsp;<b>Search</b></td>
		</tr>
			<tr bgcolor="black"><td colspan=2></td></tr>
	<tr bgcolor=white>
		<td>&nbsp;Text in Title</td>
		<td><INPUT TYPE="text" NAME="title" SIZE="40" MAXLENGTH="40"></td>
	</tr>
	<tr bgcolor=white>
		<td>&nbsp;Author</td>
		<td><INPUT TYPE="text" NAME="author" SIZE="20" MAXLENGTH="40"></td>
	</tr>
	<tr bgcolor=white>
		<td>&nbsp;Text in Message</td>
		<td><INPUT TYPE="text" NAME="message" SIZE="40" MAXLENGTH="40"></td>
	</tr>
	<tr bgcolor=white>
		<td colspan=2 align="right">	<INPUT TYPE="submit" VALUE="&nbsp;&nbsp;&nbsp;Search&nbsp;&nbsp;&nbsp;"></td>
	</tr>
	</td></tr></table>
	</td></tr></table><input type="hidden" name="action" value="searchReady">
	</FORM>
	</cfoutput>

<CFELSEIF Action is "SearchReady">

	<CFQUERY NAME="GetResults" DATASOURCE="#datasrc#" maxRows="#MaxSearchResultRows#">
	    SELECT EntryID, RoomID, PostNum, Author,Title,CreateDate,Thread, ThreadCount,ThreadEnd FROM #table_forum_entries#
	    WHERE 0=0
	       	
	    <CFIF Len(Title)>
	       AND Title LIKE '%#Title#%' 
	    </CFIF>
	
	    <CFIF Len(Author)>
	       AND Author LIKE '%#Author#%' 
	    </CFIF>
	
	    <CFIF Len(Message)>
	       AND Message LIKE '%#Message#%' 
	    </CFIF>
	    ORDER BY PostNum Desc
	</CFQUERY>
	
<cfoutput>
Search Results: #Getresults.RecordCount# matches found<br><br>
	<table cellspacing="0" cellpadding="1"  width=100% border=0><tr><td align="CENTER" bgcolor="black">
	<table border="0" cellspacing="0" cellpadding="0" width=100%>
		<tr bgcolor="##eeeeee">
			<td height="20" width=315 valign="middle" nowrap>&nbsp;Topics </font></td>
			<td height=20 width="175" valign="middle" nowrap>Posted by</font></td>
			<td height=20 width="100" valign="middle" nowrap>Date</font></td>
		</tr>
		<tr bgcolor="black"><td colspan=3></td></tr>
</cfoutput>	
	
	<cfoutput query="getResults">
	<tr <CFIF CurrentRow MOD 2 eq 1>bgcolor="white"<CFELSE>bgcolor="##eeeeee"</cfif> ><td height="20" valign=middle nowrap>&nbsp;<a href="?module=forum&action=detail&PostNum=#PostNum#&Thread=#Thread#&roomID=#roomID#&entryID=#EntryID#">#title#</a></td>
			<td height=13 valign=middle>#Author#&nbsp;</td>
			<td height=13 valign=middle>#DateFormat(CreateDate,'mm/dd/yyyy')# </td>
	</tr>
	</cfoutput>
		
	
	</td></tr></table>
	</td></tr></table>

</CFIF>

