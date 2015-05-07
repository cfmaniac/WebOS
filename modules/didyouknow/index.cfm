<!---\\ Module Configuration //--->
<cfset module ="#module#">
<!---\\ End of Module Configuration //---->
<cfif #con_dyks.dyk_available# EQ "1">
<!---\\DYK FOR EVERYWHERE//--->
<cfoutput query="get_dyks">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="45"><img name="dyk_module_layout_r1_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c1.jpg" width="45" height="35" border="0" id="dyk_module_layout_r1_c2" alt="" /></td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c2.jpg"><b>Did you know... #dyk_title#</b></td>
    <td width="24"><img name="dyk_module_layout_r1_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c3.jpg" width="24" height="35" border="0" id="dyk_module_layout_r1_c4" alt="" /></td>
  </tr>
  <tr>
    <td><img name="dyk_module_layout_r2_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c1.jpg" width="45" height="22" border="0" id="dyk_module_layout_r2_c2" alt="" /></td>
  <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c2.jpg"> <b>#dyk_title#</b></td>
    <td><img name="dyk_module_layout_r2_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c3.jpg" width="24" height="22" border="0" id="dyk_module_layout_r2_c4" alt="" /></td>
  </tr>
  <tr>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r3_c1.jpg">&nbsp;</td>
    <td>
    #dyk_content#<br>
     <cfset views = NumberFormat(#con_dyks.dyk_views#) + 1>
    <cfquery name="views" datasource="#datasrc#">
    update #table_dyk_content# SET dyk_views = <cfqueryPARAM value = "#views#"
   CFSQLType = "CF_SQL_VARCHAR"> where dyk_id = <cfqueryPARAM value = "#con_dyks.dyk_id#"
   CFSQLType = "CF_SQL_INTEGER">
    </cfquery>
    </td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r3_c3.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td><img name="dyk_module_layout_r4_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c1.jpg" width="45" height="29" border="0" id="dyk_module_layout_r4_c2" alt="" /></td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c2.jpg">&nbsp;</td>
    <td><img name="dyk_module_layout_r4_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c3.jpg" width="24" height="29" border="0" id="dyk_module_layout_r4_c4" alt="" /></td>
  </tr>
</table>
</cfoutput>
<cfelseif #con_dyks.dyk_available# EQ "2">
<!---\\DYK FOR PAGES ONLY//--->
<cfoutput query="get_page_dyks">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="45"><img name="dyk_module_layout_r1_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c1.jpg" width="45" height="35" border="0" id="dyk_module_layout_r1_c2" alt="" /></td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c2.jpg"><b>Did you know... #dyk_title#</b></td>
    <td width="24"><img name="dyk_module_layout_r1_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c3.jpg" width="24" height="35" border="0" id="dyk_module_layout_r1_c4" alt="" /></td>
  </tr>
  <tr>
    <td><img name="dyk_module_layout_r2_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c1.jpg" width="45" height="22" border="0" id="dyk_module_layout_r2_c2" alt="" /></td>
  <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c2.jpg"> <b>#dyk_title#</b></td>
    <td><img name="dyk_module_layout_r2_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c3.jpg" width="24" height="22" border="0" id="dyk_module_layout_r2_c4" alt="" /></td>
  </tr>
  <tr>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r3_c1.jpg">&nbsp;</td>
    <td>
    #dyk_content#<br>
     <cfset views = NumberFormat(#con_dyks.dyk_views#) + 1>
    <cfquery name="views" datasource="#datasrc#">
    update #table_dyk_content# SET dyk_views = <cfqueryPARAM value = "#views#"
   CFSQLType = "CF_SQL_VARCHAR"> where dyk_id = <cfqueryPARAM value = "#con_dyks.dyk_id#"
   CFSQLType = "CF_SQL_INTEGER">
    </cfquery>
    </td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r3_c3.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td><img name="dyk_module_layout_r4_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c1.jpg" width="45" height="29" border="0" id="dyk_module_layout_r4_c2" alt="" /></td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c2.jpg">&nbsp;</td>
    <td><img name="dyk_module_layout_r4_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c3.jpg" width="24" height="29" border="0" id="dyk_module_layout_r4_c4" alt="" /></td>
  </tr>
</table>
</cfoutput>
<cfelseif #con_dyks.dyk_available# EQ "3">
<!---\\DYK FOR Articles ONLY//--->
<cfoutput query="get_article_dyks">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="45"><img name="dyk_module_layout_r1_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c1.jpg" width="45" height="35" border="0" id="dyk_module_layout_r1_c2" alt="" /></td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c2.jpg"><b>Did you know... #dyk_title#</b></td>
    <td width="24"><img name="dyk_module_layout_r1_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c3.jpg" width="24" height="35" border="0" id="dyk_module_layout_r1_c4" alt="" /></td>
  </tr>
  <tr>
    <td><img name="dyk_module_layout_r2_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c1.jpg" width="45" height="22" border="0" id="dyk_module_layout_r2_c2" alt="" /></td>
  <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c2.jpg"> <b>#dyk_title#</b></td>
    <td><img name="dyk_module_layout_r2_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c3.jpg" width="24" height="22" border="0" id="dyk_module_layout_r2_c4" alt="" /></td>
  </tr>
  <tr>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r3_c1.jpg">&nbsp;</td>
    <td>
    #dyk_content#<br>
     <cfset views = NumberFormat(#con_dyks.dyk_views#) + 1>
    <cfquery name="views" datasource="#datasrc#">
    update #table_dyk_content# SET dyk_views = <cfqueryPARAM value = "#views#"
   CFSQLType = "CF_SQL_VARCHAR"> where dyk_id = <cfqueryPARAM value = "#con_dyks.dyk_id#"
   CFSQLType = "CF_SQL_INTEGER">
    </cfquery>
    </td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r3_c3.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td><img name="dyk_module_layout_r4_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c1.jpg" width="45" height="29" border="0" id="dyk_module_layout_r4_c2" alt="" /></td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c2.jpg">&nbsp;</td>
    <td><img name="dyk_module_layout_r4_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c3.jpg" width="24" height="29" border="0" id="dyk_module_layout_r4_c4" alt="" /></td>
  </tr>
</table>
</cfoutput>
<cfelseif #con_dyks.dyk_available# EQ "4">
<!---\\DYK FOR PAGES & Articles ONLY//--->
<cfoutput query="get_pagart_dyks">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="45"><img name="dyk_module_layout_r1_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c1.jpg" width="45" height="35" border="0" id="dyk_module_layout_r1_c2" alt="" /></td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c2.jpg"><b>Did you know... #dyk_title#</b></td>
    <td width="24"><img name="dyk_module_layout_r1_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c3.jpg" width="24" height="35" border="0" id="dyk_module_layout_r1_c4" alt="" /></td>
  </tr>
  <tr>
    <td><img name="dyk_module_layout_r2_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c1.jpg" width="45" height="22" border="0" id="dyk_module_layout_r2_c2" alt="" /></td>
  <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c2.jpg"> <b>#dyk_title#</b></td>
    <td><img name="dyk_module_layout_r2_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c3.jpg" width="24" height="22" border="0" id="dyk_module_layout_r2_c4" alt="" /></td>
  </tr>
  <tr>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r3_c1.jpg">&nbsp;</td>
    <td>
    #dyk_content#<br>
     <cfset views = NumberFormat(#con_dyks.dyk_views#) + 1>
    <cfquery name="views" datasource="#datasrc#">
    update #table_dyk_content# SET dyk_views = <cfqueryPARAM value = "#views#"
   CFSQLType = "CF_SQL_VARCHAR"> where dyk_id = <cfqueryPARAM value = "#con_dyks.dyk_id#"
   CFSQLType = "CF_SQL_INTEGER">
    </cfquery>
    </td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r3_c3.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td><img name="dyk_module_layout_r4_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c1.jpg" width="45" height="29" border="0" id="dyk_module_layout_r4_c2" alt="" /></td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c2.jpg">&nbsp;</td>
    <td><img name="dyk_module_layout_r4_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c3.jpg" width="24" height="29" border="0" id="dyk_module_layout_r4_c4" alt="" /></td>
  </tr>
</table>
</cfoutput>
<cfelseif #con_dyks.dyk_available# EQ "5">
<!---\\DYK FOR RSS FEEDS ONLY//--->
<cfoutput query="get_rss_dyks">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="45"><img name="dyk_module_layout_r1_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c1.jpg" width="45" height="35" border="0" id="dyk_module_layout_r1_c2" alt="" /></td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c2.jpg"><b>Did you know... #dyk_title#</b></td>
    <td width="24"><img name="dyk_module_layout_r1_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r1_c3.jpg" width="24" height="35" border="0" id="dyk_module_layout_r1_c4" alt="" /></td>
  </tr>
  <tr>
    <td><img name="dyk_module_layout_r2_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c1.jpg" width="45" height="22" border="0" id="dyk_module_layout_r2_c2" alt="" /></td>
  <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c2.jpg"> <b>#dyk_title#</b></td>
    <td><img name="dyk_module_layout_r2_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r2_c3.jpg" width="24" height="22" border="0" id="dyk_module_layout_r2_c4" alt="" /></td>
  </tr>
  <tr>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r3_c1.jpg">&nbsp;</td>
    <td>
    #dyk_content#<br>
     <cfset views = NumberFormat(#con_dyks.dyk_views#) + 1>
    <cfquery name="views" datasource="#datasrc#">
    update #table_dyk_content# SET dyk_views = <cfqueryPARAM value = "#views#"
   CFSQLType = "CF_SQL_VARCHAR"> where dyk_id = <cfqueryPARAM value = "#con_dyks.dyk_id#"
   CFSQLType = "CF_SQL_INTEGER">
    </cfquery>
    </td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r3_c3.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td><img name="dyk_module_layout_r4_c1" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c1.jpg" width="45" height="29" border="0" id="dyk_module_layout_r4_c2" alt="" /></td>
    <td background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c2.jpg">&nbsp;</td>
    <td><img name="dyk_module_layout_r4_c3" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/#site_assets_dir#dyk_module_layout_r4_c3.jpg" width="24" height="29" border="0" id="dyk_module_layout_r4_c4" alt="" /></td>
  </tr>
</table>
</cfoutput>
</cfif>