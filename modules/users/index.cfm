<cfsetting enablecfoutputonly=true>


<cfoutput>
<cfif isDefined('url.action') and #url.action# EQ "register">
<cftransaction>
<cfquery name="check_user" datasource="#datasrc#">
select username from #table_usrs# where username ='#form.username_new#'
</cfquery>
<cfif #check_user.recordcount# NEQ "0">
<cflocation url="?module=users&section=register&msg=Username Exists" addtoken="no">
<cfelseif #check_user.recordcount# EQ "0">
<cfquery name="new_user" datasource="#datasrc#">
insert into #table_usrs# (id, username, password, emailaddress, sign_up_date) values ('#CreateUUID()#', '#form.username_new#', '#form.password_new#', '#form.emailaddress#', '#dateformat(now(), "MM/DD/YYYY")#')
</cfquery>
</cfif>
</cftransaction>
</cfif>
<cfif NOT isdefined('url.section')>
<!---\\ Loads the Default Login Gateway //--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableDisplay">
	<tr class="tableHeader">
		<td class="breadcrumb_nav">Login</td>
	</tr>
    <cfif isDefined('url.msg')>
        <tr> <td bgcolor="##00CC00"><font color="##006600"><b>#url.msg#</b></font></td></tr>
        </cfif>
	<tr class="tableRowMain">
		<td>
        
		Please use the form below to login.
		</td>
	</tr>
	<tr class="tableRowMain">
		<td>
		<form action="?module=users&section=login" method="post" name="frmLogin">
		<input type="hidden" name="logon" value="1">
		<table align="center" class="plain">
			<tr>
				<td><b>Username:</b></td>
				<td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c1" alt="" /></td>
   <td><input type="text" name="username" id="username"  style="border-bottom: 1px solid ##6c7a83; border-top: 1px solid ##6c7a83; width:112px; height:15px; border-left: 0px solid ##6c7a83; border-right: 0px solid ##6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>username.jpg); background-repeat: no-repeat;background-position: left center; background-color:##FFFFFF;"/></td>
   <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c3" alt="" /></td>
</tr>
</table></td>
			</tr>
			<script language="Javascript">
			document.frmLogin.username.focus();
			</script>
			<tr>
				<td><b>Password:</b></td>
				<td><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img name="index_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_field_left.jpg" width="10" height="19" border="0" id="index_r1_c1" alt="" /></td>
   <td><input type="password" name="password" id="password"  style="border-bottom: 1px solid ##6c7a83; border-top: 1px solid ##6c7a83; width:112px; height:15px; border-left: 0px solid ##6c7a83; border-right: 0px solid ##6c7a83; font-size:8px;font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; padding-left: 20px; background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>password.jpg); background-repeat: no-repeat;background-position: left center; background-color:##FFFFFF;"/></td>
   <td><img name="index_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>text_fields_right.jpg" width="10" height="19" border="0" id="index_r1_c3" alt="" /></td>
</tr>
</table></td>
			</tr>
			

			<tr>
				<td colspan="2" align="right">
				<b>Remember me on this computer</b>
				<input type="checkbox" name="persistentCookie" value="1">
				</td>
			</tr>
			<tr>
				<td>Not a Member? <a href="http://#site_domain##site_folder#index.cfm?module=users&amp;section=register">Register Now</a>!</td>
				<td align="right">
				<!---<input type="submit" class="button" name="logon" value="Login">--->
				 <input type="image" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#forum/#site_assets_dir#btn_login.gif" alt="Login" width="71" height="19" name="logon"> 
				
				</td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
