<cfset current_box ="user_login.cfm">
<cfquery datasource="#datasrc#" name="detect_column">
select * from #table_sideboxes# where side_box_filename ='#current_box#'
</cfquery>

<cfif #detect_column.side_box_column# EQ "left">
<div id="login" class="boxed">
<!---\\Box Title//--->
<div class="title"><h2><cfoutput query="detect_column">#side_box_name#</cfoutput></h2>
  
</div> 
<!---\\End box Title//--->
<!---\\Box Content//--->
<div class="content">           
<cfif NOT isDefined('session.allowin') or #session.allowin# EQ "No">
              <form action="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=login" method="post" name="frmLogin">
		<input type="hidden" name="logon" value="1">
		<table align="center" class="plain">
			<tr>
				<td><b>Username:</b></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
			  <td colspan="2"><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c2" alt="" /></td>
                  <td><input type="text" name="username" id="username"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:17px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>username.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;"/></td>
                  <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c4" alt="" /></td>
                </tr>
              </table></td>
		    </tr>
			<script language="Javascript">
			document.frmLogin.username.focus();
			</script>
			<tr>
				<td><b>Password:</b></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
			  <td colspan="2"><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c1" alt="" /></td>
                  <td><input type="password" name="password" id="password"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:17px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>password.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;"/></td>
                  <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c3" alt="" /></td>
                </tr>
              </table></td>
		    </tr>
			

			<tr>
				<td colspan="2" align="right">
				<b>Remember me on this computer</b>
				<input type="checkbox" name="persistentCookie" value="1">				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="right">
				<!---<!---<input type="submit" class="button" name="logon" value="Login">--->
				 <input type="image" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#forum/#site_assets_dir#btn_login.gif" alt="Login" width="71" height="19" name="logon"> --->
				<table border="0" align="center" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.frmLogin.submit();" class="Button">Login</a></td>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>				</td>
			</tr>
		</table>
    
    </form>
    <cfelseif isDefined('session.allowin') and #session.allowin# NEQ "No">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" colspan="2">Your Profile Options</td>
  </tr>
<!---\\ User Profile //--->
<cfif isDefined('url.section') and #url.section# EQ "main"> 
  <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=main" class="menu_items">&nbsp;Profile Main</a></b></td>
  </tr>
  <cfelse>
    <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=main" class="menu_items">&nbsp;Profile Main</a></td>
  </tr>
  </cfif>
<cfif isDefined('url.section') and #url.section# EQ "profile"> 
  <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=profile" class="menu_items">&nbsp;Update your Profile</a></b></td>
  </tr>
  <cfelse>
    <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=profile" class="menu_items">&nbsp;Update your Profile</a></td>
  </tr>
  </cfif>
  <cfif isDefined('url.section') and #url.section# EQ "subscriptions"> 
  <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=subscriptions" class="menu_items">&nbsp;Manage Subscriptions</a></b></td>
  </tr>
  <cfelse>
    <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=subscriptions" class="menu_items">&nbsp;Manage Subscriptions</a></td>
  </tr>
  </cfif>
  <!---\\Reserved for Additional Modules//--->
  
  <!---\\End of Additional Modules//--->
   <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Logout" width="7" height="12"> </td>
      <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=logout" class="menu_items">&nbsp;Logout</a></td>
  </tr>   
</table>

                </cfif>
</div>
<!---\\end Box Content//--->
</div>
<cfelseif #detect_column.side_box_column# EQ "right">
<div id="login" class="boxed">
<!---\\Box Title//--->			
<div class="title">
<h2><cfoutput query="detect_column">#side_box_name#</cfoutput></h2>
</div>
<!---\\End Box Title//--->
<!---\\Box Content //--->            
<div class="content">
	<cfif NOT isDefined('session.allowin') or #session.allowin# EQ "No">
              <form action="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=login" method="post" name="frmLogin">
		<input type="hidden" name="logon" value="1">
		<table align="center" class="plain">
			<tr>
				<td><b>Username:</b></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
			  <td colspan="2"><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" alt="" name="index_r1_c1" width="10" height="19" border="0" align="top" id="index_r1_c2" /></td>
                  <td><input type="text" name="username" id="username"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:17px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>username.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;"/></td>
                  <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" alt="" name="index_r1_c3" width="10" height="19" border="0" align="top" id="index_r1_c4" /></td>
                </tr>
              </table></td>
		    </tr>
			<script language="Javascript">
			document.frmLogin.username.focus();
			</script>
			<tr>
				<td><b>Password:</b></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
			  <td colspan="2"><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c1" alt="" /></td>
                  <td><input type="password" name="password" id="password"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:17px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>password.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;"/></td>
                  <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c3" alt="" /></td>
                </tr>
              </table></td>
		    </tr>
			

			<tr>
				<td colspan="2" align="right">
				<b>Remember me on this computer</b>
				<input type="checkbox" name="persistentCookie" value="1">				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="right">
				<!---<!---<input type="submit" class="button" name="logon" value="Login">--->
				 <input type="image" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#forum/#site_assets_dir#btn_login.gif" alt="Login" width="71" height="19" name="logon"> --->
				<table border="0" align="center" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.frmLogin.submit();" class="Button">Login</a></td>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>				</td>
			</tr>
		</table>
    
    </form>
    <cfelseif isDefined('session.allowin') and #session.allowin# NEQ "No">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" colspan="2">Your Profile Options</td>
  </tr>
<!---\\ User Profile //--->
<cfif isDefined('url.section') and #url.section# EQ "main"> 
  <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=main" class="menu_items">&nbsp;Profile Main</a></b></td>
  </tr>
  <cfelse>
    <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=main" class="menu_items">&nbsp;Profile Main</a></td>
  </tr>
  </cfif>
<cfif isDefined('url.section') and #url.section# EQ "profile"> 
  <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=profile" class="menu_items">&nbsp;Update your Profile</a></b></td>
  </tr>
  <cfelse>
    <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=profile" class="menu_items">&nbsp;Update your Profile</a></td>
  </tr>
  </cfif>
  <cfif isDefined('url.section') and #url.section# EQ "subscriptions"> 
  <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=subscriptions" class="menu_items">&nbsp;Manage Subscriptions</a></b></td>
  </tr>
  <cfelse>
    <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Home" width="7" height="12"> </td>
   <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=subscriptions" class="menu_items">&nbsp;Manage Subscriptions</a></td>
  </tr>
  </cfif>
  <!---\\Reserved for Additional Modules//--->
  
  <!---\\End of Additional Modules//--->
   <tr> <td width="7"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Logout" width="7" height="12"> </td>
      <td>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=logout" class="menu_items">&nbsp;Logout</a></td>
  </tr>   
</table>

                </cfif>			
</div>
<!---\\End Box Content//--->
</div>
</cfif>
