<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="RSS Feeds Administration">
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
<!---\\ Add Function //--->
<cfif isDefined('url.Add') and #url.Add# is "yes">
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="add_page">
  INSERT INTO #table_rss# (rss_title, rss_content, rss_status, rss_weight)
  VALUES ('#form.rss_title#', '#form.rss_content#', '#form.rss_status#', '#form.weight#')
 </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_rss.cfm?do=m" addToken="No">
</CFIF>

<!---\\ Local Add Function //--->
<cfif isDefined('url.Add_local') and #url.Add_local# is "yes">
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="add_page">
  INSERT INTO #table_our_feeds# (rss_title, rss_content, rss_created, rss_author, rss_author_email, rss_status, rss_weight)
  VALUES ('#form.rss_title#', '#form.rss_content#', '#form.rss_created#', '#form.rss_author#','#form.rss_author_email#','#form.rss_status#', '#form.weight#')
 </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_rss.cfm?do=generate" addToken="No">
</CFIF>
<!---\\ Adjust Function //--->
<cfif isDefined('url.Adjust') and #url.Adjust# is "yes">
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="adjust_page">
  UPDATE #table_rss# SET rss_weight = '#form.rss_weight#' WHERE rss_id = '#form.rss_id#' 
 </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_rss.cfm?do=m" addToken="No">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_rss">
	DELETE FROM #table_rss#	WHERE rss_id = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_rss.cfm?do=m" addToken="No">
</cfif>
<!---\\ Local Delete Function //--->
<cfif isDefined('url.Delete_local') and #url.Delete_local# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_rss">
	DELETE FROM #table_our_feeds#	WHERE rss_id = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_rss.cfm?do=generate" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_rss">
  UPDATE #table_rss# SET rss_title = '#form.rss_title#', rss_content = '#form.rss_content#', rss_status = '#form.rss_status#', rss_weight = '#form.rss_weight#'	WHERE rss_id = '#form.rss_id#' 
			</CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_rss.cfm?do=m" addToken="No">
</cfif>  
  <!---\\url.Update Functions//--->
<cfif isDefined('url.Update_local') and #url.Update_local# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_rss">
  UPDATE #table_our_feeds# SET rss_title = '#form.rss_title#', rss_content = '#form.rss_content#', rss_created='#form.rss_created#', rss_author='#form.rss_author#', rss_author_email='#form.rss_author_email#', rss_status = '#form.rss_status#', rss_weight = '#form.rss_weight#'	WHERE rss_id = '#form.rss_id#' 
			</CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_rss.cfm?do=generate" addToken="No">
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
    <td width="100" valign="top"><img src="assets/modules/modules_rss.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add External RSS Feed</a><br /></b>
      <cfelse>
      <a href="?do=a">Add External RSS Feed</a><br />
      </cfif>
      <br />
      <cfif do EQ "a_l">
      <b><a href="?do=a_l">Add Local RSS Feed</a><br /></b>
      <cfelse>
      <a href="?do=a_l">Add Local RSS Feed</a><br />
      </cfif>
      <br />
      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>
      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can add &amp; delete external RSS Feeds, as well as add/edit/delete internal RSS Feeds.
    For Internal Feeds, upon Saving the RSS XML file is automatically generated / updated.
    <hr width="95%" align="center"/>
<!---\\ Displays External Feeds //--->
<CFQUERY DataSource="#datasrc#" Name="display_rss">
			SELECT *
			FROM #table_rss# Order By rss_weight
</CFQUERY>
<!---\\ Displays Our Feeds //--->
<CFQUERY DataSource="#datasrc#" Name="display_our_rss">
			SELECT *
			FROM #table_our_feeds# Order By rss_weight
</CFQUERY>
<!---\\ End //--->
<strong> External Feeds:</strong>
<table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="25" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">RSS ID</font></span></td>
    <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>RSS Title</strong></font></span></td>
    <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>RSS Feed URL</strong></font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>RSS Status</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Weight</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_rss" StartRow="1" EndRow="#display_rss.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="25">#display_rss.rss_id#</td>
        <td align="center">#display_rss.rss_title#</td>
        <td align="center">
        #left(display_rss.rss_content, 30)# ...</td>
        <td align="center">#display_rss.rss_status#</td>
        <td align="left" nowrap><form name="adjust_weight<cfoutput>#display_rss.rss_id#</cfoutput>" method="post" action="?Adjust=yes">
        <input type="hidden" name="rss_id" value="#display_rss.rss_id#" />
        <input name="rss_weight" type="text"  value="#display_rss.rss_weight#" size="3" onchange="document.adjust_weight<cfoutput>#display_rss.rss_id#</cfoutput>.submit()"/>
        </form></td>
        <td align="center"><A HREF="?do=e&id=#display_rss.rss_id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&id=#display_rss.rss_id#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
      </tr>
      <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
    </CFOUTPUT>
  </CFLOOP>