</table>    
<cfelseif isDefined('url.section') and #url.section# EQ "register">    
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableDisplay">
	<tr class="tableHeader">
		<td >Register</td>
	</tr>
	<tr class="tableRowMain">
		<td>
		In Order to Participate on the <i><cfoutput>#site_name#</cfoutput></i> website, we require that you register as a user.
		</td>
	</tr>
    <cfif isDefined('url.msg')>
    <tr class="tableRowMain"><td><div align="center"><b><cfoutput>#url.msg#</cfoutput></b></div></td></tr>
    </cfif>
	<tr class="tableRowMain">
		<td>
		<form action="?module=users&action=register" method="post">
		<input type="hidden" name="register" value="1">
        <input type="hidden" name="ref" value="#cgi.HTTP_REFERER#" />
		<table class="plain">
			<tr>
				<td><b>Username: </b></td>
				<td><input type="text" name="username_new" class="formBox"></td>
			</tr>
			<tr>
				<td><b>Email Address: </b></td>
				<td><input type="text" name="emailaddress" class="formBox"></td>
			</tr>
			<tr>
				<td><b>Password: </b></td>
				<td><input type="password" name="password_new" class="formBox"></td>
			</tr>
			<tr>
				<td><b>Confirm Password: </b></td>
				<td><input type="password" name="password_new2" class="formBox"></td>
			</tr>
			<tr>
			<tr>
				<td>&nbsp;</td>
				<td align="right">
					<!---<input type="submit" class="button" name="register" value="Register">--->
					<input type="image" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#forum/#site_assets_dir#btn_register.gif" alt="Register" width="71" height="19">
				</td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
</table>
<cfelseif isDefined('url.section') and #url.section# EQ "lost_pass">
<table class="tableDisplay">    
	<tr class="tableHeader">
		<td>Lost Password</td>
	</tr>
	<tr class="tableRowMain">
		<td>
		<cfif application.settings.encryptPasswords is 0 and application.settings.allowPasswordReminder is 1>
			If you cannot remember your password, enter your username in the form below and your login information will be sent to you.
		<cfelse>
			If you cannot remember your password, enter your username in the form below and a link will be sent that allows you to reset your password.
		</cfif>
		</td>
	</tr>
	<tr class="tableRowMain">
		<td>
		<form action="?module=users&section=lost_pass_sending" method="post">
		<input type="hidden" name="reminder" value="1">
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="plain">
<tr>
				<td><b>Username:</b></td>
				<td><input type="text" name="username_lookup" class="formBox"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="right">
				<!---<input type="submit" class="button" name="btnReminder" value="Send Password Reminder">--->
				 <input type="image" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#forum/#site_assets_dir#btn_sendpasswordreminder.gif" alt="Login" width="149" height="19" name="logon"> 
				</td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
    </table>
<cfelseif isdefined('url.section') and #url.section# EQ "lost_pass_sending">
<cfquery name="lost_pass" datasource="#datasrc#">
  select * from #table_usrs# where username ='#form.username_lookup#'
  </cfquery>
  <cfif #lost_pass.recordcount# EQ "0">
   <cflocation addtoken="no" url="?module=users&section=user_notfound&user=#form.username_lookup#">
  <cfelseif #lost_pass.recordcount# NEQ "0"> 
   <cfset form.username = #lost_pass.username#>
   <cfset form.password = #lost_pass.password#>
   <cfset form.referrer = "users_lost_pass">
   <cfset form.subject = "Lost Password information for #lost_pass.username# on #site_name#">
   <cfset form.thanks_location ="?module=users&section=lost_pass_sent&user=#form.username_lookup#">
   <cfinclude template="../../functions/webos_mailer.cfm">
   </cfif>
<cfelseif isDefined('url.section') and #url.section# EQ "user_notfound">
<table width="100%" align="center" class="tableDisplay">     
		<tr class="tableHeader">
		<td>Error: No Information Found for #url.user# !</td>
	</tr>
	<tr class="tableRowMain">
		<td>
        The Information you submitted could not be found. Did you <a href="?module=users&section=register">Regsiter</a>?<br />
        <br /> If so, would you like to <a href="?module=users&section=lost_pass">try again</a>?
       </td>
        </tr>
      </table>       
