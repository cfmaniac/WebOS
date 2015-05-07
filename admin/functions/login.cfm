<!--- 
	mod by : ap
	mod : added userlevel to table webos_admins, and now am going about looking for the SuperUser
		also changed field named "name" to sitename in webos_admins
	--->

<CFPARAM name="LoginSubmit" default="">
<CFPARAM name="username" default="">
<CFPARAM name="password" default="">
<!--- check form variables to see if user is in db --->
<CFIF LoginSubmit EQUAL "Login">
  <CFQUERY name="login" datasource="#datasrc#">
    SELECT 
    userID, userName, password, sitename, permissions, siteID, userLevel
    FROM #table_admins#
    WHERE UserName='#username#'
	AND Password = '#password#'
  </CFQUERY>
  <!--- set users session variables --->
  <CFIF Login.recordcount gt 0>

  	<CFLOCK SCOPE="SESSION" TYPE="EXCLUSIVE" TIMEOUT="20">
    <CFSET session.user="#login.username#">
	<!--ap-->
	<cfset session.SiteID='#login.siteID#'>
	<CFSET session.permissions="#login.permissions#">
	<cfif login.UserLevel eq 'SuperUser'>
		<cfset session.userLevel="SUPERUSER">
        <cfset session.siteID = "">
	<cfelse>	
		<cfset session.userLevel="SINGLEUSER">
        <cfset session.siteID = login.siteID>
	</CFIF>
	<CFSET session.sitename="#login.sitename#">
	<CFSET session.adminid="#login.userid#">
	</CFLOCK>
  </CFIF>
  <cfparam name="http_referer" default="index.cfm">
  <cflocation url="../index.cfm" addtoken="no">
</CFIF>

<!--- If user is not in db, or has not yet logged in, have him login --->
<CFIF session.user EQUAL "unknown">
<CFOUTPUT>
<cfparam name="attributes.pageName" default="WebOS Admin Panel:: Login">
<html><head><title><cfoutput>#attributes.pageName#</cfoutput></title>
<style>
body, p, td {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}

.errorText {
	color: CC0000;
}

.successText {
	color: 008800;
}

.loginWhiteText {
	color: FFFFFF;
	font-weight: bold;
}

.loginInvalidText {
	color: CC0000;
	font-weight: bold;
}

.loginCopyrightText {
	color: 999999;
	font-size: 9px;
}

a {
	color: 003399;
	text-decoration: none;
}

a:hover {
	color: 008A00;
}

.iconLinkText {
	color: FFFFFF;
	font-weight: bold;
	font-size: 11px;
}

.leftMenuLinkText {
	color: 6C7A83;
	font-size: 11px;
}

.topMenuLinkText {
	color: 000000;
	font-size: 11px;
}

.menuCFAdminText {
	color: FFFFFF;
	font-weight: bold;
	font-size: 11px;
}

.menuHeaderText {
	color: 0072AC;
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
	border-bottom-color: CCCCCC;
}

h1 {
	color: 000000;
	font-weight: bold;
	font-size: 11px;
	margin-top: 5px;
	margin-bottom: 5px;
}

.pageHeader {
	color: 0072AC;
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
	border-right-color: C1D9DB;
	border-left-color: C1D9DB;
}

.cellLeftBlueSide {
	border-left-width: 1px;
	border-left-style: solid;
	border-left-color: D5E3E6;
}

.cellRightAndBottomBlueSide {
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: D5E3E6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: D5E3E6;
}

.cell3BlueSides {
	border-left-width: 1px;
	border-left-style: solid;
	border-left-color: D5E3E6;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: D5E3E6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: D5E3E6;
}

.cell4BlueSides {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: D5E3E6;
	border-left-width: 1px;
	border-left-style: solid;
	border-left-color: D5E3E6;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: D5E3E6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: D5E3E6;
}

.cell2BlueSidesAndBlueBkgd {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: D5E3E6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: D5E3E6;
	background-color: E8F0F1;
}

.cellBlueTop {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: C1D9DB;
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
	border-bottom-color: C1D9DB;
}

.cellBlueTopAndBottom {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: C1D9DB;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: C1D9DB;
}

.cellBordersBlue {
	border: 1px solid C1D9DB;
}

.cellGrayBottom {
	border-top-width: none;
	border-top-style: none;
	border-top-color: none;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: E2E6E7;
}

.copyright {
	color: FFFFFF;
	font-size: 9px;
}

