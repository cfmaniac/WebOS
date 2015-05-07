<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Did You Know Administration">
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
 <CFQUERY DataSource="#datasrc#" Name="add_dyk">
  INSERT INTO #table_dyk_content# (dyk_title, dyk_content, dyk_available)
  VALUES ('#form.dyk_title#', <cfif isDefined('form.#editor_name#')>'#form.didyouknowcontent#',<cfelseif NOT isDefined('form.#editor_name#')>'#form.didyouknowcontentAdv#',</cfif> '#form.dyk_available#')
 </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_didyouknow.cfm?do=m" addToken="No">
</CFIF>

<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_dyks">
	DELETE FROM #table_dyk_content# WHERE dyk_id = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_didyouknow.cfm?do=m" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_dyks">
  UPDATE #table_dyk_content# SET dyk_title = '#form.dyk_title#', dyk_content = <cfif isDefined('form.#editor_name#')>'#form.didyouknowcontent#',<cfelseif NOT isDefined('form.#editor_name#')>'#form.didyouknowcontentAdv#',</cfif> dyk_available = '#form.dyk_available#'	WHERE dyk_id = '#form.dyk_id#' 
			</CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_didyouknow.cfm?do=m" addToken="No">
</cfif>  
<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<style type="text/css">
<!--
.style3 {font-size: 9px}
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
    <td width="100" valign="top"><img src="assets/modules/modules_dyk.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add A DYK</a><br /></b>
      <cfelse>
      <a href="?do=a">Add a DYK</a><br />
      </cfif>
      <br />

      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>
      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can  add, edit and DYKs on your WebOS Site.
      <hr width="95%" align="center"/>
<CFQUERY DataSource="#datasrc#" Name="display_dyks">
			SELECT *
			FROM #table_dyk_content#
</CFQUERY>
    
   <table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="25" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">DYK ID</font></span></td>
    <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>DYK Title</strong></font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>DYK Available on</strong></font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>DYK Views</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_dyks" StartRow="1" EndRow="#display_dyks.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="25">#display_dyks.dyk_id#</td>
        <td align="center">#display_dyks.dyk_title#</td>
        <td align="center"><cfif #display_dyks.dyk_available# EQ "0">
        Not Available
        <cfelseif #display_dyks.dyk_available# EQ "1">
        Everywhere
        <cfelseif #display_dyks.dyk_available# EQ "2">
        Pages Only
        <cfelseif #display_dyks.dyk_available# EQ "3">
        Articles Only
        <cfelseif #display_dyks.dyk_available# EQ "4">
        Pages & Articles
        <cfelseif #display_dyks.dyk_available# EQ "5">
        RSS Feeds
        </cfif>
</td>
        <td align="center">#display_dyks.dyk_views#</td>
        <td align="center"><A HREF="?do=e&id=#display_dyks.dyk_id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&id=#display_dyks.dyk_id#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
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
     <form name="add_article" action="?Add=yes" method="post">
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add New Did You Know</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="48%" align="left" valign="top">DYK Title:</td>
      <td width="2%">&nbsp;</td>
      <td width="48%" align="left" valign="top"><input name="dyk_title" type="text" id="dyk_title" size="25" value=""/></td>
    </tr>
    <cfinclude template="functions/wysiwyg.cfm">
    <tr>
      <td width="48%" align="left" valign="top">DYK Available on:<br />
          <span class="style3">Selecting Everywhere places them on pages, articles and RSS FEEDS. More Sections to come Soon</span></td>
      <td width="2%">&nbsp;</td>
      <td width="48%" align="left" valign="top"><select name="dyk_available" id="dyk_available">
          <option value="0">Please Select a Section</option>
          <option value="1">Everywhere</option>
          <option value="2">On Pages Only</option>
          <option value="3">On Articles Only</option>
          <option value="4">On Articles &amp; Pages</option>
          <option value="5">On RSS Feeds</option>
        </select>
      </td>
    </tr>
    <tr>
      <td width="48%" align="left" valign="top">&nbsp;</td>
      <td width="2%">&nbsp;</td>
      <td width="48%" align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
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
</form>
    <cfelseif do EQ "e">
<CFQUERY DataSource="#datasrc#" Name="edit_dyk">
			SELECT *
			FROM #table_dyk_content# where dyk_id ='#url.id#'
</CFQUERY>
<form name="edit_dyk" action="?Update=yes" method="post">
<input type="hidden" name="dyk_id" value="<cfoutput>#url.id#</cfoutput>">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Did You Know</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>s
    <td width="48%" align="left" valign="top">DYK Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="dyk_title" type="text" id="dyk_title" size="25" value="<cfoutput>#edit_dyk.dyk_title#</cfoutput>"/></td>
  </tr>
  <cfinclude template="functions/wysiwyg.cfm">
   <tr>
    <td width="48%" align="left" valign="top">DYK Available on:<br />
      <span class="style3">Selecting Everywhere places them on pages, articles and RSS FEEDS. More Sections to come Soon</span></td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><select name="dyk_available" id="dyk_available">
      <option value="0" <cfif #edit_dyk.dyk_available# EQ "0">selected</cfif>>Please Select a Section</option>
      <option value="1" <cfif #edit_dyk.dyk_available# EQ "1">selected</cfif>>Everywhere</option>
      <option value="2" <cfif #edit_dyk.dyk_available# EQ "2">selected</cfif>>On Pages Only</option>
      <option value="3" <cfif #edit_dyk.dyk_available# EQ "3">selected</cfif>>On Articles Only</option>
      <option value="4" <cfif #edit_dyk.dyk_available# EQ "4">selected</cfif>>On Articles &amp; Pages</option>
      <option value="5" <cfif #edit_dyk.dyk_available# EQ "5">selected</cfif>>On RSS Feeds</option>
    </select>
    </td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
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
</form>

<cfelseif do EQ "d">
<CFQUERY DataSource="#datasrc#" Name="delete_dyk">
			SELECT *
			FROM #table_dyk_content# where dyk_id ='#url.id#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Did You Know</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you Certain you want to delete the form field: <b><cfoutput>#delete_dyk.dyk_title#</cfoutput></b><br />
  <br />
   <a href="?Delete=yes&id=<cfoutput>#url.id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_didyouknow.cfm">No</a></td>
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