<cfelseif isDefined('url.section') and #url.section# EQ "lost_pass_sent">
  <cftransaction>
  <cfquery name="lost_pass" datasource="#datasrc#">
  select * from #table_usrs# where username ='#url.user#'
  </cfquery>
  </cftransaction>  
   <table width="100%" align="center" class="tableDisplay">     
		<tr class="tableHeader">
		<td>Lost Password for #url.user# Sent!</td>
	</tr>
	<tr class="tableRowMain">
		<td>
  Information for #url.user# has been sent to the email address on file:<br />
  <br /> Email Address on File: 
  <cfset pos = find("@", "#lost_pass.emailaddress#")>
  <cfset remove_pos = pos-1>
   <!---#lost_pass.emailaddress#<br />--->
   xxxx<i>#RemoveChars(lost_pass.emailaddress, 1, remove_pos)#</i>
   
   </td>
   </tr>
   </table>
    
<cfelseif isDefined('url.section') and #url.section# EQ "confirm_account">
<table class="tableDisplay">     
	<cfif application.settings.accountConfirmation neq "none">
	<tr class="tableHeader">
		<td>Confirm Account</td>
	</tr>
	<tr class="tableRowMain">
		<td>
		<cfif application.settings.accountConfirmation eq "user">
			In order to confirm your account, you must click on a link in an email that we send to the email address you registered with.
		<cfelse>
			Your account must be activated by a board administrator.  If you feel you need to send the board administrator
			another activation request, enter your username below.
		</cfif>
		</td>
	</tr>
	<tr class="tableRowMain">
		<td>
		<form action="#cgi.script_name#?#cgi.query_string#" method="post">
		<input type="hidden" name="confirmation" value="1">
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="plain">
			<tr>
				<td><b>Username:</b></td>
				<td><input type="text" name="username_lookup" class="formBox"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="right">
				<!---<input type="submit" class="button" name="btnConfirmation" value="Request Account Confirmation">--->
				 <input type="image" src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#forum/#site_assets_dir#btn_sendpasswordreminder.gif" alt="Login" width="149" height="19" name="logon"> 
				</td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
	</cfif>
