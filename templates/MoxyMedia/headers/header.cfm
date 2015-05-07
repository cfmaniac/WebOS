<table border="0" cellpadding="0" cellspacing="0" width="780">
  <tr>
   <td colspan="3" rowspan="6" valign="bottom"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_head_logo.jpg" width="332" height="124" /></td>
   <td colspan="3" rowspan="2" align="center" valign="top">
    <cfif module_banners EQ "1">
    <cfinclude template="../../../#site_modules_dir#banners/index.cfm">
    </cfif><br />
    <cfif module_zipsearch EQ "1">
    <cfinclude template="../../../#site_modules_dir#zipsearch/zip_locate_form.cfm">
    </cfif>
    
    </td>
   <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>spacer.gif" width="1" height="14" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>spacer.gif" width="1" height="46" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="local_head_r3_c4" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_head_r3_c4.jpg" width="9" height="14" border="0" id="local_head_r3_c4" alt="" /></td>
   <td><img name="local_head_r3_c5" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_head_r3_c5.jpg" width="428" height="14" border="0" id="local_head_r3_c5" alt="" /></td>
   <td><img name="local_head_r3_c6" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_head_r3_c6.jpg" width="11" height="14" border="0" id="local_head_r3_c6" alt="" /></td>
   <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>spacer.gif" width="1" height="14" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="2" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_head_r4_c4.jpg"><img name="local_head_r4_c4" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_head_r4_c4.jpg" width="9" height="36" border="0" id="local_head_r4_c4" alt="" /></td>
   <td rowspan="2" valign="top" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_head_r4_c5.jpg"><cfif module_sitesearch EQ "1">
    <cfinclude template="../../../#site_modules_dir#sitesearch/index.cfm">
    </cfif>
    </td>
   <td rowspan="2" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_head_r4_c6.jpg"><img name="local_head_r4_c6" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_head_r4_c6.jpg" width="11" height="36" border="0" id="local_head_r4_c6" alt="" /></td>
   <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>spacer.gif" width="1" height="23" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>spacer.gif" width="1" height="13" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="local_head_r6_c4" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_head_r6_c4.jpg" width="9" height="14" border="0" id="local_head_r6_c4" alt="" /></td>
   <td><img name="local_head_r6_c5" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_head_r6_c5.jpg" width="428" height="14" border="0" id="local_head_r6_c5" alt="" /></td>
   <td><img name="local_head_r6_c6" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_head_r6_c6.jpg" width="11" height="14" border="0" id="local_head_r6_c6" alt="" /></td>
   <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>spacer.gif" width="1" height="14" border="0" alt="" /></td>
  </tr>
  <tr>
  <td height="27" colspan="6" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>breadcrumb_bg.jpg" class="breadcrumb_nav"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0"  class="breadcrumb_nav">
  <tr>
    <td width="50%" valign="middle" class="breadcrumb_nav"><cfif module_breadcrumbs EQ "1">
    <cfinclude template="../../../#site_modules_dir#/breadcrumbs/index.cfm">
    <cfelse>
    <!-- BreadCrumbs Module Not Loaded -->
    </cfif></td>
    <td width="50%" align="right" valign="middle" class="breadcrumb_nav">Today is: <cfoutput><b>#dateformat(now(), "mmmm dddd yyyy")#</b></cfoutput></td>
  </tr>
</table>
  </td>
  </tr>
</table>