<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Website Configuration">
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
    <cflocation url="configuration.cfm" addToken="No">
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
    <td width="100" valign="top"><img src="assets/modules/modules_config.jpg" alt="WebOS Site Configuration" width="100" height="100" /></td>
    <td valign="top">
	<cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can modify your WebOS Settings and View your Environment Variables.  You are currently editing <cfoutput>#session.sitename# / #session.siteID#</cfoutput>.
    <hr width="95%" align="center"/>
    <!---\\ Default Display //--->
     
    <script type="text/javascript" src="assets/scripts/tabcontent.js">
    </script>
    <ul id="maintab" class="shadetabs">
    <li><a href="#" rel="tcontent2">Core Functions</a></li>
<li class="selected"><a href="#" rel="tcontent1">Site Config</a></li>
<li><a href="#" rel="tcontent3">Modules Config</a></li>
<li><a href="#" rel="tcontent4">Environment</a></li>
<li><a href="configuration_templates.cfm" >Templates</a></li>
</ul>
<div class="tabcontentstyle">
<div id="tcontent2" class="tabcontent">
<cfquery name="core" datasource="#datasrc#">
select * from #table_config# where configuration_group='CORE' and siteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#"> order by weight
</cfquery>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr align="center" bgcolor="#9CB6DE">
<td width="168" align="left" bgcolor="#E2E6E7"><strong><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> Configuration Title</font></span></strong></td>
<td width="314" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Configuration Description</strong></font></span></td>
<td width="164" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Value</font></strong></td>
<td width="15" height="25" bgcolor="#E2E6E7">&nbsp;</td>
</tr>
<cfoutput query="core">
 <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
    <td  align="left" valign="top"><strong>#configuration_title#</strong></td>
    <td align="left" valign="top">#configuration_description#</td>
    <td align="center" valign="top" >#left(configuration_value, 15)#</td>
    <td align="right" valign="top"><cfif #configuration_title# EQ "Site Configured">
    <cfelseif #configuration_title# EQ "Site License">
    <cfelseif #configuration_title# EQ "Data Source">
    <cfelseif #configuration_title# EQ "WebOS Version">
    <cfelse>
    <a href="configuration.cfm?do=e&id=#configuration_id#"><img src="assets/icons/icon_edit_topic.gif" alt='Edit Configuration' border="0"></a><br>
    </cfif></td>
  </tr>
   <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
</cfoutput>
</table>
</div>
<div id="tcontent1" class="tabcontent">
<cfquery name="#table_config#" datasource="#datasrc#">
select * from #table_config# where configuration_group='SYSTEM' order by weight
</cfquery>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr align="center" bgcolor="#9CB6DE">
<td width="168" align="left" bgcolor="#E2E6E7"><strong><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> Configuration Title</font></span></strong></td>
<td width="314" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Configuration Description</strong></font></span></td>
<td width="164" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Value</font></strong></td>
<td width="15" height="25" bgcolor="#E2E6E7">&nbsp;</td>
</tr>
<cfoutput query="#table_config#" >
 <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
    <td  align="left" valign="top"><strong>#configuration_title#</strong></td>
    <td align="left" valign="top">#configuration_description#</td>
    <td align="center" valign="top" >#left(configuration_value, 15)#</td>
    <td align="right" valign="top"><cfif #configuration_title# EQ "Site Configured">
    <cfelseif #configuration_title# EQ "Site License">
    <cfelseif #configuration_title# EQ "Data Source">
    <cfelseif #configuration_title# EQ "WebOS Version">
    <cfelse>
    <a href="configuration.cfm?do=e&id=#configuration_id#"><img src="assets/icons/icon_edit_topic.gif" alt='Edit Configuration' border="0"></a><br>
    </cfif></td>
  </tr>
   <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
</cfoutput>
</table>


</div>
<div id="tcontent2" class="tabcontent">
<cfquery name="templates_config" datasource="#datasrc#">
select * from #table_config# where configuration_group='TEMPLATES' order by weight
</cfquery>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr align="center" bgcolor="#9CB6DE">
<td width="25%" align="left" bgcolor="#E2E6E7"><strong><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Configuration Title</font></span></strong></td>
<td width="48%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Configuration Description</strong></font></span></td>
<td width="25%" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Value</font></strong></td>
<td width="2%" height="25" bgcolor="#E2E6E7">&nbsp;</td>
</tr>
<cfoutput query="templates_config" >
 <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
    <td align="left" valign="top"><strong>#configuration_title#</strong></td>
    <td align="left" valign="top">#configuration_description#</td>
    <td align="center" valign="top">#configuration_value#</td>
    <td align="right" valign="top"><cfif #configuration_title# EQ "Site Configured">
    <cfelseif #configuration_title# EQ "Site License">
    <cfelseif #configuration_title# EQ "Data Source">
    <cfelseif #configuration_title# EQ "WebOS Version">
    <cfelse>
    <a href="configuration.cfm?do=e&id=#configuration_id#"><img src="assets/icons/icon_edit_topic.gif" alt='Edit Configuration' border="0"></a><br>
    </cfif></td>
  </tr>
   <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