</table>
</p>
#application.settings.accountConfirmation#
<cfelseif isDefined('url.section') and #url.section# EQ "logout">
<CFLOCK SCOPE="SESSION" TYPE="EXCLUSIVE" TIMEOUT="2">
<CFSET StructClear(Session)>
</CFLOCK>
<!---\\ Logs the User out and Redirects them to the Main Page //--->
Thank you for Logging out. We will now redirect you to the main page.
<script type="text/javascript">
<!--
function delayer(){
	document.location = "http://<cfoutput>#site_domain##site_folder#/</cfoutput>index.cfm"
}
//-->
</script>
<script>
setTimeout('delayer()', 3000);
</script>
<!---<cflocation url="index.cfm" addtoken="no">--->
<cfelseif isDefined('url.section') and #url.section# EQ "login">
<cfquery name="login" datasource="#datasrc#">
select * from #table_usrs# where username = '#form.username#' and password = '#form.password#'
</cfquery>
<cfif #login.recordcount# EQ "0">
<cflocation url="?module=users&msg=Invalid Username and/or password. Please Try Again.">
<cfelse>
<CFSET session.allowin ="Yes">
<CFSET session.superuser ="false">
<CFSET session.user_id = "#login.id#">
<CFSET session.username ="#login.username#">
<cflocation url="?module=users&section=main">
</cfif>
<cfelseif isDefined('url.section') and #url.section# EQ "main">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <cfif isDefined('url.msg')>
        <tr> <td bgcolor="##00CC00"><font color="##006600"><b>#url.msg#</b></font></td></tr>
        </cfif>
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Welcome <i><cfoutput>#session.username#</cfoutput></i> to Your Profile!</td>
  </tr>
  <tr>
    <td>We've got some quick links to assist you in keeping your profile Up-to-Date. Please Select an Action below.
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="48%" align="left" valign="top"><a href="?module=users&amp;section=profile"><img src="<cfoutput>http://#site_domain##site_folder##site_template_dir##site_template#</cfoutput>/modules/users/update_profile.jpg" width="38" height="49" border="0" align="absmiddle" />Update your Profile</a></td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="left" valign="top"><a href="?module=users&amp;section=subscriptions"><img src="<cfoutput>http://#site_domain##site_folder##site_template_dir##site_template#</cfoutput>/modules/users/update_subscriptions.jpg" width="38" height="49" border="0" align="absmiddle" />Manage your Subscriptions</a></td>
        </tr>
        <tr>
          <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="left" valign="top">&nbsp;</td>
        </tr>
        <!---\\Reserved for More Modules//--->
        <cfif module_bmi_profile EQ "1">
 <tr>
          <td width="48%" align="left" valign="top"><a href="?module=bmi_profile&amp;section=quiz"><img src="<cfoutput>http://#site_domain##site_folder##site_template_dir##site_template#</cfoutput>/modules/users/update_quiz.jpg" width="38" height="49" border="0" align="absmiddle" />Take the Quiz</a></td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="left" valign="top"><a href="?module=bmi_profile&amp;section=goals"><img src="<cfoutput>http://#site_domain##site_folder##site_template_dir##site_template#</cfoutput>/modules/users/update_goals.jpg" width="38" height="49" border="0" align="absmiddle" />Reset Your Personal Goals</a></td>
        </tr>
           <tr>
          <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="left" valign="top">&nbsp;</td>
        </tr>
         <tr>
          <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="left" valign="top"><a href="?module=bmi_profile&amp;section=progress_log"><img src="<cfoutput>http://#site_domain##site_folder##site_template_dir##site_template#</cfoutput>/modules/users/update_log.jpg" width="38" height="49" border="0" align="absmiddle" />Log your Progress</a></td>
        </tr>
        <tr>
          <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="left" valign="top">&nbsp;</td>
        </tr>
        </cfif>
        <!---\\End of Module Reservation//--->
                        <tr>
          <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="48%" align="left" valign="top"><a href="?module=users&amp;section=logout"><img src="<cfoutput>http://#site_domain##site_folder##site_template_dir##site_template#</cfoutput>/modules/users/logout.jpg" width="38" height="49" border="0" align="absmiddle" />Logout</a></td>
        </tr>
      </table><hr width="95%" align="center"/>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Profile Stats for : <i><cfoutput>#session.username#</cfoutput></i></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="48%" align="left" valign="top">Current IP Address:</td>
        <td width="2%">&nbsp;</td>
        <td width="48%" align="left" valign="top"><cfoutput>#cgi.REMOTE_HOST#</cfoutput></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Current Browser/Operating System:</td>
        <td width="2%">&nbsp;</td>
        <td width="48%" align="left" valign="top"><cfoutput>#cgi.HTTP_USER_AGENT#</cfoutput></td>
      </tr>
      </table>      </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"></td>
  </tr>
   
</table>
      
      </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"></td>
  </tr>
   
</table>

<cfelseif isDefined('url.section') and #url.section# EQ "profile">
<cfsetting enablecfoutputonly=true>



<cfif not session.allowin>
	<cfset thisPage = cgi.script_name & "?" & cgi.query_string>
	<cflocation url="http://#site_domain##site_folder#index.cfm?module=users" addToken="false">
</cfif>



 <cfquery name="user" datasource="#datasrc#">
        select * from #table_usrs# where username = '#session.username#'
        </cfquery>

<cfparam name="form.emailaddress" default="#user.emailaddress#">
<cfparam name="form.avatar_url" default="#user.avatar_url#">
<cfparam name="form.use_gravatar" default="#user.use_gravatar#">
<cfparam name="form.hide_email" default="#user.hide_email#">
<cfparam name="form.signature" default="#user.signature#">
<cfparam name="form.location" default="#user.location#">
<cfparam name="form.website" default="#user.website#">
<cfparam name="form.timezone" default="#user.timezone#">
<cfparam name="form.newsletter_sign_up" default="#user.newsletter_sign_up#">
<cfparam name="form.blog_sign_up" default="#user.blog_sign_up#">
<cfparam name="form.password_new" default="">
<cfparam name="form.password_confirm" default="">
<cfif form.use_gravatar is 1>
	<cfset form.avatar_url = "">
