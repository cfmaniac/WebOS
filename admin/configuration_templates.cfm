<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Website Templates Configuration">
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

<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_configs">
  UPDATE #table_config# SET configuration_value='#form.configuration_value#' WHERE configuration_id='#form.configuration_id#'
			</CFQUERY>
  </CFTRANSACTION>
    <cflocation url="configuration_templates.cfm" addToken="No">
</cfif>
<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<style type="text/css">
<!--
.style1 {font-weight: bold}
.style2 {font-weight: bold}
-->
</style><cfif ListFindNoCase("#allusers#", session.permissions, ",")>
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

<style type="text/css">
<!--
.style1 {
	font-size: 11px;
	font-weight: bold;
}
.style2 {
	color: #6C7A83;
	font-weight: bold;
}
.shadetabs{
padding: 3px 0;
margin-left: 0;
margin-top: 1px;
margin-bottom: 0;
font: bold 12px Verdana;
list-style-type: none;
text-align: left; /*set to left, center, or right to align the menu as desired*/
}

.shadetabs li{
display: inline;
margin: 0;
}

.shadetabs li a{
text-decoration: none;
padding: 3px 7px;
margin-right: 3px;
border: 1px solid #778;
color: #2d2b2b;
background: white url(shade.gif) top left repeat-x;
}

.shadetabs li a:visited{
color: #2d2b2b;
}

.shadetabs li a:hover{
text-decoration: underline;
color: #2d2b2b;
}

.shadetabs li.selected{
position: relative;
top: 1px;
}

.shadetabs li.selected a{ /*selected main tab style */
background-image: url(shadeactive.gif);
border-bottom-color: white;
}

.shadetabs li.selected a:hover{ /*selected main tab style */
text-decoration: none;
}

.tabcontentstyle{ /*style of tab content oontainer*/
border: 1px solid gray;
width: auto;
margin-bottom: 1em;
padding: 10px;
}

.tabcontent{
display:none;
}

@media print {
.tabcontent {
display:block!important;
}
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
    <td width="100" valign="top"><img src="assets/modules/modules_templates.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
    <a href="styles_admin.cfm">Edit Template Styles</a><br /><br />
    <a href="boxes_admin.cfm">Edit Side Boxes</a>
    <br />
    </td>
    <td valign="top">
	<cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can modify your WebOS Template Settings.
    <hr width="95%" align="center"/>
    <!---\\ Default Display //--->
     
    <script type="text/javascript" src="assets/scripts/tabcontent.js">
    </script>

<cfquery name="templates_config" datasource="#datasrc#">
select * from #table_config# where configuration_group='TEMPLATES' order by weight
</cfquery>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr align="center" bgcolor="#9CB6DE">
<td width="25%" align="left" bgcolor="#E2E6E7"><strong><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Configuration Title</font></span></strong></td>
<td width="48%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Configuration Description</strong></font></span></td>
<td width="25%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Value</strong></font></span></td>
<td width="2%" height="25" bgcolor="#E2E6E7">&nbsp;</td>
</tr>
<cfoutput query="templates_config" >
 <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
    <td align="left" valign="top"><strong>#configuration_title#</strong></td>
    <td align="left" valign="top">#configuration_description#</td>
    <td align="center" valign="top"><cfif #configuration_value# EQ "1">Enabled<cfelseif #configuration_value# EQ "0">Disabled<cfelse>#configuration_value#</cfif></td>
    <td align="right" valign="top">
    <a href="configuration_templates.cfm?do=e&id=#configuration_id#"><img src="assets/icons/icon_edit_topic.gif" alt='Edit Configuration' border="0"></a><br>
    </td>
  </tr>
   <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
</cfoutput>
</table>

    <cfelseif do EQ "e">
<cfquery name="edit" datasource="#datasrc#">
Select * from #table_config# where configuration_id='#url.id#'
</cfquery>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Website Configuration Variable</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><form name="edit_config" action="?Update=yes" method="post">
<input type="hidden" name="configuration_id" value="<cfoutput>#url.id#</cfoutput>">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="48%" align="left" valign="top">Configuration Title:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><cfoutput>#edit.configuration_title#</cfoutput></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Configuration Key:<br />(used as a Coldfusion Value: i.e., #site_folder#)</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><cfoutput>#edit.configuration_key#</cfoutput></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Configuration Value:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top">
        <cfif #edit.configuration_key# EQ "site_template">
        <select name="configuration_value" id="configuration_value">
          <option>Please Select a Template</option>
         <cfdirectory directory="#ExpandPath("../templates/")#" action="list" name="dir">
         <cfoutput query="dir">
         <option value="#dir.name#"<cfif #dir.name# EQ #edit.configuration_value#> selected</cfif>>#dir.Name#</option>
         </cfoutput>
        </select>
        <cfelse>
        <input name="configuration_value" type="text" value="<cfoutput>#edit.configuration_value#</cfoutput>" size="25" />
        </cfif>        </td>
      </tr>

           <tr>
        <td width="48%" align="left" valign="top">&nbsp;</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">&nbsp;</td>
        <td width="2%">&nbsp;</td>
        <td align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
      </tr>
    </table>
    </form></td>
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
    </cfif>
</td>
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