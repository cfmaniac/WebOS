<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Site Search Administration">
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

<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_analytics">
  UPDATE #table_analytics# SET analytics_key ='#form.analytics_key#' WHERE analytics_id ='#form.analytics_id#' 
			</CFQUERY>
  </CFTRANSACTION>
</cfif>  
<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<style type="text/css">
<!--
.style2 {color: #6C7A83}
.style1 {	color: #6C7A83;
	font-weight: bold;
}
-->
</style>
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
    <td width="100" valign="top"><img src="assets/modules/modules_search.jpg" alt="WebOS Site Configuration" width="100" height="100" /></td>
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. From here you can specify what modules the site search will search in, for user output.<!---\\ Default Display //--->

    If you see a checkmark, that module will be searched bu the site search module.
    <hr width="95%" align="center"/>
    <cfquery name="search_config" datasource="#datasrc#">
    Select * from #table_site_search#
    </cfquery>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg">Modules Site Search will Search in:</td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
</td>
</tr>
</table>
     <table width="100%"  border="0" cellspacing="1" cellpadding="5">
       <tr align="center" bgcolor="#9CB6DE">
         <td width="20" align="left" bgcolor="#E2E6E7">&nbsp;</td>
         <td width="253" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Module Name</strong></font></span></td>
         <td width="264" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Module Searchable</strong></font></span></td>
         </tr>
       <CFLOOP QUERY="search_config" StartRow="1" EndRow="#search_config.RecordCount#">
         <CFOUTPUT>
           <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
             <td width="20"><form name="searchconfig_#search_config_id#" action="?update_mod=yes" method="post">
    <input type="hidden" name="search_config_id" value="#search_config_id#" />
   
    <input name="module_installed" type="checkbox" value="1"<cfif #search_in_value# EQ "1">  checked</cfif> onchange="document.searchconfig_#search_config_id#.submit();"/>
    </form></td>
             <td align="center">#search_in#</td>
             <td align="center"><cfif #search_in_value# EQ "1">
    Yes
    <cfelseif #search_in_value# EQ "0">
    No
    </cfif></td>
             </tr>
           <CFIF row_color EQ 1>
             <CFSET row_color = 0>
             <CFELSE>
             <CFSET row_color = 1>
           </CFIF>
         </CFOUTPUT>
       </CFLOOP>
     </table></td>
   <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
   
  </tr>
  <tr>
   <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c1" alt="" /></td>
   <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
   <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c3" alt="" /></td>
   
  </tr>
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