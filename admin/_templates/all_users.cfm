<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Modules Administration Page">
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
    <td width="100" valign="top"><img src="assets/modules/modules_modules.jpg" alt="WebOS Site Configuration" width="100" height="100" /></td>
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can dynamically enable/disable (or install/un-install) Modules on your WebOS installation.<br />
    <br />
    If you see that a Check Mark is Checked, the Module is installed.<br />
    <br />
    To Install a New Module, FTP into your site and upload the module folder to your site's '<i>modules</i>' directory, or use our <a href="module_installer.cfm"><b>Module Installer</b></a> and you should see it here.<!---\\ Default Display //--->
    <cfdirectory directory="#ExpandPath("../modules/")#" action="list" name="mods">
    <cfquery name="modules" datasource="#datasrc#">
select * from #table_mods# where module_directory='#mods.name#'
</cfquery>
    <hr width="95%" align="center"/>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr align="center" bgcolor="#9CB6DE">
     <td align="left" bgcolor="#E2E6E7">&nbsp;</td>
<td align="left" bgcolor="#E2E6E7"><strong><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Module Directory</font></span></strong></td>
<td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Module Name</strong></font></span></td>
<td width="9%" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Module Description</font></strong></td>
<td width="6%" height="25" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Actions</strong></font></span></td>
</tr>
<cfoutput query="mods">
 <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
   <td align="left" valign="top"><form name="module_#mods.name#" action="?update_mod=yes" method="post">
    <input type="hidden" name="directory" value="#mods.name#" />
    <cfquery name="modules" datasource="#datasrc#">
select * from #table_mods# where module_directory='#mods.name#'
</cfquery>
    <input name="module_installed" type="checkbox" value="1"<cfif #modules.module_installed# EQ "1">  checked</cfif> onchange="document.module_#mods.name#.submit();"/>
    </form></td>
    <td align="left" valign="top">#mods.name#</td>
    <td align="left" valign="top"><b>#modules.module_name#</b></td>
    <td align="left" valign="top">#modules.module_description#</td>
    <td align="left" valign="top"><cfif #modules.module_admin# EQ "1">
    <a href="module_#mods.name#.cfm">Module Administration</a>
    </cfif>
    </td>
  </tr>
   <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
</cfoutput>
</table>
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