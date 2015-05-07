<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="300" height="100"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>web_os.jpg" width="300" height="100" /></td>
    <td>Welcome to <cfoutput>#site_name#</cfoutput><br />
    <cfif module_sitesearch EQ "1">
    <cfinclude template="../../../#site_modules_dir#sitesearch/index.cfm">
    </cfif>
    <br />
    <cfif module_banners EQ "1">
    <cfinclude template="../../../#site_modules_dir#banners/index.cfm">
    </cfif>
    </td>
  </tr>
  <tr>
    <td height="2" colspan="2" >&nbsp;</td>
  </tr>
  <tr>
    <td height="25" colspan="2" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="breadcrumb_nav">
	<cfif module_breadcrumbs EQ "1">
    <cfinclude template="../../../#site_modules_dir#/breadcrumbs/index.cfm">
    <cfelse>
    <!-- BreadCrumbs Module Not Loaded -->
    </cfif></td>
    </tr>
  <tr>
    <td height="2" colspan="2" >&nbsp;</td>
  </tr>
</table>