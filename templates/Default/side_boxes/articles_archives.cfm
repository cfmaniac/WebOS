<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" colspan="2">Article Archives</td>
</tr>
<cfoutput>
    <cfloop query="GetArticles_Archived">
    <cfif isDefined('url.archive_id') and #url.archive_id# EQ #article_id#>
    <tr> <td width="7"><img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet_active.jpg" alt="article_archives" width="7" height="12"> </td>
      <td>&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=articles&section=archives&archive_id=#article_id#" class="menu_items">&nbsp;#article_title#</a></b></td>
  </tr> 
    <cfelse>
          <tr> <td width="7"><img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet.jpg" alt="article_archives" width="7" height="12"> </td>
      <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=articles&section=archives&archive_id=#article_id#" class="menu_items">&nbsp;#article_title#</a></td>
  </tr>     
  </cfif>  
  </cfloop>
  </cfoutput>
</table>