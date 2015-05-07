<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" colspan="2">Our Newsletter</td>
</tr>
<cfif isdefined('session.allowin') and #session.allowin# EQ "Yes">
<!---\\User session is Defined, and user is logged in//--->
<tr><td>
<cfif isDefined('session.user_id') and session.user_id NEQ "0">
  <!---\\ We're now goin to check to see if this user signed up for the newsletter when they registered, or updated thier profile//--->
  
   
   <cfquery name="is_subscribed" datasource="#datasrc#">
    Select * from #table_usrs# where username='#session.username#'
   </cfquery> 
<!--- if user is already subscribed --->
<cfif is_subscribed.newsletter_sign_up EQ "1"> 
You're signed up to our newsletters.<br>
Click on the 'Unsubscribe' Button below to be removed.<br>
<!---\\ unsubscribe form //--->
<form action="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=newsletter&action=unsubscribe" method="post" name="unsub">
     <cfif #session.allowin# EQ "Yes">
     <input type="hidden" value="#requesr.user.id#" name="id" />
     </cfif>
     <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr>
       <td><strong>Firstname:</strong></td>
     </tr>
     <tr>
       <td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c2" alt="" /></td>
   <td><input type="text" name="FirstName" id="FirstName"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:15px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>username.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;" value="<cfoutput>#is_subscribed.firstname#</cfoutput>"/></td>
   <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c4" alt="" /></td>
</tr>
</table></td>
     </tr>
     <tr>
       <td><strong>Lastname:</strong></td>
     </tr>
     <tr>
       <td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c2" alt="" /></td>
   <td><input type="text" name="LastName" id="LastName"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:15px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>username.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;" value="<cfoutput>#is_subscribed.lastname#</cfoutput>"/></td>
   <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c4" alt="" /></td>
</tr>
</table></td>
     </tr>
     <tr>
       <td><strong>Email Address:</strong></td>
     </tr>
     <tr>
       <td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c2" alt="" /></td>
   <td><input type="text" name="email" id="email"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:15px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>email.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;" value="<cfoutput>#is_subscribed.emailaddress#</cfoutput>"/></td>
   <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c4" alt="" /></td>
</tr>
</table></td>
     </tr>
   </table>
      <BR>
       <table border="0" align="center" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.unsub.submit();" class="Button">Un-Subscribe</a></td>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>
    </FORM>
<!--- if user is not subscribed --->
<cfelseif is_subscribed.newsletter_sign_up EQ "0">
You haven't signed up for our newsletters.<br>
Click on the 'Subscribe' Button below to subscribe.<br>
<!---\\ Subscribe Form //--->
<form action="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=newsletter&action=subscribe" method="post" name="unsub">
     <cfif #session.allowin# EQ "Yes">
     <input type="hidden" value="#request.user.id#" name="id" />
     </cfif>
     <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr>
       <td><strong>Firstname:</strong></td>
     </tr>
     <tr>
       <td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c2" alt="" /></td>
   <td><input type="text" name="FirstName" id="FirstName"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:15px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>username.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;" value="<cfoutput>#is_subscribed.firstname#</cfoutput>"/></td>
   <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c4" alt="" /></td>
</tr>
</table></td>
     </tr>
     <tr>
       <td><strong>Lastname:</strong></td>
     </tr>
     <tr>
       <td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c2" alt="" /></td>
   <td><input type="text" name="LastName" id="LastName"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:15px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>username.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;" value="<cfoutput>#is_subscribed.lastname#</cfoutput>"/></td>
   <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c4" alt="" /></td>
</tr>
</table></td>
     </tr>
     <tr>
       <td><strong>Email Address:</strong></td>
     </tr>
     <tr>
       <td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c2" alt="" /></td>
   <td><input type="text" name="email" id="email"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:15px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>email.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;" value="<cfoutput>#is_subscribed.emailaddress#</cfoutput>"/></td>
   <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c4" alt="" /></td>
</tr>
</table></td>
     </tr>
   </table>
      <BR>
       <table border="0" align="center" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.unsub.submit();" class="Button">Subscribe</a></td>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>
    </FORM>
</cfif>
</cfif>
</td>
</tr>
<cfelseif isdefined('session.allowin') and #session.allowin# eq "No">
<!---\\ User is not logged in, or registered //--->
<tr>
<td>
<!---\\ Show Subscribe Form //--->
<!---\\ Subscribe Form //--->
<form action="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=newsletter&action=subscribe" method="post" name="unsub">
     
     <input type="hidden" value="anonymous_user_sign_up" name="id" />
     
     <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr>
       <td><strong>Firstname:</strong></td>
     </tr>
     <tr>
       <td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c2" alt="" /></td>
   <td><input type="text" name="FirstName" id="FirstName"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:15px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>username.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;" /></td>
   <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c4" alt="" /></td>
</tr>
</table></td>
     </tr>
     <tr>
       <td><strong>Lastname:</strong></td>
     </tr>
     <tr>
       <td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c2" alt="" /></td>
   <td><input type="text" name="LastName" id="LastName"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:15px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>username.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;" /></td>
   <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c4" alt="" /></td>
</tr>
</table></td>
     </tr>
     <tr>
       <td><strong>Email Address:</strong></td>
     </tr>
     <tr>
       <td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c2" alt="" /></td>
   <td><input type="text" name="email" id="email"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:15px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>email.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;" /></td>
   <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c4" alt="" /></td>
</tr>
</table></td>
     </tr>
   </table>
      <BR>
       <table border="0" align="center" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.unsub.submit();" class="Button">Subscribe</a></td>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>
    </FORM>
Have you become a member of our site? You can for FREE!<br>
<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=register">Click Here</a>
</td>
</tr>
</table>
</cfif>