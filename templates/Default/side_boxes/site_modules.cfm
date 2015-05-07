<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" colspan="2">Available Sections</td>
</tr>
<cfoutput>
    <cfloop query="left_modules">
     <cfif NOT isDefined('url.module') or #url.module# NEQ #module_directory#>
  <tr> <td width="7"><img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet.jpg" alt="#module_name#" width="7" height="12"> </td>
      <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=#module_directory#" class="menu_items">&nbsp;#module_name#</a></td>
  </tr>
     <cfelseif #url.module# EQ #module_directory#>
          <tr> <td width="7"><img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet_active.jpg" alt="#module_name#" width="7" height="12"> </td>
      <td>&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=#module_directory#" class="menu_items">&nbsp;#module_name#</a></b></td>
  </tr>       
  </cfif>
  </cfloop>
  </cfoutput>
</table>