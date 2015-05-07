<!-- ap debug -->
<cfparam name="view_page_rank" default="0">
<!--- AP
	NAME CHAGED TO SITENAME
	Jan 28 08 hard coding location of javascript file until further investigation.
    --->

<style type="text/css">
<!--
body {
	background-color: #6C7A83;
}
-->
</style><CFIF ThisTag.ExecutionMode IS "Start">
<cfif isDefined('url.do') and #url.do# EQ "Template">
<cfquery name="switch_temp" datasource="#datasrc#">
update #table_config# SET configuration_value='#form.configuration_value#' WHERE configuration_key='site_template'
</cfquery>
<cfif #form.configuration_value# EQ "WebOS-Platinum" >
<cfquery name="switch_temp" datasource="#datasrc#">
update #table_config# SET configuration_value='1' WHERE configuration_key='css_template'
</cfquery>
<cfquery name="switch_temp" datasource="#datasrc#">
update #table_config# SET configuration_value='1' WHERE configuration_key='right_col_active'
</cfquery>
<cfelseif #form.configuration_value# EQ "WebOS-Platinum">
<cfquery name="switch_temp" datasource="#datasrc#">
update #table_config# SET configuration_value='1' WHERE configuration_key='css_template'
</cfquery>
<cfquery name="switch_temp" datasource="#datasrc#">
update #table_config# SET configuration_value='0' WHERE configuration_key='right_col_active'
</cfquery>
<cfelse>
<cfquery name="switch_temp" datasource="#datasrc#">
update #table_config# SET configuration_value='0' WHERE configuration_key='css_template'
</cfquery>
<cfquery name="switch_temp" datasource="#datasrc#">
update #table_config# SET configuration_value='0' WHERE configuration_key='right_col_active'
</cfquery>
</cfif>
<cflocation url="#cgi.SCRIPT_NAME#" addtoken="no">
</cfif>
<!-- ap debug nav.cfm -->
<!--- <cfoutput>
http://#site_domain#/#site_admin_dir##site_assets_dir##site_scripts_dir#</cfoutput>
<cfabort /> --->

<!--- <script language="javascript" src="<cfoutput>http://#site_domain##site_folder##site_admin_dir##site_assets_dir##site_scripts_dir#</cfoutput>menu.js"></script> --->
 
 <!--- <script language="javascript" src="<cfoutput>http://#site_domain#/#site_admin_dir##site_assets_dir##site_scripts_dir#</cfoutput>menu.js"></script> --->
 
 <script language="javascript" src="/admin/assets/scripts/menu.js"></script>

    <cfquery name="version" datasource="#datasrc#">
select configuration_value from #table_config# where configuration_key ='webos_version'
</cfquery>
<body>
<cfif #session.permissions# EQ "1" or "2" or "3" or "0">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="225">
  <tr>
    <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1_menu.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
    <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><strong>WebOS<sup>V.<cfoutput>#version.configuration_value#</cfoutput></sup> Admin Menu</strong></td>
    <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3_menu.jpg" width="11" height="20" border="0" id="menu_r1_c4" alt="" /></td>
  </tr>
  <tr>
    <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
    <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
      <tr>
        <td valign="top">
        <!-- Begin Site Config-->
        <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
          <tr>
            <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c7" alt="" /></td>
            <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><strong><a href="javascript:Toggle('config');Toggle('desc_config');" onMouseover="changetext(content[0])">Website Configuration</a></strong></td>
            <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c8" alt="" /></td>
          </tr>
          </table>
          <div style="display: none;" id="config">
          <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
          <tr>
            <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
            <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                <tr>
                  <td valign="top"><a class="leftMenuLinkText"  href="configuration.cfm" onMouseover="changetext(content[5])">
Site Configuration
</a></td>
                </tr>
                   <tr>
                    <td valign="top"><a class="leftMenuLinkText" href="configuration_templates.cfm">Templates Configuration</a></td>
                  </tr>
            </table></td>
            <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
            <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                <tr>
                  <td valign="top"><a class="leftMenuLinkText"  href="module_inquiry.cfm?do=e_conos" onMouseover="changetext(content[6])">