</cfif>

<cfif isDefined('url.act') and #url.act# EQ "save_profile">
<cfquery name="update_profile" datasource="#datasrc#">
update #table_usrs# set   <cfif isDefined('form.password_new') and #form.password_new# NEQ "">password='#form.password_new#',</cfif>firstname='#form.firstname#', lastname='#form.lastname#', age='#form.age#', emailaddress='#form.emailaddress#', signature='#form.signature#', avatar_url='#form.avatar_url#', location='#form.location#', use_gravatar ='#form.use_gravatar#', hide_email='#form.hide_email#', timezone='#form.timezone#', accept_pm='#form.accept_pm#', newsletter_sign_up='#form.newsletter_sign_up#', blog_sign_up='#form.blog_sign_up#' where username ='#form.username#'
</cfquery>
<cflocation url="http://#site_domain##site_folder#index.cfm?module=users&section=profile&msg=Profile Successfully Updated" addtoken="no">
</cfif>
<!--- Handle attempted update --->
<cfif isDefined("form.save")>
	<cfset errors = "">
	
	<cfif not len(trim(form.emailaddress)) or not request.udf.isEmail(form.emailaddress)>
		<cfset errors = errors & "You must enter a valid email address.<br>">
	<cfelse>
		<cfset user.emailaddress = trim(htmlEditFormat(form.emailaddress))>
	</cfif>
	<Cfif len(trim(form.signature)) gt 255>
		<cfset errors = errors & "Your signature is too long.<br>">
	<cfelse>
		<cfset user.signature = trim(htmlEditFormat(form.signature))>
	</cfif>
	<cfset user.location = trim(htmlEditFormat(form.location))>
	
	<!-- we should do more validation than this -->
	<cfif form.avatar_url eq "http://" or form.avatar_url eq "https://">
		<cfset form.avatar_url = "">
	</cfif>
	<Cfif form.avatar_url neq "">
		<cfif find(chr(34),form.avatar_url) gt 0>
			<cfset errors = errors & "Your avatar URL is invalid.  Quotes are not allowed in avatar URLs.<br>">
		<cfelseif REFindNoCase("^((https?:\/\/))[-[:alnum:]\?%,\.\/&##!@:=\+~_]+[A-Za-z0-9\/]$",form.avatar_url) EQ 0>
			<cfset errors = errors & "Your avatar URL is invalid.  Please enter a complete URL.<br>">
		<cfelse>
			<cfparam name="application.settings.maxAvatarSize" default="100x100">
			<cfif isNumeric(application.settings.maxAvatarSize)>
				<!--- if only one dimension was entered, make it square --->
				<cfset application.settings.maxAvatarSize = application.settings.maxAvatarSize & "x" & application.settings.maxAvatarSize>
			<cfelseif reFindNoCase("[[:digit:]]+x[[:digit:]]+",application.settings.maxAvatarSize)>
				<cfset application.settings.maxAvatarSize = "100x100">
			</cfif>
			<cftry>
				<cfset imageCFC = createObject("component","cfcs.imagecfc.image")>
				<cfset loadAvatar = imageCFC.getImageInfo('',form.avatar_url)>
				<cfif loadAvatar.errorCode gt 0>
					<cfset errors = errors & "Unable to load avatar image: #retVal.errorMessage#<br>">
				<cfelseif loadAvatar.width gt listGetAt(application.settings.maxAvatarSize,1,"x") or loadAvatar.height gt listGetAt(application.settings.maxAvatarSize,2,"x")>
					<cfset errors = errors & "The specified image is too large.  Avatars cannot be larger than #listGetAt(application.settings.maxAvatarSize,1,"x")#x#listGetAt(application.settings.maxAvatarSize,1,"x")# pixels.<br>">
				<cfelse>
					<cfset user.avatar_url = trim(form.avatar_url)>
				</cfif>
				<cfcatch type="any">
					<!--- ignore error and accept avatar URL --->
					<cfset user.avatar_url = trim(form.avatar_url)>
					<!--- <cfdump var="#cfcatch#"> --->
				</cfcatch>
			</cftry>
		</cfif>
	<cfelse>
		<cfset user.avatar_url = form.avatar_url>
	</cfif>
	<cfif form.website eq "http://" or form.website eq "https://">
		<cfset form.website = "">
	</cfif>
	<cfif form.website neq "">
		<cfif find(chr(34),form.website) gt 0>
			<cfset errors = errors & "Your website URL is invalid.  Quotes are not allowed in URLs.<br>">
		<cfelseif REFindNoCase("^((https?:\/\/))[-[:alnum:]\?%,\.\/&##!@:=\+~_]+[A-Za-z0-9\/]$",form.website) EQ 0>
			<cfset errors = errors & "Your website URL is invalid.  Please enter a complete URL that starts with http:// or https://.<br>">
		</cfif>
	</cfif>
	<cfif len(trim(form.password_new)) and form.password_new neq form.password_confirm>
		<cfset errors = errors & "To change your password, your confirmation password must match.<br>">
	</cfif>
	
	</cfif>