</cfoutput>
</table>
</div>

<div id="tcontent3" class="tabcontent">
To Install a New Module, ensure you have uploaded the directory to the modules/ directory, and <a href="modules.cfm">click here</a>.<br />Please Note Not All Modules have Configurable options.<br /><br />
<cfquery name="modules_config" datasource="#datasrc#">
select * from #table_mods# order by module_id
</cfquery>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr align="center" bgcolor="#9CB6DE">
<td height="25" align="left" bgcolor="#E2E6E7"><strong><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Module Name</font></span></strong></td>
<td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Module Description</strong></font></span></td>
<td width="9%" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Directory</font></strong></td>
</tr>
<cfoutput query="modules_config">
 <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
    <td align="left" valign="top"><b>#modules_config.module_name# </b></td>
    <td align="left" valign="top">#modules_config.module_description#<br />
    <cfif #modules_config.module_installed# EQ "1">
    <font color="##006600"><b>Module is Installed</b></font>
    <cfelseif #modules_config.module_installed# EQ "0">
    <font color="##990000"><b>Module is Not-Installed</b></font>
	</cfif></td>
    <td align="left" valign="top">#modules_config.module_directory#</td>
    </tr>
   <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
</cfoutput>
</table>
</div>
<div id="tcontent4" class="tabcontent">
<cfparam name="hideserialnumber" default="Yes">
<cfoutput>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid ##47B1DB;">
      <tr>
        <td width="48%"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2"><H4><B>ColdFusion Server Information</B></H4></td>
            </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Product Name</B>:</td>
            <td width="50%" align="left" valign="top">#server.coldfusion.ProductName#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Product Version</B>:</td>
            <td width="50%" align="left" valign="top">#server.coldfusion.productversion#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Application Server:</B>:</td>
            <td width="50%" align="left" valign="top">#server.coldfusion.appserver#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Product Level</B>:</td>
            <td width="50%" align="left" valign="top">#server.coldfusion.productlevel#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Serial Number</B>:</td>
            <td width="50%" align="left" valign="top">

			<cfif hideserialnumber EQ "NO">
		#server.coldfusion.serialNumber#
<cfelse>
		<font color="red">The serial number is hidden by default, please check code to display serial number.</font>
	</cfif></td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Supported Locales</B>:</td>
            <td width="50%" align="left" valign="top"><!---#server.coldfusion.SupportedLocales#---></td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><strong>ColdFusion Root Dir:</strong></td>
            <td width="50%" align="left" valign="top">#Server.ColdFusion.Rootdir#</td>
          </tr>
        </table></td>
        <td width="2%">&nbsp;</td>
        <td width="48%" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2"><B>OS Variables</B></td>
            </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Name</B>:</td>
            <td width="50%" align="left" valign="top">#server.OS.Name#<br />
            </td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>AdditionalInformation</B>:</td>
            <td width="50%" align="left" valign="top">#server.OS.AdditionalInformation#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Version</B>:</td>
            <td width="50%" align="left" valign="top">#server.OS.Version#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>BuildNumber</B>:</td>
            <td width="50%" align="left" valign="top">#server.OS.BuildNumber#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><strong>Architecture:</strong></td>
            <td width="50%" align="left" valign="top">#Server.OS.arch#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top">&nbsp;</td>
            <td width="50%" align="left" valign="top">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table>
    </cfoutput>
</div>
</div>

<script type="text/javascript">
//Start Tab Content script for UL with id="maintab" Separate multiple ids each with a comma.
initializetabcontent("maintab")
</script>
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
        <cfelseif #edit.configuration_key# EQ "db_type">
         <select name="configuration_value" id="configuration_value">
         <option value="mssql"<cfif #edit.configuration_value# EQ "mssql"> selected</cfif>>Microsoft SQL Server</option>
         <option value="mysql"<cfif #edit.configuration_value# EQ "mysql"> selected</cfif>>MySQL</option> 
         </select>  
		<cfelse>
        <input name="configuration_value" type="text" value="<cfoutput>#edit.configuration_value#</cfoutput>" size="25" />
        </cfif> 
        </td>
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