</table><hr />
<strong> Local Feeds:</strong>
<table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="25" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">RSS ID</font></span></td>
    <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>RSS Title</strong></font></span></td>
    <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>RSS Feed Content</strong></font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>RSS Status</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Weight</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_our_rss" StartRow="1" EndRow="#display_our_rss.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="25">#display_our_rss.rss_id#</td>
        <td align="center">#display_our_rss.rss_title#</td>
        <td align="center">
        #left(display_our_rss.rss_content, 30)# ...</td>
        <td align="center">#display_our_rss.rss_status#</td>
        <td align="left" nowrap><form name="adjust_weight_our<cfoutput>#display_our_rss.rss_id#</cfoutput>" method="post" action="?Adjust=yes">
        <input type="hidden" name="rss_id" value="#display_our_rss.rss_id#" />
        <input name="rss_weight" type="text"  value="#display_our_rss.rss_weight#" size="3" onchange="document.adjust_weight_our<cfoutput>#display_our_rss.rss_id#</cfoutput>.submit()"/>
        </form></td>
        <td align="center"><A HREF="?do=e_l&id=#display_our_rss.rss_id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d_l&id=#display_our_rss.rss_id#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
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
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add New External RSS Feed</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="add_page" action="?Add=yes" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%" align="left" valign="top">RSS Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="rss_title" type="text" id="rss_title" size="25" value=""/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">URL For Content:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="rss_content" type="text" id="rss_content" size="25" value=""/>   </td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Activate this Feed?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="rss_status" type="radio" value="1" />Active &nbsp;<input name="rss_status" type="radio" value="0" />In-Active</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Display Order of this Page:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="weight" type="text" id="weight" size="3" /></td>
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
<cfelseif do EQ "a_l">
     
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add New Local RSS Feed</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="add_page" action="?Add_local=yes" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%" align="left" valign="top">RSS Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="rss_title" type="text" id="rss_title" size="25" value=""/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Content:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><textarea name="rss_content" id="rss_content" cols="100" rows="70" style="width:100%; height:250px;"></textarea>
    <script language="javascript1.2">
  generate_wysiwyg('rss_content');
</script>   </td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">
    <input type="hidden" name="rss_created" value="<cfoutput>#dateformat(now())#</cfoutput>"/></td>
  </tr>
  <tr>
    <td align="left" valign="top">Feed Author:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input type="text" name="rss_author" id="rss_author" /></td>
  </tr>
  <tr>
    <td align="left" valign="top">Feed Author Email:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input type="text" name="rss_author_email" id="rss_author" /></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Activate this Feed?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="rss_status" type="radio" value="1" />Active &nbsp;<input name="rss_status" type="radio" value="0" />In-Active</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Display Order of this Page:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="weight" type="text" id="weight" size="3" /></td>
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
<CFQUERY DataSource="#datasrc#" Name="edit_page">
			SELECT *
			FROM #table_rss# where rss_id ='#url.id#'
</CFQUERY>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit External RSS Feed</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="edit_page" action="?Update=yes" method="post">
<input type="hidden" name="rss_id" value="<cfoutput>#url.id#</cfoutput>">
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%" align="left" valign="top">RSS Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="rss_title" type="text" id="rss_title" size="25" value="<cfoutput>#edit_page.rss_title#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">URL for Content:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"> <input name="rss_content" type="text" id="rss_content" size="25" value="<cfoutput>#edit_page.rss_content#</cfoutput>"/>   </td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Activate this Feed?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="rss_status" type="radio" value="1" <cfif #edit_page.rss_status# EQ "1">checked </cfif>/>Active &nbsp;<input name="rss_status" type="radio" value="0" <cfif #edit_page.rss_status# EQ "0">checked </cfif>/>In-Active</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Display Order of this Page:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="rss_weight" type="text" id="rss_weight" size="3" value="<cfoutput>#edit_page.rss_weight#</cfoutput>"/></td>
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
<cfelseif do EQ "e_l">
<CFQUERY DataSource="#datasrc#" Name="edit_page">
			SELECT *
			FROM #table_our_feeds# where rss_id ='#url.id#'
</CFQUERY>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Internal RSS Feed</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="edit_page" action="?Update_local=yes" method="post">
<input type="hidden" name="rss_id" value="<cfoutput>#url.id#</cfoutput>">
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%" align="left" valign="top">RSS Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="rss_title" type="text" id="rss_title" size="25" value="<cfoutput>#edit_page.rss_title#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">URL For Content:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><textarea name="rss_content" id="rss_content" cols="100" rows="70" style="width:100%; height:250px;"><cfoutput>#edit_page.rss_content#</cfoutput></textarea>
    <script language="javascript1.2">
  generate_wysiwyg('rss_content');
</script>   </td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">
    <input type="hidden" name="rss_created" value="<cfoutput>#dateformat(now())#</cfoutput>"/>
    <input type="hidden" name="rss_author" value="<cfoutput>#edit_page.rss_author#</cfoutput>"/>
    <input type="hidden" name="rss_author_email" value="<cfoutput>#edit_page.rss_author_email#</cfoutput>"/>
    </td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Activate this Feed?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="rss_status" type="radio" value="1" <cfif #edit_page.rss_status# EQ "1">checked </cfif>/>Active &nbsp;<input name="rss_status" type="radio" value="0" <cfif #edit_page.rss_status# EQ "0">checked </cfif>/>In-Active</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Display Order of this Page:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="rss_weight" type="text" id="rss_weight" size="3" value="<cfoutput>#edit_page.rss_weight#</cfoutput>"/></td>
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


<cfelseif do EQ "d">
<CFQUERY DataSource="#datasrc#" Name="delete_page">
			SELECT *
			FROM #table_rss# where rss_id ='#url.id#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete External RSS Feed</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you sure you want to delete the Feed: <b><cfoutput>#delete_page.rss_title#</cfoutput></b>? <br>
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
<cfelseif do EQ "d_l">
<CFQUERY DataSource="#datasrc#" Name="delete_page">
			SELECT *
			FROM #table_our_feeds# where rss_id ='#url.id#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Internal RSS Feed</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you sure you want to delete the Local Feed: <b><cfoutput>#delete_page.rss_title#</cfoutput></b>? <br>
    <br>
    <a href="?Delete_local=yes&id=<cfoutput>#id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_pages.cfm">No</a>
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
<cfelseif do is "generate">
<cfinclude template="rss_generate.cfm">
<cflocation url="module_rss.cfm?do=m&msg=RSS FEED XML File successfully updated" addtoken="no">
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