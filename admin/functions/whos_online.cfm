
<table width="170" border="0" align="center" cellpadding="0" cellspacing="0" style="border: 1px solid #6C7A83;">
  <tbody><tr>
	
	<td><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_left_nav_top.gif" height="11" width="170"></td>
	
  </tr>
  <tr>
	<td align="center" bgcolor="#ffffff">
		
		<table border="0" cellpadding="5" cellspacing="0" width="100%">
		  <tbody><tr>
			<td align="center" bgcolor="#E8F0F1" class="menuTD">
				<span class="menuCFAdminText">
				
Admins / Users Online </span>			</td>
		  </tr>
		<tr>
			<td class="menuTD" bgcolor="#ffffff"><cfif isDefined("Session.adminid")>
			<cfquery name="who_online" datasource="#datasrc#">
SELECT	*
FROM 	#table_admins#
where userid = '#Session.adminid#'
</cfquery>

<cfoutput query="who_online">
<!---For Debugging #Session.adminid# /--->

 <b>#who_online.name#</b>: <i>#who_online.username#</i><br>
  <!---<strong>Currently Browsing:</strong><br>
  #right(cgi.SCRIPT_NAME,22)#
  --->
   <hr>
</cfoutput>
</cfif>
<cflock scope="APPLICATION" type="EXCLUSIVE" timeout="10">
    <cfoutput>
         Total Active Sessions : #StructCount(Application.UsersInfo)#
    </cfoutput>
</cflock>
</td>
		</tr>
		</tbody></table>
		
		
		
  <tr>
	<td><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_left_nav_bottom.gif" height="11" width="170"></td>
  </tr>
</tbody></table>