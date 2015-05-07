<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Banners Administration">
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
<cfif isdefined("form.img_src") and #form.img_src# NEQ ""> 
  <!---  The uploadfile destination path is declared as a variable in the application.cfm file you may need to verify the precise path with your host ---> 
  <cffile action="upload" filefield="img_src" destination="#site_location#modules\banners\banners\" nameconflict="overwrite" accept="image/*" > 
  <cfset uploadedfile = "#site_location#modules\banners\banners\#file.serverfile#"> 
  <!---<cfoutput>#file.ServerFile#</cfoutput>--->
    </cfif>
<CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="add_banner">
  INSERT INTO #table_banners# (banner_alt, banner_company, banner_pic, banner_url)
  VALUES ('#form.banner_alt#', '#form.banner_company#', '#file.ServerFile#', '#Form.banner_url#')
  </CFQUERY>
</CFTRANSACTION>
 
  <cflocation url="module_banners.cfm?do=m" addToken="No">
</CFIF>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
 <cfif isdefined("form.img_src") and #form.img_src# NEQ ""> 
  <!---  The uploadfile destination path is declared as a variable in the application.cfm file you may need to verify the precise path with your host ---> 
  <cffile action="upload" filefield="img_src" destination="#site_location#modules\banners\banners\" nameconflict="overwrite" accept="image/*" > 
  <cfset uploadedfile = "#site_location#modules\banners\banners\#file.serverfile#"> 
  <!---<cfoutput>#file.ServerFile#</cfoutput>--->
    </cfif>
    <CFQUERY DataSource="#datasrc#" Name="update_banners">
  UPDATE #table_banners# SET banner_company='#form.banner_company#', banner_url='#form.banner_url#' <cfif NOT isDefined('form.img_src')><cfelseif isDefined('form.img_src')>, img_src='#file.serverfile#'</cfif> WHERE id = '#form.id#'  
			</CFQUERY>
  <CFTRANSACTION>
   
  <cflocation url="module_banners.cfm?do=m" addToken="No">
</cfif>  
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <cffile action="delete" file="#site_location#modules\banners\banners\#url.banner_pic#">
  <CFQUERY DataSource="#datasrc#" Name="delete_banners">
	DELETE FROM #table_banners# WHERE id = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_banners.cfm?do=m" addToken="No">
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
    <td width="100" valign="top"><img src="assets/modules/modules_banners.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add a Banner</a><br /></b>
      <cfelse>
      <a href="?do=a">Add a Banner</a><br />
      </cfif>
      <br />

      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>
      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can  add, edit and delete Banners on your WebOS Site.
      <hr width="95%" align="center"/>
<CFQUERY DataSource="#datasrc#" Name="display_banners">
			SELECT *
			FROM #table_banners# </CFQUERY>
            <table width="100%"  border="0" cellspacing="1" cellpadding="5">
      <tr align="center" bgcolor="#9CB6DE">
        <td width="25" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Banner ID</font></span></td>
        <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Banner Company</strong></font></span></td>
        <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Banner Link</strong></font></span></td>
        <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Views/Clicks</strong></font></span></td>
        <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
        <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
      </tr>
      <cfloop query="display_banners" startrow="1" endrow="#display_banners.RecordCount#">
        <cfoutput>
          <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
            <td width="25">#display_banners.id#</td>
            <td align="center">#display_banners.banner_company#</td>
            <td align="center">#display_banners.banner_url#</td>
            <td align="center">#display_banners.ban_views# /#display_banners.ban_clicks#            </td>
            <td align="center"><a href="?do=e&id=#display_banners.id#"><img src="assets/icons/icon_edit_topic.gif" width="15" height="15" border="0" alt="e" /></a></td>
            <td align="center"><a href="?do=d&id=#display_banners.id#"><img src="assets/icons/icon_delete_reply.gif" width="15" height="15" border="0" alt="d" /></a></td>
          </tr>
          <cfif row_color EQ 1>
            <cfset row_color = 0>
            <cfelse>
            <cfset row_color = 1>
          </cfif>
        </cfoutput>
      </cfloop>
    </table>
<cfelseif do EQ "a">
     <form name="add_banner" action="?Add=yes" method="post" enctype="multipart/form-data">
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add a Banner</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td width="48%" align="left" valign="top">Banner Company:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="banner_company" type="text" id="banner_company" size="25" value=""/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Banner Alt Text:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="banner_alt" type="text" id="banner_alt" size="25" value=""/></td>
  </tr>
  <tr>
    <td align="left" valign="top">Banner Weight:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input name="banner_weight" type="text" id="banner_weight" size="3" maxlength="1" /></td>
  </tr>
  <tr>
    <td align="left" valign="top">Banner Link:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input name="banner_url" type="text" id="banner_url" size="25" value=""/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Banner Image:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="img_src" id="img_src" type="file" /></td>
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
<CFQUERY DataSource="#datasrc#" Name="edit_banner">
			SELECT *
			FROM #table_banners# where id ='#url.id#'
</CFQUERY>
<form name="edit_banner" action="?Update=yes" method="post" enctype="multipart/form-data">
<input type="hidden" name="banid" value="<cfoutput>#url.id#</cfoutput>">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Banner</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td width="48%" align="left" valign="top">Banner Company:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="banner_company" type="text" id="company_name" size="25" value="<cfoutput>#edit_banner.banner_company#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Banner Alt Text:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="banner_alt" type="text" id="company_name" size="25" value="<cfoutput>#edit_banner.banner_alt#</cfoutput>"/></td>
  </tr>
  <tr>
    <td align="left" valign="top">Banner Weight:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input name="banner_weight" type="text" id="banner_weight" size="3" maxlength="1" value="<cfoutput>#edit_banner.banner_weight#</cfoutput>"/></td>
  </tr>
  <tr>
    <td align="left" valign="top">Banner Link:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input name="banner_url" type="text" id="banner_url" size="25" value="<cfoutput>#edit_banner.banner_url#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Banner:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><img src="../modules/banners/banners/<cfoutput>#edit_banner.banner_pic#</cfoutput>" /><br /><Br />
    <input name="img_src" type="file" size="25" /></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="right" valign="top">&nbsp;</td>
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
<CFQUERY DataSource="#datasrc#" Name="delete_banner">
			SELECT *
			FROM #table_banners# where id ='#url.id#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Banner</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you Certain you want to delete the banner for:<br />
  <b><cfoutput>#delete_banner.banner_company#</cfoutput></b><br />
   <a href="?Delete=yes&id=<cfoutput>#url.id#</cfoutput>&banner_pic=<cfoutput>#delete_banner.banner_pic#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_banners.cfm">No</a></td>
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