Edit Company Information
</a></td>
                </tr>
            </table></td>
            <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
          </tr>
<tr>
            <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
            <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                <tr>
                  <td valign="top"><a class="leftMenuLinkText"  href="module_inquiry.cfm?do=e_cohrs" onMouseover="changetext(content[7])">
Edit Company Hours
</a></td>
                </tr>
            </table></td>
            <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
          </tr>          
            <tr>
            <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
            <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                <tr>
                  <td valign="top"><a class="leftMenuLinkText"  href="modules.cfm" onMouseover="changetext(content[8])">
Site Modules
</a></td>
                </tr>
            </table></td>
            <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
          </tr>
          </table>
          </div>
          <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
          <tr>
            <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c7" alt="" /></td>
            <td align="center" background="assets/main_box/admin_r3_c2.jpg">&nbsp;
            </td>
            <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c8" alt="" /></td>
          </tr>
        </table>
        <!--End Site config-->
          <br>
        <!--Begin Site Modules-->  
          <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
            <tr>
              <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c9" alt="" /></td>
              <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><strong><a href="javascript:Toggle('modules');" onMouseover="changetext(content[1])">Website Modules</a></strong></td>
              <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c10" alt="" /></td>
            </tr>
            </table>
            <div style="display: none;" id="modules">
            <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
           
            <tr>
              <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
              <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                  <cfquery name="mod_admin" datasource="#datasrc#">
           select * from #table_mods# where module_admin='1' and module_installed='1' ORDER BY module_name ASC
           </cfquery>
           <cfoutput>
           <cfloop query="mod_admin">
                  <tr>
                    <td valign="top"><a class="leftMenuLinkText"  href="module_#mod_admin.module_directory#.cfm">
                    #mod_admin.module_name# Administration
</a></td>
                  </tr>
           </cfloop>
           </cfoutput>       
              </table>
              </td>
              <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
            </tr>
            </table>
            </div>
            <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
            <tr>
              <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c9" alt="" /></td>
              <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
              <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c10" alt="" /></td>
            </tr>
          </table>
          <!-- End Site Modules-->
          <br>
          <!-- Begin Templates-->
       <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
            <tr>
              <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c9" alt="" /></td>
              <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><strong><a href="javascript:Toggle('templates');" onMouseover="changetext(content[2])">Website Templates</a></strong></td>
              <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c10" alt="" /></td>
            </tr>
            </table>
            <div style="display: none;" id="templates">
            <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
           
            <tr>
              <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
              <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                  
                  <tr>
                    <td valign="top"><a class="leftMenuLinkText"  href="styles_admin.cfm">
Edit Style Sheet
</a></td>
                  </tr>
                  <tr>
                    <td valign="top"><a class="leftMenuLinkText"  href="boxes_admin.cfm">
Edit SideBoxes
</a></td>
                  </tr>
                   <tr>
                    <td valign="top"><a class="leftMenuLinkText" href="configuration_templates.cfm">Templates Configuration</a></td>
                  </tr>
     
              </table>
              </td>
              <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
            </tr>
            
             <tr>
              <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
              <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                  
                  <tr>
                    <td valign="top">
Current Template:
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
</td>
                  </tr>
      
              </table>
              </td>
              <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
            </tr>
            </table>
            </div>
            <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
            <tr>
              <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c9" alt="" /></td>
              <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
              <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c10" alt="" /></td>
            </tr>
          </table>
        <!--End Site Templates-->
          <br>
          <!-- Begin Site Users-->
        <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
          <tr>
            <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c7" alt="" /></td>
            <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><strong><a href="javascript:Toggle('users');" onMouseover="changetext(content[3])">Website Users</a></strong></td>
            <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c8" alt="" /></td>
          </tr>
          </table>
          <div style="display: none;" id="users">
          <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
          <cfif #session.permissions# EQ "1">
          <tr>
            <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
            <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                <tr>
                  <td valign="top"><a class="leftMenuLinkText"  href="admins.cfm">
