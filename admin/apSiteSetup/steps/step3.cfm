<cfoutput>
<!---
 Mod By : AP
 Mod : leftColActive cfparam
--->
<cfparam name="form.leftcolactive" default="1">

<!---\\ Template Configuration //--->
<cfdirectory directory="#ExpandPath("../../templates/")#" action="list" name="dir">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td height="24" colspan="3" background="assets/install_wiz_r2_c8.jpg" class="style1"><b>Step 00#url.step#: #step_description# </b></td>
       </tr>
     <tr>
       <td width="2%">&nbsp;</td>
       <td width="96%">This Section of the installer will now Configure your Templates Settings.
         <hr />
       <form name="step3" action="?step=4" method="post">
       <!---\\ Configurables from Step 2 //--->
       <input type="hidden" name="siteID" value="#form.siteID#"/>
       <input type="hidden" name="site_domain" value="#form.site_domain#" />
       <input type="hidden" name="site_folder" value="#form.site_folder#" />
       <input type="hidden" name="site_name" value="#form.site_name#" />
       <input type="hidden" name="site_mail_server" value="#form.site_mail_server#" />
       <input type="hidden" name="site_email" value="#form.site_email#" />
       <input type="hidden" name="site_license" value="#form.site_license#" />
       <input type="hidden" name="site_type" value="#form.site_type#" />
       <input type="hidden" name="site_location" value="#form.site_location#" />
       <input type="hidden" name="client_name" value="#form.client_name#" />
       <input type="hidden" name="client_email" value="#form.client_email#" />
       <!---\\ End of Configurables //--->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%">Site Template:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><select name="site_template" id="site_template">
          <option>Please Select a Template</option>
         <cfloop query="dir">
         <option value="#dir.name#">#dir.Name#</option>
         </cfloop>
         </select>         </td>
  </tr>
  <tr>
    <td>Site Templates Folder - don't need:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_template_dir" id="site_template_dir" value="#site_template_dir#"/></td>
  </tr>
  <tr>
    <td width="48%">Site Admin Folder - don't need :</td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><input type="text" name="site_admin_dir" id="site_admin_dir" value="#site_admin_dir#"/></td>
  </tr>
  <tr>
    <td width="48%">Site Modules Folder - don't need: </td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><input type="text" name="site_modules_dir" id="site_modules_dir" value="#site_modules_dir#"/></td>
  </tr>
  <tr>
    <td width="48%">Site Assets Folder:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><input type="text" name="site_assets_dir" id="site_assets_dir" value="#site_assets_dir#"/></td>
  </tr>
  <tr>
    <td>Site Header:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_header" id="site_header" value="#site_header#"/></td>
  </tr>
  <tr>
    <td>Site Footer:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_footer" id="site_footer" value="#site_footer#"/></td>
  </tr>
  <tr>
    <td>Site Width:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_width" id="site_width" value="#site_width#"/></td>
  </tr>
  <tr>
    <td width="48%">Enable Left Column:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><input name="left_col_active" type="radio" value="1" <cfif #left_col_active# EQ "1">checked</cfif>>Yes <input name="left_col_active" type="radio" value="0" <cfif left_col_active EQ "0">checked</cfif>>No</td>
  </tr>
  <tr>
    <td>Left Column Width:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="left_col_width" id="lefT_col_width" value="#lefT_col_width#"/></td>
  </tr>
  <tr>
    <td>Side Boxes Dir:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_side_boxes" id="site_side_boxes" value="#site_side_box#"/></td>
  </tr>
  <tr>
    <td>Enable Right Column:</td>
    <td>&nbsp;</td>
    <td><input name="right_col_active" type="radio" value="1" <cfif #right_col_active# EQ "1">checked</cfif> />
      Yes
      <input name="right_col_active" type="radio" value="0" <cfif #right_col_active# EQ "0">checked</cfif>>No</td>
  </tr>
  <tr>
    <td>Right Column width:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="right_col_width" id="right_col_width" value="#right_col_width#"/></td>
  </tr>
  <tr>
    <td>Site Headers Dir:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_header_dir" id="site_header_dir" value="#site_header_dir#"/></td>
  </tr>
  <tr>
    <td>Site Footers Dir:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_footer_dir" id="site_footer_dir" value="#site_footer_dir#"/></td>
  </tr>
  <tr>
    <td>Site Scripts Dir:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_scripts_dir" id="site_scripts_dir" value="#site_scripts_dir#"/></td>
  </tr>
  <tr>
    <td>Site Style Sheet:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_style_sheet" id="site_style_sheet" value="#site_style_sheet#"/></td>
  </tr>
  <tr>
    <td>Site Styles Dir:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_styles_dir" id="site_styles_dir" value="#site_styles_dir#" /></td>
  </tr>
  <tr>
    <td>Main Template Index:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="template_file" id="template_file" value="#template_file#"/></td>
  </tr>
</table>
<table border="0" align="right" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="assets/button/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.step3.submit();" class="Button">Step 4 >></a></td>
    <td width="7" height="20"><img src="assets/button/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>
</form>
</td>
</tr>
</table>
</cfoutput>