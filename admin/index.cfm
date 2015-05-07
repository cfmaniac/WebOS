<cf_headfoot>



<cfparam name="attributes.script" default="WebOS Administration Panel Panel">
<cfparam name="attributes.page" default="Home Page">
<cfparam name="current_version" Default="1.25">
<cfparam name="valid_license" Default="WEBOS_001_RC15_D">
<cfquery name="modules_installed" datasource="#datasrc#">
select * from #table_mods# where module_installed ='1' and module_admin='1'
</cfquery>
<!--- See if user has access level rights to this page --->
<style type="text/css">
<!--
.style1 {
	font-size: 11px;
	font-weight: bold;
}
-->
</style>

<cfif ListFindNoCase("#allusers#", session.permissions, ",")>

<!--- BEGINNING OF YOUR CONTENT --->
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Welcome to the WebOS Administration Panel</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr><td>
<cfquery name="version" datasource="#datasrc#">
select configuration_value from #table_config# where configuration_key ='webos_version'
</cfquery>

<table border="0" align="center" cellpadding="0" cellspacing="0" width="98%">
  <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
    <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c9" alt="" /></td>
    <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">What's new in WebOS Version: <i><cfoutput>#version.configuration_value#</cfoutput></i> (RC1.5)</span></td>
    <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c10" alt="" /></td>
  </tr>
  <tr>
    <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
    <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
      <tr>
        <td valign="top"><cfif #version.configuration_value# LT #current_version#>
            <font color="#990000"> Your Current Version of WebOS:: <b><cfoutput>#current_version#</cfoutput></b>is out-of-date. <br />Current Supported Version is: <b><cfoutput>#current_version#</cfoutput></b></font>
			<cfelseif #version.configuration_value# EQ #current_version#>
            <font color="#006600"> Your Current Version of WebOS:: <b><cfoutput>#current_version#</cfoutput></b> is up-to-date.
            <br /><cfquery name="license" datasource="#datasrc#">
            select configuration_value from #table_config# where configuration_key ='site_license'
            </cfquery>
            <cfif #license.configuration_value# EQ #valid_license#>
            Your WebOS License, <b><cfoutput>#license.configuration_value#</cfoutput></b> is Valid.
            <cfelseif #license.configuration_value# NEQ #valid_license#>
            </font><font color="#990000">Your WebOS License, <b><cfoutput>#license.configuration_value#</cfoutput></b> is In-Valid. Please Purchase a Valid License.
            </font>
            </cfif>
			</cfif></font>
            <br /><br />
            <cfif #db_type# EQ "mysql">
            <cflock timeout=20 throwontimeout="no" type="readonly" scope="session">
	<!--- Create Recordset with general database info --->
	<cfquery name="dbGeneralInfo" datasource="#datasrc#">
		SELECT VERSION() AS version, NOW() AS serverTime, DATABASE() AS dbInUse;
	</cfquery>
    <b>MySQL Database Information:</b>
    <table width="100%" border="0" cellspacing="0" cellpadding="2">
	<!--- Display Database Environment Details --->
	<cfoutput query="dbGeneralInfo">
	<tr><td>Version:</td><td>#version#</td></tr>
	<tr><td>Database Server Time:</td><td>#timeformat(serverTime, "HH:MM:SS")#</td></tr>
	<tr><td>Database currently in Use:</td><td>#dbInUse#</td></tr>
	</cfoutput>
