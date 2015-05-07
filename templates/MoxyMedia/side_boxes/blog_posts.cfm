<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" colspan="2">Current Blog Posts</td>
</tr>
<cfoutput>
    <cfloop query="current_posts">
    <cfif isDefined('url.id') and #url.id# EQ #current_posts.blID#>
     <tr> <td width="7"><img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet.jpg" alt="Current Blog Posts" width="7" height="12"> </td>
      <td>&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=blog&dopost=yes&id=#current_posts.blID#&#current_posts.bltitle#" class="menu_items">&nbsp;#current_posts.bltitle#</a></b></td>
  </tr>   
    <cfelse>
          <tr> <td width="7"><img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet.jpg" alt="Current Blog Posts" width="7" height="12"> </td>
      <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=blog&dopost=yes&id=#current_posts.blID#&#current_posts.bltitle#" class="menu_items">&nbsp;#current_posts.bltitle#</a></td>
  </tr>  
  </cfif>     
  </cfloop>
  </cfoutput>
</table>