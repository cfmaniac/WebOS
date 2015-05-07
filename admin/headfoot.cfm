<cfparam name="attributes.script" default="WebOS Admin Panel">
<CFIF ThisTag.ExecutionMode IS "Start">

<cfinclude template="functions/site_admin_config.cfm">
<!---Debugging Info:<br>
Site Folder:<cfoutput>#site_folder#</cfoutput><br>
Script Name:<cfoutput>#CGI.Script_Name#</cfoutput>--->
<!---\\Editor Definitions//--->
<cfif cgi.script_name EQ "#site_folder#admin/module_articles.cfm">
<cfset editor_name ="articlescontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_blog.cfm">
<cfset editor_name ="blogpostcontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_didyouknow.cfm">
<cfset editor_name ="didyouknowcontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_forum.cfm">
<cfset editor_name ="forummsgcontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_links.cfm">
<cfset editor_name ="linksdesccontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_mainpage.cfm">
<cfset editor_name ="mainpagecontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_newsletter.cfm">
<cfset editor_name ="newslettercontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_pages.cfm">
<cfset editor_name ="pagecontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_spotlights.cfm">
<cfset editor_name ="spotlightcontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/admin_news.cfm">
<cfset editor_name ="adminnewscontent">
</cfif>
<!---\\End of Editor Definitions//--->
<html><head><title><cfoutput>#attributes.script#</cfoutput> :: </title>

<style>
body, p, td {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}

.errorText {
	color: #CC0000; 
}

.successText {
	color: #008800; 
}

.loginWhiteText {
	color: #FFFFFF; 
	font-weight: bold;
}

.loginInvalidText {
	color: #CC0000; 
	font-weight: bold;
}

.loginCopyrightText {
	color: #999999;
	font-size: 9px; 
}

a {
	color: #003399;
	text-decoration: none;
}

a:hover {
	color: #008A00; 
}

.iconLinkText {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 11px;
}

.leftMenuLinkText {
	color: #6C7A83; 
	font-size: 11px;
}

.topMenuLinkText {
	color: #000000;
	font-size: 11px; 
}

.menuCFAdminText {
	color: #000000;
	font-weight: bold;
	font-size: 11px;
}

.menuHeaderText {
	color: #0072AC;
	font-weight: bold;
	font-size: 11px;
}

.menuTD {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-bottom-color: #CCCCCC;
}

h1 {
	color: #000000;
	font-weight: bold;
	font-size: 11px;
	margin-top: 5px;
	margin-bottom: 5px;
}

.pageHeader {
	color: #0072AC;
	font-weight: bold;
	font-size: medium; ! important;
	margin-top: 5px;
	margin-bottom: 5px;
}

.cellBlueSides {
	border-right-width: 1px;
	border-left-width: 1px;
	border-right-style: solid;
	border-left-style: solid;
	border-right-color: #C1D9DB;
	border-left-color: #C1D9DB;
}

.cellLeftBlueSide {
	border-left-width: 1px;
	border-left-style: solid;
	border-left-color: #D5E3E6;
}

.cellRightAndBottomBlueSide {
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #D5E3E6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #D5E3E6;
}

.cell3BlueSides {
	border-left-width: 1px;
	border-left-style: solid;
	border-left-color: #D5E3E6;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #D5E3E6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #D5E3E6;
}

.cell4BlueSides {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #D5E3E6;
	border-left-width: 1px;
	border-left-style: solid;
	border-left-color: #D5E3E6;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #D5E3E6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #D5E3E6;
}

.cell2BlueSidesAndBlueBkgd {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #D5E3E6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #D5E3E6;
	background-color: #E8F0F1;
}

.cellBlueTop {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #C1D9DB;
	border-bottom-width: none;
	border-bottom-style: none;
	border-bottom-color: none;
}

.cellBlueBottom {
	border-top-width: none;
	border-top-style: none;
	border-top-color: none;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #C1D9DB;
}

.cellBlueTopAndBottom {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #C1D9DB;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #C1D9DB;
}

.cellBordersBlue {
	border: 1px solid #C1D9DB;
}

.cellGrayBottom {
	border-top-width: none;
	border-top-style: none;
	border-top-color: none;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #E2E6E7;
}

.copyright {
	color: #000000;
	font-size: 9px;
}

