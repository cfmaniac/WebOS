<!---
 Mod By : AP
 Mod : SiteID to Query's Where Clause
--->
<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Side Boxes Administration">
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
<cfif isDefined('url.do') and #url.do# EQ "edit_boxes">
<cfquery name="site_boxes" datasource="#datasrc#">
Update #table_sideboxes# SET side_box_filename ='#form.side_box_filename#', side_box_column='#form.side_box_column#', <cfif isDefined('form.side_box_active')>side_box_active='#form.side_box_active#',<cfelseif NOT isDefined('form.side_box_active')>side_box_active='0',</cfif>side_box_position='#form.side_box_position#' where side_box_id='#form.side_box_id#'
</cfquery>

<cflocation url="boxes_admin.cfm?msg=Successfully Updated Site CSS" addtoken="no">
</cfif>

<cfif isdefined('url.do') and url.do EQ "add_box">
<cfquery name="new_box" datasource="#datasrc#">
INSERT into #table_sideboxes# (side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position, siteID) VALUES ('#form.side_box_name#', '#form.side_box_filename#', '#form.side_box_column#',<cfif isDefined('form.side_box_active')>'#form.side_box_active#',<cfelseif NOT isDefined('form.side_box_active')>'0',</cfif>'#form.side_box_position#', <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">) 
</cfquery>
<cflocation url="boxes_admin.cfm?msg=Successfully Updated Site CSS" addtoken="no">
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
    <td width="100" valign="top"><img src="assets/modules/modules_boxes.jpg" alt="WebOS Site Configuration" width="100" height="100" /><Br /> 
    <cfif do EQ "a">
    <b><a href="?do=a">Add a New Sidebox</a></b><br /><Br />
    <a href="?do=m">Return to Main</a>
    <cfelse>
    <a href="?do=a">Add a New Sidebox</a>
    </cfif>
    </td>
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can edit your site's sideboxes and positions.<br />
    <br />
 <cfif isDefined('url.msg')>
 <cfoutput>#url.msg#</cfoutput>
 </cfif>
    <hr width="95%" align="center"/>
       <cfquery name="site_boxes" datasource="#datasrc#">
select * from #table_sideboxes# where siteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#"> Order by side_box_position ASC
</cfquery>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr align="center" bgcolor="#9CB6DE">
     <td width="7%" align="left" bgcolor="#E2E6E7">&nbsp;</td>
<td width="14%" align="left" bgcolor="#E2E6E7"><strong><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Side Box Name</font></span></strong></td>
<td width="26%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>SideBox Filename</strong></font></span></td>
<td width="38%" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Position</font></strong></td>
<td width="15%" height="25" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Column</strong></font></span></td>
<td width="15%" bgcolor="#E2E6E7">&nbsp;</td>
   </tr>
<cfoutput query="site_boxes">
<form name="#side_box_name#" action="?do=edit_boxes" method="post">
<input type="hidden" name="side_box_id" value="#side_box_id#" />
 <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
   <td align="left" valign="top">
   <input name="side_box_active" type="checkbox" value="1"<cfif #side_box_active# EQ "1">  checked</cfif> onchange="document.sidebox_#side_box_name#.submit();"/>    </td>
    <td align="left" valign="top">#side_box_name#</td>
    <td align="left" valign="top"><input type="text" name="side_box_filename" value="#side_box_filename#" /></td>
    <td align="center" valign="top"><input name="side_box_position" type="text" value="#side_box_position#" size="3" maxlength="5" /></td>
    <td align="left" valign="top"><select name="side_box_column" size="1">
      <option value="left" <cfif #side_box_column# EQ "left">selected</cfif>>Left Column</option>
      <option value="right" <cfif #side_box_column# EQ "right">selected</cfif>>Right Column</option>
      &nbsp;
    </select></td>
    <td align="left" valign="top"><input type="image" name="Submit" id="Submit" src="assets/icons/active_template.gif" /></td>
 </tr>
  </form>
   <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
</cfoutput>
</table>

    <cfelseif do EQ "a">
    <form name="add_box" method="post" action="?do=add_box">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr align="center" bgcolor="#9CB6DE">
     <td width="4%" align="left" bgcolor="#E2E6E7">&nbsp;</td>
<td width="14%" align="left" bgcolor="#E2E6E7"><strong><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Side Box Name</font></span></strong></td>
<td width="22%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>SideBox Filename</strong></font></span></td>
<td width="33%" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Position</font></strong></td>
<td width="13%" height="25" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Column</strong></font></span></td>
<td width="14%" bgcolor="#E2E6E7">&nbsp;</td>
   </tr>
    <tr bgcolor="#efefef">
   <td align="left" valign="top">
   <input name="side_box_active" type="checkbox" value="1"/>    </td>
    <td align="left" valign="top"><input type="text" name="side_box_name"/></td>
    <td align="left" valign="top"><input type="text" name="side_box_filename"/></td>
    <td align="center" valign="top"><input name="side_box_position" type="text" size="3" maxlength="5" /></td>
    <td align="left" valign="top"><select name="side_box_column" size="1">
      <option value="left" >Left Column</option>
      <option value="right" >Right Column</option>
      &nbsp;
    </select></td>
    <td align="left" valign="top"><input type="image" name="Submit" id="Submit" src="assets/icons/active_template.gif" /></td>
 </tr>
</table>

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