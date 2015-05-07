<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" colspan="2">Our Site's Pages</td>
  </tr>
   <cfif NOT isDefined('url.module')>
   <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm" class="menu_items">&nbsp;Home</a></b></td>
  </tr>
  <cfelse> 
  <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm" class="menu_items">&nbsp;Home</a></td>
  </tr>
  </cfif>
  <cfif module_inquiry EQ "1">
     <cfif isDefined('url.module') and #url.module# EQ "inquiry">
        <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="Home" width="7" height="12"> </td>
      <td><b>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=inquiry" class="menu_items">&nbsp;Contact Us</a></b></td>
  </tr>
      <cfelse>
       <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Home" width="7" height="12"> </td>
      <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=inquiry" class="menu_items">&nbsp;Contact Us</a></td>
  </tr>  
      </cfif>
  </cfif>
   
    <cfoutput>
    <cfloop query="pages_menu">
     <cfif NOT isDefined('url.pageid') or #url.pageid# NEQ #page_id#>
  <tr> <td width="7"><img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet.jpg" alt="#page_title#" width="7" height="12"> </td>
      <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=pages&pageid=#page_id#" class="menu_items">&nbsp;#page_title#</a></td>
  </tr>
     <cfelseif #url.pageid# EQ #page_id#>
          <tr> <td width="7"><img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet_active.jpg" alt="#page_title#" width="7" height="12"> </td>
      <td>&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=pages&pageid=#page_id#" class="menu_items">&nbsp;#page_title#</a></b></td>
  </tr>   
  </cfif>
  </cfloop>
  </cfoutput> 
  <cfif module_sitemap EQ "1">
     <cfif isDefined('url.module') and #url.module# EQ "sitemap">
        <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="SiteMap" width="7" height="12"> </td>
      <td><b>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=sitemap&view=map" class="menu_items">&nbsp;Sitemap</a></b></td>
  </tr>
      <cfelse>
       <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Sitemap" width="7" height="12"> </td>
      <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=sitemap&view=map" class="menu_items">&nbsp;SiteMap</a></td>
  </tr>  
      </cfif>
      </cfif>
</table>