Administrative Users
</a></td>
                </tr>
            </table></td>
            <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
          </tr>
          </cfif>
          <tr>
            <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
            <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                <tr>
                  <td valign="top"><a class="leftMenuLinkText"  href="users.cfm">
Users
</a></td>
                </tr>
            </table></td>
            <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
          </tr>
            
          </table>
          </div>
          <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
          <tr>
            <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c7" alt="" /></td>
            <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
            <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c8" alt="" /></td>
          </tr>
        </table>
        <!--End Site Users-->
        <br>
          <!-- Begin Site Utilities-->
        <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
          <tr>
            <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c7" alt="" /></td>
            <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><strong><a href="javascript:Toggle('utils');" onMouseover="changetext(content[4])">Website Utilities</a></strong></td>
            <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c8" alt="" /></td>
          </tr>
          </table>
          <div style="display: none;" id="utils">
          <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
                    <tr>
            <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
            <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                <tr>
                  <td valign="top"><a class="leftMenuLinkText"  href="admin_sql.cfm">
SQL Patch Engine
</a></td>
                </tr>
            </table></td>
            <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
            <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                <tr>
                  <td valign="top"><a class="leftMenuLinkText"  href="admin_news.cfm">
Admins News
</a></td>
                </tr>
            </table></td>
            <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
            <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                <tr>
                  <td valign="top"><a class="leftMenuLinkText"  href="sitemap_generate.cfm">
Generate Site Map XML
</a></td>
                </tr>
                <cfif #view_page_rank# EQ "1"><!--- im getting an error here --->
                <tr>
                  <td valign="top"><a class="leftMenuLinkText"  href="siterank.cfm">
Website Page Rank
</a></td>
                </tr>
                </cfif>
            </table></td>
            <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
          </tr>
            
          </table>
          </div>
          <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
          <tr>
            <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c7" alt="" /></td>
            <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
            <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c8" alt="" /></td>
          </tr>
        </table>
          <br>
          <!--End Site Utilities-->
          <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
            <tr>
              <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c5" alt="" /></td>
              <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><strong>Users Online</strong></td>
              <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c6" alt="" /></td>
            </tr>
            <tr>
              <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
              <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                  <tr>
                    <td valign="top"><cfif isDefined("Session.adminid")>
			<cfquery name="who_online" datasource="#datasrc#">
SELECT	*
FROM 	#table_admins#
where userid = '#Session.adminid#'
</cfquery>

<cfoutput query="who_online">
<!---For Debugging #Session.adminid# /--->

 <b>#who_online.SITEname#</b>: <i>#who_online.username#</i><br>
  <!---<strong>Currently Browsing:</strong><br>
  #right(cgi.SCRIPT_NAME,22)#
  --->
   <hr>
</cfoutput>
</cfif><br>
                    </td>
                  </tr>
              </table></td>
              <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
            </tr>
            <tr>
              <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c11" alt="" /></td>
              <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
              <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c12" alt="" /></td>
            </tr>
          </table>
          
          </td>
      </tr>
    </table><br>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="170">
  <tr>
    <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c" alt="" /></td>
    <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><strong>Admin Utilities</strong></td>
    <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c2" alt="" /></td>
  </tr>
  <tr>
    <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
    <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
      <tr>
        <td valign="top"><a href="index.cfm" onMouseover="changetext(content[9])">Admin Main</a><br>
              <a href="logout.cfm" onMouseover="changetext(content[10])">Logout</a></td></tr>
    </table></td>
    <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c23" alt="" /></td>
    <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
    <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c24" alt="" /></td>
  </tr>
</table></td>
    <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1_menu.jpg" width="11" height="20" border="0" id="menu_r3_c3" alt="" /></td>
    <td background="assets/main_box/admin_r3_c2_menu.jpg">&nbsp;</td>
    <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3_menu.jpg" width="11" height="20" border="0" id="menu_r3_c4" alt="" /></td>
  </tr>
</table>
<br>

</cfif>
<CFELSEIF ThisTag.ExecutionMode IS "End">
</CFIF>