</table>
</cflock>
            </cfif>
            <br /><br />
            <hr />
            <div style="overflow:auto; width:auto; height: 175px;">
            <ul>
            <li><b>Release Candidate 1.5 (RC1.5-D) has debuted.</b></li>
            <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> Added Page Rank check and display. <a href="configuration.cfm">View your Site's Page Rank now!</a> </li>
            <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> Moved Page Rank To 'Website Utilities' Menu, if feature active.</a> </li>
            <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> View new Users to your site! New users are viewable from Admin Main Page!</li>
           <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> Added Topic Help: Mouse over a link, and it will help you. (Currently only works on menus). </li>
           <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> Updated and Fixed Forum Module. New Database Tables as well.</li>
           <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> <strong>New Template:</strong> WebOS-Platinum:: Pure CSS-Based Layout</li>
           <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> Updated Modules for CSS Layout Compatibility</li>
           <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> Updated Templates, Left_col and Right_col No Longer Supported</li>
           <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> Left and Right Cols replaced by sideboxes</li>
           <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> Added new configuration value <i>css_template</i> to System configuration. Tells the system if you are running a CSS-Based layout or Not.</li>
           <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> Update Site's WYSIWYG editor. Much more feature rich, and easier to use. XHTML 1.0 Compliant code!!!</li>
           <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> Added 'Add New' functions to side box Administrator.</li>
           <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> Added '<strong>MySQL-Database</strong>' Support. Also if MySQL Database is used, displays current Version of Database in Main page.</li>
            <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> Moved Templates Configuration under 'Website Templates' and 'Website Configuration' Menus.</a> </li>
             <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> <b>New System Functionality:</b> Most of the Front-End Site Queries have been moved to functions/queries/ folder.<br />Note: Not ALL Modules have a query file. </li>
              <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> <b>Updated PodCast Module Administration</b></li>
              <li><img src="assets/icons/new.jpg" alt="New in WebOS Version <cfoutput>#version.configuration_value# </cfoutput>" align="absmiddle" /> <b>Database Updates: Added New Configuration Group 'Core' to Configuration Table. Many Items that were once under 'SYSTEM (or Site config)' are now located under Core Functions</b></li>              
            </ul>
            </div>
            </td>
      </tr>
    </table></td>
    <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c9" alt="" /></td>
    <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
    <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c10" alt="" /></td>
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

<br />
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
  <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
    <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c2" alt="" /></td>
    <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Administration Quick Links</span></td>
    <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c4" alt="" /></td>
  </tr>
  <tr>
    <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
    <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
      <tr>
        <td width="48%" align="center" valign="top">
          <center>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="27%"><img src="assets/modules/modules_config.jpg" alt="WebOS System Configuration" width="100" height="100"/></td>
                <td width="73%"><table border="0" align="center" cellpadding="0" cellspacing="0" width="95%">
                  <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
                  <tr>
                    <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c5" alt="" /></td>
                    <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Website Configuration</span></td>
                    <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c6" alt="" /></td>
                  </tr>
                  <tr>
                    <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
                    <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                        <tr>
                          <td valign="top"><cfquery name="version" datasource="#datasrc#">
select configuration_value from #table_config# where configuration_key ='webos_version'
                </cfquery>
                              <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="module_inquiry.cfm?do=e_conos">Edit Company Information</a><br />
                              <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="module_inquiry.cfm?do=e_cohrs">Edit Company Hours</a><br />
                              <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="configuration.cfm">Edit Site Configuration</a></td>
                        </tr>
                    </table></td>
                    <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c5" alt="" /></td>
                    <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
                    <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c6" alt="" /></td>
                  </tr>
                </table></td>
              </tr>
            </table>
          </center></td>
        <td width="2%" align="center" valign="top">&nbsp;</td>
        <td width="48%" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="26%"><img src="assets/modules/modules_modules.jpg" alt="WebOS Modules Configuration" width="100" height="100"/></td>
            <td width="74%"><table border="0" align="center" cellpadding="0" cellspacing="0" width="95%">
              <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
              <tr>
                <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c7" alt="" /></td>
                <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Modules Configuration</span></td>
                <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c8" alt="" /></td>
              </tr>
              <tr>
                <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
                <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                    <tr>
                      <td valign="top"><cfquery name="version" datasource="#datasrc#">
