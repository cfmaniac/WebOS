<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Style Sheet Administration">
<!---\\ Module Functions (add, edit, update, delete) Go here //--->
<CFPARAM name="row_color" default="1">
<cfif NOT isDefined('url.do')>
<CFPARAM name="do" default="m">
<cfelseif isDefined('url.do')>
<CFPARAM name="do" default="#url.do#">
</cfif>
<CFPARAM name="Delete" default="no">
<CFPARAM name="Update" default="none">
<CFPARAM name="Add" default="none">
<CFPARAM name="message" default="none">
<CFPARAM name="inPage" default="0">
<cfif isDefined('url.update_css') and #url.update_css# EQ "yes">
 <cfquery name="site_css" datasource="#datasrc#">
select * from #table_config# where configuration_key ='site_style_sheet'
</cfquery>
<cffile action="write" file="#GetTempDirectory()##site_css.configuration_value#" output="#form.site_css#">
<cffile action ="move" source = "#GetTempDirectory()##site_css.configuration_value#" destination = "#site_location#templates\#site_template#\assets\styles\" nameconflict="overwrite">
<cflocation url="styles_admin.cfm?msg=Successfully Updated Site CSS" addtoken="no">
</cfif>
<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<cfif ListFindNoCase("#allusers#", session.permissions, ",")>
<style type="text/css">
<!--
.style1 {
	font-size: 11px;
	font-weight: bold;
}
-->
</style>
<!--- BEGINNING OF YOUR CONTENT --->
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1"><cfoutput>#attributes.page#</cfoutput></span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" valign="top"><img src="assets/modules/modules_styles.jpg" alt="WebOS Site Configuration" width="100" height="100" /></td>
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can edit your site's stylesheet.<br />
    <br />
 <cfif isDefined('url.msg')>
 <cfoutput>#url.msg#</cfoutput>
 </cfif>
    <hr width="95%" align="center"/>
       <cfquery name="site_css" datasource="#datasrc#">
select * from #table_config# where configuration_key ='site_style_sheet'
</cfquery>
    <cfhttp url="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir##site_styles_dir##site_css.configuration_value#" method="get">
   <cfset site_css = #cfhttp.FileContent#>
   <cfoutput>
   <form name="edit_site_css" action="?update_css=yes" method="post">
      
   <textarea style="width:575px; height: 375px;" name="site_css">#site_css#</textarea><br />
   <input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" />
   </form>
   </cfoutput>
    <cfelseif do EQ "a">
    
    <cfelseif do EQ "e">
    
    <cfelseif do EQ "d">
    
    </cfif>    </td>
    </tr>
</table></td>
</tr>
</table></td>
   <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
   
  </tr>
  <tr>
   <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c1" alt="" /></td>
   <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
   <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c3" alt="" /></td>
   
  </tr>
</table>
<!--- END OF YOUR CONTENT --->
<cfelse>
You are not authorized to view this page.
</cfif>
</cf_headfoot>