.copyrightLink {
	color: FFFFCC;
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



	<link rel="SHORTCUT ICON" href="">
	<meta name="Author" content="Copyright (c) 2207-2007 SWIDigital, Inc. All rights reserved.">
</head>

<body bgcolor="6c7a83" onLoad="closeMenus();">


<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">

<tbody><tr>
	<td colspan="2"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="1" width="540"></td>
</tr>

  <tr>

    <td align="left" valign="top">


		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tbody><tr>
		    <td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_top_left.gif" height="11" width="12"></td>
		      <td bgcolor="ffffff"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
			  <td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_top_right.gif" height="11" width="12"></td>
		    </tr>
		    </tbody>
		  </table>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tbody><tr>
		    <td bgcolor="ffffff" width="10"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
			  <td align="center" valign="top" bgcolor="ffffff">

			    <table border="0" cellpadding="5" cellspacing="0" width="100%">
			      <tbody><tr>
			        <td width="2%"></td>
				    </tr><tr>
				      <td>&nbsp;</td>
	  <td width="100%" align="center" valign="top" background="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/login_icon_lg.gif" style="background-position:center top; background-repeat:no-repeat;">
	   <form action="functions/login.cfm" name="login" method="post">

  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="3"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/main/web_os_small.jpg" width="150" height="50"><br>
            <br />
          Please Login with your Username &amp; Password. <br>
            <br>
            <u><strong>Also note:</strong></u> You will be asked to re-login after 60 minutes (1 Hour) of inactivity. If you plan on being away from your computer for 1 hour or more, Please Logout.<br>
          <br>
       </td>
        </tr>
      <tr>
        <td width="48%" align="right" valign="top"><strong>Username:</strong></td>
        <td width="2%">&nbsp;</td>
        <td width="48%" align="left" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="115">
  <tr>
   <td><img name="index_r1_c1" src="assets/main/text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c1" alt="" /></td>
   <td><input type="text" name="username" id="username" style="border-bottom: 1px solid ##6c7a83; border-top: 1px solid ##6c7a83; width:112px; height:19px; border-left: 0px solid ##6c7a83; border-right: 0px solid ##6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(assets/icons/username.jpg); background-repeat: no-repeat;background-position: left center; background-color:##FFFFFF;"/></td>
   <td><img name="index_r1_c3" src="assets/main/text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c3" alt="" /></td>
</tr>
</table></td>
      </tr>
      <tr>
        <td width="48%" align="right" valign="top"><strong>Password:</strong></td>
        <td width="2%">&nbsp;</td>
        <td width="48%" align="left" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="115">
  <tr>
   <td><img name="index_r1_c1" src="assets/main/text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c2" alt="" /></td>
   <td><input type="password" name="password" id="password"  style="border-bottom: 1px solid ##6c7a83; border-top: 1px solid ##6c7a83; width:112px; height:19px; border-left: 0px solid ##6c7a83; border-right: 0px solid ##6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(assets/icons/password.jpg); background-repeat: no-repeat;background-position: left center; background-color:##FFFFFF;"/></td>
   <td><img name="index_r1_c3" src="assets/main/text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c4" alt="" /></td>
</tr>
</table></td>
      </tr>
    </table>
  <script language="Javascript">
  <!--
  document.login.username.focus();
  // -->
  </script>
  <br>
  <u><strong>Please Note:</strong></u> Hitting the Enter Key on your Keyboard Will <strong><em>NOT</em></strong> log you in. Please Click the Login Button below.
  <br>
  <input type="Submit" name="LoginSubmit" value="Login">
  </form></td>
	  <td width="2%">&nbsp;</td>
  </tr>
		          </tbody></table>			</td>
		      <td bgcolor="ffffff" width="10"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
		    </tr>
		    </tbody>
		  </table>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tbody><tr>
		    <td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_bottom_left.gif" height="11" width="12"></td>
		      <td bgcolor="ffffff"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/spacer_10_x_10.gif" height="10" width="10"></td>
			  <td width="12"><img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/layout_box/cap_content_white_main_bottom_right.gif" height="11" width="12"></td>
		    </tr>
		    </tbody>
		  </table>
		<div align="center">
		  <table border="0" cellpadding="0" cellspacing="0" width="100%">
		    <tbody><tr>
		      <td width="78%" class="copyright"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="5%">&nbsp;</td>
                  <td width="74%" align="right" class="copyright">Copyright &copy; 2007-2008 WebOS </td>
                  <td width="21%">&nbsp;</td>
                </tr>
              </table>
		        <br>
                <center>
                </center></td>
		      <td width="22%" class="copyright"><center>
		        <img src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/assets/main/poweredby.gif" width="120" height="40">
		      </center>			  </td>
		    </tr>
	        </tbody></table>
	    </div></td>
	</tr>
</tbody></table>
</body></html>
 </CFOUTPUT>
  <CFABORT>
</CFIF>