.copyrightLink {
	color: #FFFFCC; 
	font-size: 11px;
}
/*mnimer: added for the sanbox security formatting */
.color-title		{background-color:888885;color:white;background-color:7A8FA4;}
.color-header		{background-color:ddddd5;}
.color-buttons		{background-color:ccccc5;}
.color-border		{background-color:666666;}
.color-row			{background-color:fffff5;}
.color-rowalert		{background-color:ffddaa;}
.buttn,.buttnText	{font-size:1em;font-family: tahoma,arial,Geneva,Helvetica,sans-serif;background-color:e0e0d5;}

</style>
<script>
var content=new Array()
//change the array below to the text associated with your links Expand or contract the array, depending on how many links you have
//Current Menu Blocks:
content[0]='<b>Website Configuration::</b> Use this Menu to Edit Website Configuration'
content[1]='<b>Website Modules::</b> Use this Menu to Administrate/Edit Site Content'
content[2]='<b>Website Templates::</b> Use this Menu to Edit/Administrate Site Templates'
content[3]='<b>Website Users::</b> Use this Menu to Edit/Administrate Site Admins & Users'
content[4]='<b>Website Configuration::</b> Use this Menu to Access Site Utilities, such as SQL Patcher, Site Map Generator and more...'
//Menu Items: Configuration Menu:
content[5]='<b>Site Configuration::</b> Edit Your site\'s Settings.'
content[6]='<b>Edit Company Information::</b> Edit Contact & Address Info '
content[7]='<b>Edit Company Hours::</b> Edit Hours of Operation'
content[8]='<b>Site Modules::</b> Enable/Disable and Install Modules on your Website'
//Menu Items: Admin Utilities
content[9]='<b>Admin Utilities::</b> Returns you to the Main Administration Panel Page'
content[10]='<b>Admin Utilities::</b> Securely Logout of WebOS Administration'


function regenerate(){
window.location.reload()
}
function regenerate2(){
if (document.layers){
appear()
setTimeout("window.onresize=regenerate",450)
}
}

function changetext(whichcontent){

if (document.all||document.getElementById){
cross_el=document.getElementById? document.getElementById("descriptions"):document.all.descriptions
cross_el.innerHTML='<font face="Verdana">'+whichcontent+'<font>'
}
else if (document.layers){
document.d1.document.d2.document.write('<font face="Verdana">'+whichcontent+'</font>')
document.d1.document.d2.document.close()
}

}

function appear(){
document.d1.visibility='show'
}

window.onload=regenerate2


//-->
</script>
<!---\\ For Pagination, if Needed //--->

<link rel="SHORTCUT ICON" href="">
	<meta name="Author" content="Copyright (c) 2007-2008 WebOs. All rights reserved.">
</head>
<body bgcolor="#6c7a83"
<cfif cgi.script_name EQ "#site_folder#admin/module_articles.cfm">
onLoad="javascript: enableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_blog.cfm">
onLoad="javascript: enableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_didyouknow.cfm">
onLoad="javascript: enableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_forum.cfm">
onLoad="javascript: enableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_links.cfm">
onLoad="javascript: enableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_mainpage.cfm">
onLoad="javascript: enableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_newsletter.cfm">
onLoad="javascript: enableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_pages.cfm">
onLoad="javascript: enableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_spotlights.cfm">
onLoad="javascript: enableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">
<cfelseif cgi.script_name EQ "#site_folder#admin/admin_news.cfm">
onLoad="javascript: enableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">
<cfelse>
>
</cfif>

<!---Debugging Info
<cfif isDefined('editor_name')>
<br><cfoutput>#editor_name#</cfoutput>
<cfelseif NOT isDefined('editor_name')>
<br>Editor Name is Not Defined...
</cfif>--->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
    <tr>
      <td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_top_left.gif" height="11" width="12"></td>
      <td bgcolor="#ffffff"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
      <td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_top_right.gif" height="11" width="12"></td>
    </tr>
  </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
    <tr>
      <td bgcolor="#ffffff" width="10"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
      <td bgcolor="#ffffff"><table border="0" cellpadding="5" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td width="2%"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td width="100%" align="left" valign="top"><!--INFORMATION AREA-->
            <center>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="300" align="left" valign="top"><strong><img src="assets/main/web_os_large.jpg" alt="WebOS" width="300" height="100"></strong></td>
                  <td width="7">&nbsp;</td>
                  <td><iframe src="functions/news/news.cfm" width="100%" height="80" allowtransparency="yes" frameborder="0" scrolling="auto"></iframe>
                  <ilayer id="d1" width="100%" height="20" visibility="hide">
