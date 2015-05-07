<!---
 Mod By : AP
 Looks like this page is for adding admins. Probably will need to add a siteID to it. Admin will select which site to work on, then will add an admin
 Mod : SiteID to Query's Where Clause


---><cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Admin Users Administration">
<script language="javascript" type="text/javascript" src="assets/scripts/common.js">
</script>
<script type="text/javascript">
<!--
var txt_advanced_editor_warning = "Advanced editor mode cannot be enabled, as this mode is available only in the following web browsers:\nIE5.5+ (Windows)\nLatest version of Netscape, Mozilla & Firefox (Windows)";
var isHTML_Editor = (
		(localBFamily == 'MSIE' && parseInt(localVersion) >= 5) || 
		(localBrowser == 'Netscape' && parseInt(localVersion) >= 8) || 
		((localBrowser == 'Firefox' || localBrowser == 'Mozilla') && parseInt(localVersion) >= 1) || 
		(localBrowser == 'Opera' && parseInt(localVersion) >= 9)
	);
var isHTML_EditorFF = (localBrowser == 'Firefox');
-->
</script>
<script src="assets/scripts/wysiwyg/innovaeditor.js" language="JavaScript" type="text/javascript"></script>

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
<!---\\ Add Function //--->
<cfif isDefined('url.Add') and #url.Add# is "yes">
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="add_article">
 INSERT INTO #table_admins#
(username, password, name, permissions, siteID)
VALUES
('#form.name#', '#form.password#', '#form.name#', '#form.permissions#', <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">);
  </CFQUERY>
</CFTRANSACTION>
  <cflocation url="admins.cfm?do=m" addToken="No">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_admin_news">
	DELETE FROM #table_admins# WHERE userid = '#url.id#'
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="admins.cfm?do=m" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_admin_news">
  UPDATE #table_admins# SET name = '#form.name#', username ='#form.username#', password='#form.password#', permissions = '#form.permissions#' where userid ='#form.id#'
			</CFQUERY>
  </CFTRANSACTION>
  <cflocation url="admins.cfm?do=m" addToken="No">
</cfif>

<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<style type="text/css">
<!--
.style1 {font-weight: bold}
.style2 {font-weight: bold}
-->
</style><cfif ListFindNoCase("#allusers#", session.permissions, ",")>
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
    <td width="100" valign="top"><img src="assets/modules/modules_admins.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add a User</a><br /></b>
      <cfelse>
      <a href="?do=a">Add a User</a><br />
      </cfif>
      <br />

      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>
      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can Edit Users Details.
    <hr width="95%" align="center"/>
<cfquery name="admin_results" datasource="#datasrc#">
select * from #table_admins#
where siteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</cfquery>
<table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="10%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Admin ID</strong></font></span></td>
    <td width="57%" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Admin Name</font></strong></td>
    <td width="18%" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Admin UsernName</font></strong></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="admin_results" StartRow="1" EndRow="#admin_results.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td align="left" valign="top">#userid#</td>
    <td align="left" valign="top"><b>#name#</b><br>
	User Level: <cfif #permissions# EQ "1">
		Administator
		<cfelseif #permissions# EQ "2">
		Administrative Editor
		<cfelseif #permissions# EQ "0">
		Editor / User
		</cfif></td>
    <td align="left" valign="top">#username#</td>
    <td align="left" valign="top"><a href="?do=e&id=#userid#"><img src="assets/icons/icon_edit_topic.gif" alt='Edit Record #userid#' border="0"></a></td>
    <td align="left" valign="top"><cfif #session.permissions# EQ "1">
<a href="?do=d&id=#userid#"><img src="assets/icons/icon_delete_reply.gif" alt='url.Delete Record #userid#' border="0"></a>
</cfif><br>
      <br>
</td>
      </tr>
      <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
    </CFOUTPUT>
  </CFLOOP>
</table>
<cfelseif do EQ "a">
     
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add New Administrator</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="add_admin" method="post" action="?add=yes">
	  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td width="48%" align="left" valign="top">Administrator's Name</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input name="name" type="text" size="25" maxlength="150" /></td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">Username:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input name="username" type="text" size="25" maxlength="150" /></td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">Password:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input name="password" type="password" size="25" maxlength="150" /></td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">Permissions:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><select name="permissions" id="permissions">
            <option>Please Select a Level</option>
            <option value="0">Editor / User</option>
            <option value="2">Administrative Editor</option>
            <option value="1">Administrator</option>
          </select></td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input type="submit" name="button" id="button" value="Add Admin" /></td>
        </tr>
	  </table>
</form>      </td>
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

    <cfelseif do EQ "e">
<cfquery name="admin_info" datasource="#datasrc#">
select * from #table_admins# where userid='#url.id#'
</cfquery>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Admin User</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form action="?Update=yes" method="post">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>Name:</td>
    <td><input name="name" type="text" value="<cfoutput query="admin_info">#name#</cfoutput>" size="25" maxlength="150"></td>
  </tr>
  <tr>
    <td>Username:</td>
    <td><input name="username" type="text" value="<cfoutput query="admin_info">#username#</cfoutput>" size="25" maxlength="150"></td>
  </tr>
  <tr>
    <td>Password:</td>
    <td><input name="password" type="password" value="<cfoutput query="admin_info">#password#</cfoutput>" size="25" maxlength="150"></td>
  </tr>
  <tr>
    <td>Permissions:</td>
    <td><select name="permissions" id="permissions">
      <option>Please Select a Level</option>
	  <option value="0" <cfif #session.permissions# EQ "0"> Selected</cfif>>Editor / User</option>

      <option value="2" <cfif #session.permissions# EQ "2"> Selected</cfif>>Administrative Editor</option>
      <option value="1" <cfif #session.permissions# EQ "1"> Selected</cfif>>Administrator</option>
    </select></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><input type="hidden" name="id" id="id" value="<cfoutput query="admin_info">#userid#</cfoutput>" /></td>
    <td><input type="submit" name="button" id="button" value="Edit Admin" /></td>
  </tr>
</table>


</form>
        </td>
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
</form>

<cfelseif do EQ "d">
<cfquery name="delete_admin" datasource="#datasrc#">
Select * from #table_admins# where userid='#url.id#'
</cfquery>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Admin User</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you sure you want to delete this Admin: <b><cfoutput>#delete_admin.username#</cfoutput></b>? <br>
    <br>
    <a href="?Delete=yes&id=<cfoutput>#delete_admin.userid#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="admins.cfm">No</a>
  </center></a></td>
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