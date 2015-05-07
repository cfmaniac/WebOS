<cf_headfoot>
<body onLoad="javascript: enableEditor('pagecontent','pagecontent', pagecontentEditor);">
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Spotlights Administration">
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

<script type="text/javascript" src="assets/scripts/calendarDateInput.js">
</script>
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
 <CFQUERY DataSource="#datasrc#" Name="add_spotlight">
  INSERT INTO #table_spots# (spotlight_title, spotlight_description, spotlight_time_sensitive, spotlight_start, spotlight_expire)
  VALUES ('#form.spotlight_title#', <cfif isDefined('form.#editor_name#')>'#form.spotlightcontent#',<cfelseif NOT isDefined('form.#editor_name#')>'#form.spotlightcontentAdv#',</cfif> '#form.spotlight_time_sensitive#', <cfif db_type eq "mysql">'#dateformat(form.spotlight_start, "YYYY-MM-DD HH:MM:SS")#'<cfelse>'#form.spotlight_start#'</cfif>, <cfif db_type eq "mysql">'#dateformat(form.spotlight_expire, "YYYY-MM-DD HH:MM:SS")#'<cfelse>'#form.spotlight_expire#'</cfif>)
 </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_spotlights.cfm?do=m" addToken="No">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_spotlights">
	DELETE FROM #table_spots# WHERE spotlight_id = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_spotlights.cfm?do=m" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_spotlights">
  UPDATE #table_spots# SET spotlight_title = '#form.spotlight_title#', spotlight_description = <cfif isDefined('form.#editor_name#')>'#form.spotlightcontent#',<cfelseif NOT isDefined('form.#editor_name#')>'#form.spotlightcontentAdv#',</cfif> spotlight_time_sensitive = '#form.spotlight_time_sensitive#', spotlight_start = '#form.spotlight_start#', spotlight_expire = '#form.spotlight_expire#'	WHERE spotlight_id = '#form.spotlight_id#' 
			</CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_spotlights.cfm?do=m" addToken="No">
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
    <td width="100" valign="top"><img src="assets/modules/modules_spotlights.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add a Spotlight</a><br /></b>
      <cfelse>
      <a href="?do=a">Add a Spotlight</a><br />
      </cfif>
      <br />

      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome<b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can add/edit/delete and activate/deactive Spotlights for website.
      <hr width="95%" align="center"/>
      <CFQUERY DataSource="#datasrc#" Name="display_spotlights">
			SELECT *
			FROM #table_spots# 
</CFQUERY>
<table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="25" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> ID</font></span></td>
    <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Spotlight Title</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Time Sensitive</strong></font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Start Date</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>End Date</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_spotlights" StartRow="1" EndRow="#display_spotlights.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="25">#display_spotlights.spotlight_id#</td>
        <td align="center">#display_spotlights.spotlight_title#</td>
        <td align="center"><cfif display_spotlights.spotlight_time_sensitive EQ "0">
        No
        <cfelseif display_spotlights.spotlight_time_sensitive EQ "1">
        Yes
        </cfif></td>
          <td align="center">#dateformat(display_spotlights.spotlight_start, "MM/DD/YYYY")#</td>
        <td align="left" nowrap>#dateformat(display_spotlights.spotlight_expire, "MM/DD/YYYY")#</td>
        <td align="center"><A HREF="?do=e&id=#display_spotlights.spotlight_id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&id=#display_spotlights.spotlight_id#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
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
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add New Spotlight</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="add_spotlight" action="?Add=yes" method="post">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="48%" align="left" valign="top">Spotlight Title:</td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="left" valign="top"><input name="spotlight_title" type="text" id="spotlight_title" size="25" value=""/></td>
        </tr>
        <cfinclude template="functions/wysiwyg.cfm">
        <tr>
          <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="left" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td width="48%" align="left" valign="top">Spotlight is Time-Sensitive?</td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="left" valign="top"><input name="spotlight_time_sensitive" type="radio" value="1" />
            Yes &nbsp;
            <input name="spotlight_time_sensitive" type="radio" value="0" />
            No</td>
        </tr>
        <tr>
          <td width="48%" align="left" valign="top">Start Date of this Spotlight:</td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="left" valign="top"><script>DateInput('spotlight_start', true, 'MM/DD/YYYY')</script></td>
        </tr>
        <tr>
          <td width="48%" align="left" valign="top">End Date of this Spotlight:</td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="left" valign="top"><script>DateInput('spotlight_expire', true, 'MM/DD/YYYY')</script></td>
        </tr>
        <tr>
          <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
        </tr>
      </table>
	</form></td>
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
<CFQUERY DataSource="#datasrc#" Name="edit_spotlight">
			SELECT * FROM #table_spots# where spotlight_id ='#url.id#'
</CFQUERY>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Spotlight</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="edit_spotlight" action="?Update=yes" method="post">
<input type="hidden" name="spotlight_id" value="<cfoutput>#url.id#</cfoutput>">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%" align="left" valign="top">Spotlight Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="spotlight_title" type="text" id="spotlight_title" size="25" value="<cfoutput>#edit_spotlight.spotlight_title#</cfoutput>"/></td>
  </tr>
  <!---<tr>
    <td width="48%" align="left" valign="top">Spotlight Content:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><textarea name="spotlight_content" id="spotlight_content" cols="100" rows="70" style="width:100%; height:250px;"><cfoutput>#edit_spotlight.spotlight_description#</cfoutput></textarea>
    <script language="javascript1.2">
  generate_wysiwyg('spotlight_content');
</script>
    </td>
  </tr>--->
  <cfinclude template="functions/wysiwyg.cfm">
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Spotlight is Time-Sensitive?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="spotlight_time_sensitive" type="radio" value="1" <cfif #edit_spotlight.spotlight_time_sensitive# EQ "1">checked </cfif>/>Yes &nbsp;<input name="spotlight_time_sensitive" type="radio" value="0" <cfif #edit_spotlight.spotlight_time_sensitive# EQ "0">checked </cfif>/>No</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Start Date of this Spotlight:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><script>DateInput('spotlight_start', true, 'MM/DD/YYYY', '<cfoutput>#DateFormat(edit_spotlight.spotlight_start, "mm/dd/yyyy")#</cfoutput>')</script></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">End Date of this Spotlight:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><script>DateInput('spotlight_expire', true, 'MM/DD/YYYY', '<cfoutput>#DateFormat(edit_spotlight.spotlight_expire, "mm/dd/yyyy")#</cfoutput>')</script></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
  </tr>
</table>
</form></td>
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
<CFQUERY DataSource="#datasrc#" Name="delete_spotlight">
			SELECT *
			FROM #table_spots# where spotlight_id ='#url.id#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Spotlight</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you sure you want to delete the spotlight: <b><cfoutput>#delete_spotlight.spotlight_title#</cfoutput></b>? <br>
    <br>
    <a href="?Delete=yes&id=<cfoutput>#id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_spotlights.cfm">No</a>
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