<cfoutput>
<cfif isDefined("errors")>
	<cfif len(errors)>
		<p class="error">
		Please correct the following error(s): <b>#errors#</b>
		</p>
	<cfelse>
		<p class="success">
		<b>Your profile has been updated.</b>
		</p>
	</cfif>
</cfif>

<table class="tableDisplay">
<cfif isDefined('url.msg')>
<tr> <td bgcolor="##00CC00"><font color="##006600"><b>#url.msg#</b></font></td></tr>
</cfif>
	<tr class="tableHeader">
		<td class="breadcrumb_nav">Profile</td>
	</tr>
	<tr class="tableRow0">
		<td>
		Please use the form below to edit your profile.
		</td>
	</tr>
	<tr>
		<td>
		<form name="frmProfile" action="http://#site_domain##site_folder#index.cfm?module=users&section=profile&act=save_profile" method="post">
		<input type="hidden" name="save" value="1">
        <input type="hidden" name="username" value="#user.username#" />
		<table class="plain">
			<tr>
				<td><b>First Name:</b></td>
				<td><input type="text" name="firstname" value="#user.firstname#" class="formBox"></td>
			</tr>
            <tr>
				<td><b>Last Name:</b></td>
				<td><input type="text" name="lastname" value="#user.lastname#" class="formBox"></td>
			</tr>
            <tr>
              <td><b>Age:</b></td>
              <td><input type="text" name="age" value="#user.age#" class="formBox"></td>
            </tr>
            <tr>
				<td><b>Username:</b></td>
				<td>#user.username#</td>
			</tr>

			<tr>
				<td><b>Email Address:</b></td>
				<td><input type="text" name="emailaddress" value="#user.emailaddress#" class="formBox"></td>
			</tr>
			<tr>
				<td><b>Hide Email:</b></td>
				<td><!---#yesNoInputs("hide_email",form.hide_email)#---></td>
			</tr>
			<tr>
				<td><b>New Password:</b></td>
				<td><input type="password" name="password_new" class="formBox"></td>
			</tr>
			<tr>
				<td><b>Confirm Password:</b></td>
				<td><input type="password" name="password_confirm" class="formBox"></td>
			</tr>
			<tr><td colspan="2"><hr noshade size=1></td></tr>
			
			<tr>
				<td valign="top"><b>Signature:</b></td>
				<td><textarea style="height: 80px;" class="formBox" name="signature">#user.signature#</textarea>
				</td>
			</tr>
			
			<tr>
				<td><b>Avatar:</b></td>
				<td>
					<input type="radio" name="use_gravatar" value="1"<cfif form.use_gravatar eq 1> CHECKED</cfif>>Use Gravatar
					<p style="font-style: italic; margin: 0; margin-left: 25px;">For more information about the Globally Recognized Avatar, visit <a target="_blank" href="http://www.gravatar.com">gravatar.com</a></i><br>
					<i>Your gravatar will be used as long as you don't specify an alternate URL above.</p>
					<input type="radio" name="use_gravatar" value="0"<cfif form.use_gravatar neq 1 and form.avatar_url neq ""> CHECKED</cfif>> Use Other Avatar <a href="javascript:popup_ultraslim('avatars.cfm',550,400);">browse galleries</a><br>
					<p style="margin: 0; margin-left: 25px;">URL: <input type="text" class="formBox" name="avatar_url" value="#iif(user.avatar_url eq "",de("http://"),de(user.avatar_url))#"></p>
					<input type="radio" name="use_gravatar" value="0"<cfif form.use_gravatar neq 1 and form.avatar_url eq ""> CHECKED</cfif>> No Avatar				</td>
			</tr>
			
			<tr>
				<td><b>Location:</b></td>
				<td><input type="text" class="formBox" name="location" value="#user.location#"></td>
			</tr>

			<tr>
				<td><b>Website:</b></td>
				<td><input type="text" class="formBox" name="website" value="#iif(user.website eq "",de("http://"),de(user.website))#"></td>
			</tr>
			<tr>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
			<tr>
			  <td height="25" colspan="2" background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#menu_bg.gif" class="breadcrumb_nav">Module Options:</td>
			  </tr>
			<tr>
				<td><b>Private Messages:</b></td>
				<td>
					<input type="radio" name="accept_pm" value="1"<cfif user.accept_pm is 1> CHECKED</cfif>>Yes, allow others to send me private messages.<br/>
					<input type="radio" name="accept_pm" value="0"<cfif user.accept_pm neq 1> CHECKED</cfif>>No, don't allow others to send me private messages.				</td>
			</tr>
			<tr>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
            <cfif #module_newsletter# EQ "1">
			<tr>
			  <td><strong>Subscribe to our Newsletter:</strong></td>
			  <td><input type="radio" name="newsletter_sign_up" value="1"<cfif user.newsletter_sign_up is 1> CHECKED</cfif>>Yes, I'd like to recieve newsletters.<br/>
					<input type="radio" name="newsletter_sign_up" value="0"<cfif user.newsletter_sign_up neq 1> CHECKED</cfif>>No, I'm not interested in recieveing newsletters.				</td>
			  </tr>
			<tr>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
              </cfif>
              <cfif #module_blog# EQ "1">
			<tr>
			  <td><strong>Subscribe to our Blog:</strong></td>
			  <td><input type="radio" name="blog_sign_up" value="1"<cfif user.blog_sign_up is 1> CHECKED</cfif>>Yes, I'd like to subscribe to the blog, and be able to post comments.<br/>
					<input type="radio" name="blog_sign_up" value="0"<cfif user.blog_sign_up neq 1> CHECKED</cfif>>No, I'd rather not subscribe to the blog.				</td>
			  </tr>
			<tr>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
              </cfif>
			<tr>
				<td colspan="2">
					<!---<input type="submit" class="button" name="save" value="Save">--->
                    <table border="0" align="center" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.frmProfile.submit();" class="Button">Update Profile</a></td>
    <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>				</td>
			</tr>
		</table>
		</form>
		</td>
	</tr>

</table>
</cfoutput>

<cfsetting enablecfoutputonly=false>
<cfelseif isdefined('url.section') and #url.section# EQ "subscriptions">

<cfif not session.allowin>
	<cfset thisPage = cgi.script_name & "?" & cgi.query_string>
	<cflocation url="http://#site_domain##site_folder#index.cfm?module=users&ref=#urlEncodedFormat(thisPage)#" addToken="false">
</cfif>

<!---\\ Forum Subscriptions Table//--->
<hr />
</cfif>
</cfoutput>
	

<cfsetting enablecfoutputonly=false>