select configuration_value from #table_config# where configuration_key ='webos_version'
            </cfquery>
                          <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="modules.cfm">Modules Configuration</a><br />
                          <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="module_installer.cfm">Install a New Module</a></td>
                    </tr>
                </table></td>
                <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
              </tr>
              <tr>
                <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c7" alt="" /></td>
                <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
                <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c8" alt="" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="48%" align="center" valign="top">&nbsp;</td>
        <td width="2%" align="center" valign="top">&nbsp;</td>
        <td width="48%" align="center" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td width="48%" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="17%"><img src="assets/modules/modules_inquiry.jpg" width="100" height="100" /></td>
            <td width="83%"><table border="0" align="center" cellpadding="0" cellspacing="0" width="95%">
              <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
              <tr>
                <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c11" alt="" /></td>
                <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1"> New Inquires this Week: <b>
                      <cfset week_start ="#DateFormat(DateAdd("d", "-#DayOfWeek(Now()) - 1#", Now()), "MM/DD/YYYY")#">
                      <cfquery name="new_inquiries" datasource="#datasrc#">
          select * from #table_inquiry_submit# where date_submitted >= '#dateformat(now(), "MM/DD/YYYY")#' and date_submitted >= '#week_start#'
                </cfquery>
                  <cfoutput>#new_inquiries.recordcount#</cfoutput></span></td>
                <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c12" alt="" /></td>
              </tr>
              <tr>
                <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
                <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                    <tr>
                      <td valign="top"><img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="module_inquiry.cfm?do=view_submitted">View New Inquiries</a><br />
                          <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" />Inquiries that Require Replies :
                        <cfquery name="need_reply" datasource="#datasrc#">
          select * from #table_inquiry_submit# where replied_to ='0'
              </cfquery>
                        <b><cfoutput>#need_reply.recordcount#</cfoutput></b></td>
                    </tr>
                </table></td>
                <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
              </tr>
              <tr>
                <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c11" alt="" /></td>
                <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
                <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c12" alt="" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="2%" align="center" valign="top">&nbsp;</td>
        <td width="48%" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="16%"><img src="assets/modules/modules_users.jpg" width="100" height="100" /></td>
            <td width="84%"><table border="0" align="center" cellpadding="0" cellspacing="0" width="95%">
              <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
              <tr>
                <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c13" alt="" /></td>
                <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1"> New Users this Week: <b>
                      <cfset users_week_start ="#DateFormat(DateAdd("d", "-#DayOfWeek(Now()) - 1#", Now()), "MM/DD/YYYY")#">
                      <cfquery name="new_users" datasource="#datasrc#">
          select * from #table_usrs# where sign_up_date >= '#dateformat(now(), "MM/DD/YYYY")#' and sign_up_date >= '#users_week_start#'
                </cfquery>
                      <cfoutput>#new_users.recordcount#</cfoutput></span></td>
                <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c14" alt="" /></td>
              </tr>
              <tr>
                <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
                <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                    <tr>
                      <td valign="top"><img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="users.cfm">View New Users</a></td>
                    </tr>
                </table></td>
                <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
              </tr>
              <tr>
                <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c13" alt="" /></td>
                <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
                <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c14" alt="" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="center" valign="top">&nbsp;</td>
        <td align="center" valign="top">&nbsp;</td>
        <td align="center" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="17%" valign="top"><img src="assets/modules/modules_templates.jpg" width="100" height="100" /></td>
            <td width="83%"><table border="0" align="center" cellpadding="0" cellspacing="0" width="95%">
                <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
                <tr>
                  <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c15" alt="" /></td>
                  <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1"> Site Templates: <b>
                        <cfset week_start ="#DateFormat(DateAdd("d", "-#DayOfWeek(Now()) - 1#", Now()), "MM/DD/YYYY")#">
                        <cfquery name="new_inquiries" datasource="#datasrc#">
          select * from #table_inquiry_submit# where date_submitted >= '#dateformat(now(), "MM/DD/YYYY")#' and date_submitted >= '#week_start#'
                </cfquery>
                  </span></td>
                  <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c16" alt="" /></td>
                </tr>
                <tr>
                  <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
                  <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                      <tr>
                        <td valign="top"><img src="assets/icons/icon_edit_topic.gif" width="15" height="15" />Current Template:
 <cfquery name="template" datasource="#datasrc#">
Select * from #table_config# where configuration_key='site_template'
</cfquery>
                  <form name="switchtemp" action="?do=template" method="post">
                  <input type="hidden" name="configuration_key" value="site_template">
                  <select name="configuration_value" id="configuration_value">
          <option>Assign Template</option>
         <cfdirectory directory="#ExpandPath("../templates/")#" action="list" name="dir">
         <cfoutput query="dir">
         <option value="#dir.name#"<cfif #dir.name# EQ #template.configuration_value#> selected</cfif>>#dir.Name#</option>
         </cfoutput>
        </select>
        <input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" />
        </form>
                            <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="styles_admin.cfm">Edit Style Sheet</a><br />
                            <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="boxes_admin.cfm">Edit SideBoxes</a></td>
                      </tr>
                  </table></td>
                  <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
                </tr>
                <tr>
                  <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c15" alt="" /></td>
                  <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
                  <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c16" alt="" /></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td align="center" valign="top">&nbsp;</td>
        <td align="center" valign="top">&nbsp;</td>
      </tr>
    </table></td>
    <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c2" alt="" /></td>
    <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
    <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c4" alt="" /></td>
  </tr>
</table>
<!--- END OF YOUR CONTENT --->
<cfelse>
You are not authorized to view this page.
</cfif>


</cf_headfoot>
