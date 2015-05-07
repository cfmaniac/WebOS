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
<cfif isdefined('url.update_mod') and #url.update_mod# EQ "Yes">
<cftransaction>
<cfquery name="is_new_mod" datasource="#datasrc#">
select module_directory from #table_mods# where module_directory ='#form.directory#' 
</cfquery>
   <cfif #is_new_mod.module_directory# EQ #form.directory#>
   <!---\\The Mmodule is installed and is not a new module//--->
   <cfquery name="adjust_mod" datasource="#datasrc#">
UPDATE #table_mods# SET module_installed =<cfif isDefined('form.module_installed')>'1'<cfelseif NOT isDefined('form.module_installed')>'0'</cfif> where module_directory = '#form.directory#'
   </cfquery>
   <cfelseif #is_new_mod.module_directory# NEQ #form.directory#>
   <h2>New Module Installation</h2>
   <form name="new_mod" action="modules.cfm?install_mod=yes" method="post">
   <input type="hidden" name="module_directory" value="<cfoutput>#form.directory#</cfoutput>">
   What is the Name of this Module? <input type="text" name="module_name" /><br />
   Please insert a Description for this module: <input type="text" name="module_description" /><br />
Does this module have an Administration Panel? <input type="radio" name="module_admin" value="1" />Yes <input type="radio" name="module_admin" value="0" />No<br />
<a href="#" onclick="document.new_mod.submit();"> Continue</a>
</form>
     </cfif>
</cftransaction>
<cfelseif isDefined('url.install_mod') and #url.install_mod# EQ "yes">
<cfquery name="install_new_mod_and_adjust" datasource="#datasrc#">
INSERT INTO #table_mods# (module_name, module_description, module_installed, module_directory, module_admin) VALUES ('#form.module_name#', '#form.module_description#', '1', '#form.module_directory#', '#form.module_admin#')
</cfquery>
<h2>Module Installed...</h2>
<cflocation url="modules.cfm" addtoken="no">
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
    <td width="100" valign="top"><img src="assets/modules/modules_modules.jpg" alt="WebOS Site Configuration" width="100" height="100" /></td>
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can dynamically enable/disable (or install/un-install) Modules on your WebOS installation.<br />
    <br />
    If you see that a Check Mark is Checked, the Module is enabled on the website.<br />
    <br />
   <!---\\ Default Display //--->
    <cfdirectory directory="#ExpandPath("../modules/")#" action="list" name="mods">
    <cfquery name="modules" datasource="#datasrc#">
select * from #table_mods# where module_directory='#mods.name#'
</cfquery>
    <hr width="95%" align="center"/>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr align="center" bgcolor="#9CB6DE">
     <td width="7%" align="left" bgcolor="#E2E6E7">&nbsp;</td>
<td width="14%" align="left" bgcolor="#E2E6E7"><strong><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Directory</font></span></strong></td>
<td width="26%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Module Name</strong></font></span></td>
<td width="38%" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Module Description</font></strong></td>
<td width="15%" height="25" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Actions</strong></font></span></td>
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