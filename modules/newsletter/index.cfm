<cfif isDefined('url.action') and #url.action# EQ "subscribe">
<!---\\ Subscribe Routine //--->
<!--- Insert Member Information Into Database --->
<CFINSERT DATASOURCE="#datasrc#" TABLENAME="#table_newsletters#" Formfields="userid, firstname, lastname, email, emailtype">
<br><cfoutput>
Thank you #form.firstname# #form.lastname#, for subscribing to our newsletters.<br><br>
Your Email address <b><i>#form.email#</i></b> will now be recieving our newsletters.
<br></cfoutput>
<cfquery name="is_subscribed" datasource="#datasrc#">
update #table_usrs# set newsletter_sign_up ='1' where id ='#session.user_id#'
</cfquery>
<cfelseif isDefined('url.action') and #url.action# EQ "unsubscribe">
<!---\\ Unsubscribe Routine//--->
<br><cfoutput>
Thank you #form.firstname#, for un-subscribing to our newsletters.<br><br>
Your Email address <b><i>#form.email#</i></b> will not be recieving our newsletters any further.
</cfoutput>
<cfquery name="un_subscribed" datasource="#datasrc#">
update #table_usrs# set newsletter_sign_up ='0' where id ='#session.user_id#'
</cfquery>
<cfquery name="remove_list" datasource="#datasrc#">
DELETE FROM #table_newsletters# WHERE email = '#form.email#'
</cfquery>
<br>
<cfelseif isDefined('url.action') and #url.action# EQ "archives">
<cfinclude template="newsletter_archives.cfm">
<cfelseif isDefined('url.section') and #url.section# EQ "newsletter_archives">
<cfinclude template="newsletter_archives.cfm">
<cfelse>
<!---\\ Default Display //--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title"><cfoutput>#site_name#</cfoutput> Newsletters</td>
  </tr>
  <tr>
    <td>
    <cfif session.allowin EQ "Yes">
    <cfquery name="is_subscribed" datasource="#datasrc#">
    select newsletter_sign_up from #table_usrs# where id='#session.user_id#'
    </cfquery>
    <cfif is_subscribed.newsletter_sign_up EQ "1">
	<!---\\ Displays Current Newsletter //--->
    <br>
    <a href="http://#site_domain##site_folder#index.cfm?module=newsletter&action=unsubscribe">Unsubscribe</a> from <cfoutput>#site_name#</cfoutput> Newsletters.<br><br>
    <a href="http://#site_domain##site_folder#index.cfm?module=newsletter&action=archives">View our Newsletter Archives</a>
    </cfif>
	<cfelse>
    <!---\\ Subscribe form goes here //--->
    <form action="http://#site_domain##site_folder#index.cfm?module=newsletter&action=subscribe" method="post" name="newsletter1">
    <cfif #session.allowin# EQ "Yes">
    <input type="hidden" name="userid" value="<cfoutput>#session.user_id#</cfoutput>" />
    </cfif>
       <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr>
       <td><strong>Firstname:</strong></td>
     </tr>
     <tr>
       <td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/_assets/text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c1" alt="" /></td>
   <td><input type="text" name="FirstName" id="FirstName"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:15px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/_assets/_icons/username.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;" /></td>
   <td><img name="index_r1_c3" src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/_assets/text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c3" alt="" /></td>
</tr>
</table></td>
     </tr>
     <tr>
       <td><strong>Lastname:</strong></td>
     </tr>
     <tr>
       <td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/_assets/text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c1" alt="" /></td>
   <td><input type="text" name="LastName" id="LastName"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:15px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/_assets/_icons/username.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;"/></td>
   <td><img name="index_r1_c3" src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/_assets/text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c3" alt="" /></td>
</tr>
</table></td>
     </tr>
     <tr>
       <td><strong>Email Address:</strong></td>
     </tr>
     <tr>
       <td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/_assets/text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c1" alt="" /></td>
   <td><input type="text" name="email" id="email"  style="border-bottom: 1px solid #6c7a83; border-top: 1px solid #6c7a83; width:112px; height:15px; border-left: 0px solid #6c7a83; border-right: 0px solid #6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/_assets/_icons/email.jpg); background-repeat: no-repeat;background-position: left center; background-color:#FFFFFF;" /></td>
   <td><img name="index_r1_c3" src="<cfoutput>http://#site_domain##site_folder#</cfoutput>admin/_assets/text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c3" alt="" /></td>
</tr>
</table></td>
     </tr>
   </table><!--- <input type="Submit" Value="Join Newsletter">--->
         <table border="0" align="center" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.newsletter1.submit();" class="Button">Subscribe</a></td>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>
     </FORM>
    </cfif> 
    
    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"><a href="http://#site_domain##site_folder#index.cfm?module=newsletter&action=archives">View our Newsletter Archives</a>
    </td>
  </tr>
</table>
</cfif>