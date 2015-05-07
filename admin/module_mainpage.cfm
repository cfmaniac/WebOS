<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Main Page Administration">
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
 <CFQUERY DataSource="#datasrc#" Name="add_article">
  INSERT INTO #table_mainpage# (main_page_title, main_page_content, main_page_time_sensitive, main_page_start_date, main_page_expire_date, main_page_active)
  VALUES ('#form.main_page_title#', <cfif isDefined('form.#editor_name#')>'#form.mainpagecontent#',<cfelseif NOT isDefined('form.#editor_name#')>'#form.mainpagecontentAdv#',</cfif> '#form.main_page_time_sensitive#', <cfif #db_type# EQ "mysql">'#dateformat(form.main_page_start_date, "YYYY-MM-DD HH:MM:SS")#', '#dateformat(form.main_page_expire_date, "YYYY-MM-DD HH:MM:SS")#',<cfelse>'#form.main_page_start_date#', '#form.main_page_expire_date#',</cfif> '#form.main_page_active#')
  </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_mainpage.cfm?do=m" addToken="No">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_articles">
	DELETE FROM #table_mainpage#	WHERE main_page_id = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_mainpage.cfm?do=m" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_articles">
  UPDATE #table_mainpage# SET main_page_title='#form.main_page_title#', main_page_content=<cfif isDefined('form.#editor_name#')>'#form.mainpagecontent#',<cfelseif NOT isDefined('form.#editor_name#')>'#form.mainpagecontentAdv#',</cfif> main_page_time_sensitive='#form.main_page_time_sensitive#', <cfif #db_type# EQ "mysql">
main_page_start_date='#dateformat(form.main_page_start_date, "YYYY-MM-DD HH:MM:SS")#', main_page_expire_date='#dateformat(form.main_page_expire_date, "YYYY-MM-DD HH:MM:SS")#',  
<cfelse>main_page_start_date='#form.main_page_start_date#', main_page_expire_date='#form.main_page_expire_date#',</cfif> main_page_active='#form.main_page_active#'  WHERE main_page_id = '#form.main_page_id#'  
			</CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_mainpage.cfm?do=m" addToken="No">
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
    <td width="100" valign="top"><img src="assets/modules/modules_mainpg.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add a Main Page</a><br /></b>
      <cfelse>
      <a href="?do=a">Add a Main Page</a><br />
      </cfif>
      <br />

      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>
      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can  add, edit and delete Content that will be displayed on your WebOS homepage.
      <hr width="95%" align="center"/>
      <CFQUERY DataSource="#datasrc#" Name="display_mainpage">
			SELECT *
			FROM #table_mainpage#
</CFQUERY>
<table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="25" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Page ID</font></span></td>
    <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Page Title</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Page is Time Sensitive</strong></font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Page Start Date</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Page Expires on</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_mainpage" StartRow="1" EndRow="#display_mainpage.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="25">#display_mainpage.main_page_id#</td>
        <td align="center">#display_mainpage.main_page_title#</td>
        <td align="center"><cfif #display_mainpage.main_page_time_sensitive# EQ "1">
        Yes
        <cfelseif #display_mainpage.main_page_time_sensitive# EQ "0">
        No
        </cfif>
        </td>
          <td align="center">#display_mainpage.main_page_start_date#</td>
        <td align="left" nowrap>#display_mainpage.main_page_expire_date#</td>
        <td align="center"><A HREF="?do=e&id=#display_mainpage.main_page_id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&id=#display_mainpage.main_page_id#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
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
<form name="add_page" action="?Add=yes" method="post">

<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add Main Page</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%" align="left" valign="top">Page Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="main_page_title" type="text" id="main_page_title" size="25"/></td>
  </tr>
  <cfinclude template="functions/wysiwyg.cfm">
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Page is Time Sensitive?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="main_page_time_sensitive" type="radio" value="1" />Yes &nbsp;<input name="main_page_time_sensitive" type="radio" value="0" />No</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Start Date:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"> <script>DateInput('main_page_start_date', true, 'MM/DD/YYYY')</script></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Expiration Date:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><script>DateInput('main_page_expire_date', true, 'MM/DD/YYYY')</script></td>
  </tr>
  <tr>
    <td align="left" valign="top">Page is Active:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input name="main_page_active" type="radio" value="1" />Yes &nbsp;<input name="main_page_active" type="radio" value="0" />No</td>
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
<CFQUERY DataSource="#datasrc#" Name="edit_page">
			SELECT *
			FROM #table_mainpage# where main_page_id ='#url.id#'
</CFQUERY>
<form name="edit_page" action="?Update=yes" method="post">
<input type="hidden" name="main_page_id" value="<cfoutput>#url.id#</cfoutput>">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Main Page: <cfoutput>#edit_page.main_page_title#</cfoutput></span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%" align="left" valign="top">Page Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="main_page_title" type="text" id="main_page_title" size="25" value="<cfoutput>#edit_page.main_page_title#</cfoutput>"/></td>
  </tr>
  <cfinclude template="functions/wysiwyg.cfm">
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Page is Time Sensitive?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="main_page_time_sensitive" type="radio" value="1" <cfif #edit_page.main_page_time_sensitive# EQ "1">checked </cfif>/>Yes &nbsp;<input name="main_page_time_sensitive" type="radio" value="0" <cfif #edit_page.main_page_time_sensitive# EQ "0">checked </cfif>/>No</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Start Date:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"> <script>DateInput('main_page_start_date', true, 'MM/DD/YYYY', '<cfoutput>#DateFormat(edit_page.main_page_start_date, "mm/dd/yyyy")#</cfoutput>')</script></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Expiration Date:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><script>DateInput('main_page_expire_date', true, 'MM/DD/YYYY', '<cfoutput>#DateFormat(edit_page.main_page_expire_date, "mm/dd/yyyy")#</cfoutput>')</script></td>
  </tr>
  <tr>
    <td align="left" valign="top">Page is Active:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input name="main_page_active" type="radio" value="1" <cfif #edit_page.main_page_active# EQ "1">checked </cfif>/>Yes &nbsp;<input name="main_page_active" type="radio" value="0" <cfif #edit_page.main_page_active# EQ "0">checked </cfif>/>No</td>
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
<CFQUERY DataSource="#datasrc#" Name="delete_page">
			SELECT *
			FROM #table_mainpage# where main_page_id ='#url.id#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Article</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you sure you want to delete <cfoutput>#delete_page.main_page_title#</cfoutput>? <br>
    <br>
    <a href="?Delete=yes&id=<cfoutput>#id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_mainpage.cfm">No</a>
  </center>
</a></td>
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