<layer id="d2" width="100%" height="20">
            <div id="descriptions" align="left" style="background-color:#eeeeee">
            <b>Topic Help::</b> Mouse over a menu item to your left to view available options.
            </div>
</layer>
</ilayer>
                  </td>
                </tr>
              </table>
            </center>
              <br>
              Welcome <b><cfoutput>#SESSION.SITENAME#</cfoutput></b> to the <cfoutput>#attributes.script#</cfoutput>. From Here you can easily administrate your WebOS Website as needed. </td>
            <td width="2%">&nbsp;</td>
          </tr>
        </tbody>
      </table></td>
      <td bgcolor="#ffffff" width="10"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
    </tr>
  </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
    <tr>
      <td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_bottom_left.gif" height="11" width="12"></td>
      <td bgcolor="#ffffff"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
      <td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_bottom_right.gif" height="11" width="12"></td>
    </tr>
  </tbody>
</table></td>
  </tr>
</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border: 1px solid #6c7a83;">

<tbody><tr>
	<td colspan="3"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="1" width="540"></td>
</tr>

  <tr>
	
    <td align="left" valign="top" width="225">
	<cfinclude template="functions/nav.cfm">
	</td>
	<td width="10">&nbsp;</td>
	<td align="left" valign="top">
		
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tbody><tr>
			<td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_top_left.gif" height="11" width="12"></td>
		    <td bgcolor="#ffffff"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
			<td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_top_right.gif" height="11" width="12"></td>
		  </tr>
		</tbody></table>
		
		
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tbody><tr>
		    <td bgcolor="#ffffff" width="10"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
			<td bgcolor="#ffffff">
				
				<table border="0" cellpadding="5" cellspacing="0" width="100%">
				  <tbody><tr>
					<td width="2%"></td>
				  </tr><tr>
	<td>&nbsp;</td>
	<td width="100%" valign="top">
	<CFELSEIF ThisTag.ExecutionMode IS "End">
	</td>
	<td width="2%">&nbsp;</td>
</tr>









					
				  
				</tbody></table>
				
			</td>
		    <td bgcolor="#ffffff" width="10"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
		  </tr>
		</tbody></table>
		
		
		
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tbody><tr>
			<td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_bottom_left.gif" height="11" width="12"></td>
		    <td bgcolor="#ffffff"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
			<td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_bottom_right.gif" height="11" width="12"></td>
		  </tr>
		</tbody></table>
		
		
			
	</td>
  </tr>
</tbody></table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
    <tr>
      <td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_top_left.gif" height="11" width="12"></td>
      <td bgcolor="#ffffff"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
      <td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_top_right.gif" height="11" width="12"></td>
    </tr>
  </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
    <tr>
      <td bgcolor="#ffffff" width="10"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
      <td bgcolor="#ffffff"><table border="0" cellpadding="5" cellspacing="0" width="100%">
        <tbody>
          <tr>
            
            <td width="100%" align="left" valign="middle" class="loginCopyrightText"><!--INFORMATION AREA-->
            <center>    <cfquery name="version" datasource="#datasrc#">
select configuration_value from #table_config# where configuration_key ='webos_version'
</cfquery>
              <strong>WebOS<sup>V.<cfoutput>#version.configuration_value#</cfoutput></sup> Administration Panel Interface Copyright &copy; 2007-2008 WebOS. All Rights Reserved.<!--originally Design and Developed By James Harvey--></strong>
            </center>
              </td>
            <td width="2%">&nbsp;</td>
          </tr>
        </tbody>
      </table></td>
      <td bgcolor="#ffffff" width="10"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
    </tr>
  </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
    <tr>
      <td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_bottom_left.gif" height="11" width="12"></td>
      <td bgcolor="#ffffff"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
      <td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_bottom_right.gif" height="11" width="12"></td>
    </tr>
  </tbody>
</table></td>
  </tr>
</table>


</body></html>
</CFIF>