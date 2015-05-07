<cfoutput>
<cfset myNewSiteID = CreateUUID()>

<p>Your site ID will be #myNewSiteID#</p>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td height="24" colspan="3" background="assets/install_wiz_r2_c8.jpg" class="style1"><b>Step 00#url.step#: #step_description# </b></td>
       </tr>
     <tr>
       <td width="2%">&nbsp;</td>
       <td width="96%">This Section of the installer will now Configure the Most Common Site Configurables.<hr />
       <form name="step2" action="?step=3" method="post">
       <input type="hidden" name="siteID" value="#myNewSiteID#" />
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%">Site Domain:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><input type="text" name="site_domain" id="site_domain" value="#site_domain#"/></td>
  </tr>
  <tr>
    <td width="48%">Site Folder: Type in the name of the folder - no dashes or spaces or slashes</td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><input type="text" name="site_folder" id="site_folder" value="#site_folder#"/></td>
  </tr>
  <tr>
    <td width="48%">Site Name:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><input type="text" name="site_name" id="site_name" value="#site_name#"/></td>
  </tr>
  <tr>
    <td>Site Mail Server:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_mail_server" id="site_mail_server" value="#site_mail_server#"/></td>
  </tr>
  <tr>
    <td width="48%">Site Email:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><input type="text" name="site_email" id="site_email" value="#site_email#"/></td>
  </tr>
  <tr>
    <td>Site License:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_license" id="site_license" value="#site_license#"/></td>
  </tr>
  <tr>
    <td>Site Type:</td>
    <td>&nbsp;</td>
    <td><select name="site_type" id="site_type">
      <option>Please Select a Site type</option>
      <option value="Chiro">Chiro Site</option>
      <option value="dev">Development Site</option>
      <!--- <option value="financial">Financial Site</option>
      <option value="legal">Legal Site</option>
      <option value="portal">Online Portal</option>
      <option value="directory">Directory </option> --->
      <!---<option value="ecomm">E-Commerce Site</option>--->
    </select>    </td>
  </tr>
  <tr>
    <td>Site Location - is this the site url?</td>
    <td>&nbsp;</td>
    <td><input type="text" name="site_location" id="site_location" value="#site_location#"/></td>
  </tr>
  <tr>
    <td width="48%">Client Name:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><input type="text" name="client_name" id="client_name" value="#client_name#"/></td>
  </tr>
  <tr>
    <td>Client Email:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="client_email" id="client_email" value="#site_email#"/></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
  </tr>
</table>
<table border="0" align="right" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="assets/button/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.step2.submit();" class="Button">Step 3 >></a></td>
    <td width="7" height="20"><img src="assets/button/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>
</form></td>
       <td width="2%">&nbsp;</td>
     </tr>
   </table>
</cfoutput>