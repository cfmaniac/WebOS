<cf_headfoot>
<body onLoad="javascript: enableEditor('pagecontent','pagecontent', pagecontentEditor);">
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Website Pages Administration">
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
 <CFQUERY DataSource="#datasrc#" Name="add_page">
  INSERT INTO #table_pages# (page_title, page_content, page_in_menu, page_status, weight)
  VALUES ('#form.page_title#', <cfif isDefined('form.#editor_name#')>'#form.pagecontent#',<cfelseif NOT isDefined('form.#editor_name#')>'#form.pagecontentAdv#',</cfif> '#form.page_in_menu#', '#form.page_status#', '#form.weight#')
 </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_pages.cfm?do=m" addToken="No">
</CFIF>
<!---\\ Adjust Function //--->
<cfif isDefined('url.Adjust') and #url.Adjust# is "yes">
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="adjust_page">
  UPDATE #table_pages# SET weight = '#form.weight#' WHERE page_id = '#form.page_id#' 
 </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_pages.cfm?do=m" addToken="No">
</CFIF>
<!---\\ Activate/Deactivate Function //--->
<cfif isDefined('url.toggle') and #url.toggle# is "yes">
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="adjust_page">
  UPDATE #table_pages# SET page_status = '#form.stat#' WHERE page_id = '#form.page_id#' 
 </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_pages.cfm?do=m" addToken="No">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_pages">
	DELETE FROM #table_pages#	WHERE page_id = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_pages.cfm?do=m" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_pages">
  UPDATE #table_pages# SET page_title = '#form.page_title#', <cfif isDefined('form.#editor_name#')>page_content='#form.pagecontent#',<cfelseif NOT isDefined('form.#editor_name#')>'#form.pagecontentAdv#',</cfif> page_in_menu = '#form.page_in_menu#', page_status = '#form.page_status#', weight = '#form.weight#'	WHERE page_id = '#form.page_id#' 
			</CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_pages.cfm?do=m" addToken="No">
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
    <td width="100" valign="top"><img src="assets/modules/modules_pages.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add a Page</a><br /></b>
      <cfelse>
      <a href="?do=a">Add a Page</a><br />
      </cfif>
      <br />

      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>
      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can add/edit/delete and activate/deactive Pages for website.
      <hr width="95%" align="center"/>
<CFQUERY DataSource="#datasrc#" Name="display_pages">
			SELECT *
			FROM #table_pages# Order By weight
</CFQUERY>
<table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="25" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Page ID</font></span></td>
    <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Page Title</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Page in Menu</strong></font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Page Status</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Weight</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_pages" StartRow="1" EndRow="#display_pages.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="25">#display_pages.page_id#</td>
        <td align="center">#display_pages.page_title#</td>
        <td align="center"><cfif #display_pages.page_in_menu#EQ "1"> Yes <cfelseif #display_pages.page_in_menu# EQ "0">No</cfif></td>
          <td align="center"><!---<cfif #display_pages.page_status# EQ "1">Active <cfelseif #display_pages.page_status# EQ "0"> Inactive</cfif>--->
          <cfif #display_pages.page_status# EQ "1">
          <form name="adjust_display<cfoutput>#display_pages.page_id#</cfoutput>" method="post" action="?toggle=yes">
        <input type="hidden" name="page_id" value="#display_pages.page_id#" />
         <input type="hidden" name="stat" value="0" />
        <a href="##" onClick="document.adjust_display<cfoutput>#display_pages.page_id#</cfoutput>.submit()"/>Active</a>
        </form>
          <cfelseif #display_pages.page_status# EQ "0">
           <form name="adjust_display<cfoutput>#display_pages.page_id#</cfoutput>" method="post" action="?Toggle=yes">
        <input type="hidden" name="page_id" value="#display_pages.page_id#" />
         <input type="hidden" name="stat" value="1" />
        <a href="##" onClick="document.adjust_display<cfoutput>#display_pages.page_id#</cfoutput>.submit()"/>In-Active</a>
        </form>
          </cfif>
          
          </td>
        <td align="left" nowrap><form name="adjust_weight<cfoutput>#display_pages.page_id#</cfoutput>" method="post" action="?Adjust=yes">
        <input type="hidden" name="page_id" value="#display_pages.page_id#" />
        <input name="weight" type="text"  value="#display_pages.weight#" size="3" onChange="document.adjust_weight<cfoutput>#display_pages.page_id#</cfoutput>.submit()"/>
        </form></td>
        <td align="center"><A HREF="?do=e&id=#display_pages.page_id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&id=#display_pages.page_id#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
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
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add New Page</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="add_page" action="?Add=yes" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%" align="left" valign="top">Page Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="page_title" type="text" id="page_title" size="25" value=""/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Page Content:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"> </td>
  </tr>
  <cfinclude template="functions/wysiwyg.cfm">
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Display Page in Menu?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="page_in_menu" type="radio" value="1" />Yes &nbsp;<input name="page_in_menu" type="radio" value="0" />No</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Activate this Page?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="page_status" type="radio" value="1" />Active &nbsp;<input name="page_status" type="radio" value="0" />In-Active</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Display Order of this Page:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="weight" type="text" id="weight" size="3" /></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" onClick="javascript:updateTextArea(n);"/></td>
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
<CFQUERY DataSource="#datasrc#" Name="edit_page">
			SELECT *
			FROM #table_pages# where page_id ='#url.id#'
</CFQUERY>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Page</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="edit_page" action="?Update=yes" method="post">
<input type="hidden" name="page_id" value="<cfoutput>#url.id#</cfoutput>">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%" align="left" valign="top">Page Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="page_title" type="text" id="page_title" size="25" value="<cfoutput>#edit_page.page_title#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Page Content:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"> </td>
  </tr>
<cfinclude template="functions/wysiwyg.cfm">
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Display Page in Menu?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="page_in_menu" type="radio" value="1" <cfif #edit_page.page_in_menu# EQ "1">checked </cfif>/>Yes &nbsp;<input name="page_in_menu" type="radio" value="0" <cfif #edit_page.page_in_menu# EQ "0">checked </cfif>/>No</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Activate this Page?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="page_status" type="radio" value="1" <cfif #edit_page.page_status# EQ "1">checked </cfif>/>Active &nbsp;<input name="page_status" type="radio" value="0" <cfif #edit_page.page_status# EQ "0">checked </cfif>/>In-Active</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Display Order of this Page:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="weight" type="text" id="weight" size="3" value="<cfoutput>#edit_page.weight#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg"/></td>
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
<CFQUERY DataSource="#datasrc#" Name="delete_page">
			SELECT *
			FROM #table_pages# where page_id ='#url.id#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Page</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you sure you want to delete the page: <b><cfoutput>#delete_page.page_title#</cfoutput></b>? <br>
    <br>
    <a href="?Delete=yes&id=<cfoutput>#id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_pages.cfm">No</a>
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