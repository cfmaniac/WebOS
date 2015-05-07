
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" colspan="2">Did You Know...</td>
</tr>
  <tr>
    <td height="25" align="center" colspan="2">
    <cfif #con_dyks.dyk_available# EQ "1">
<cfoutput query="get_dyks">
    #dyk_content#<br>
     <cfset views = NumberFormat(#con_dyks.dyk_views#) + 1>
    <cfquery name="views" datasource="#datasrc#">
    update #table_dyk_content# SET dyk_views = <cfqueryPARAM value = "#views#"
   CFSQLType = "CF_SQL_VARCHAR"> where dyk_id = <cfqueryPARAM value = "#con_dyks.dyk_id#"
   CFSQLType = "CF_SQL_INTEGER">
    </cfquery>
    </cfoutput>
</cfif></td>
  </tr>
</table>
