<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Users Administration">
<script language="javascript" type="text/javascript" src="assets/scripts/common.js">
</script>
<script type="text/javascript">
<!--
var txt_advanced_editor_warning = "Advanced editor mode cannot be enabled, as this mode is available only in the following web browsers:\nIE5.5+ (Windows)\nLatest version of Netscape, Mozilla & Firefox (Windows)";
var isHTML_Editor = (
		(localBFamily == 'MSIE' && parseInt(localVersion) >= 5) || 
		(localBrowser == 'Netscape' && parseInt(localVersion) >= 8) || 
		((localBrowser == 'Firefox' || localBrowser == 'Mozilla') && parseInt(localVersion) >= 1) || 
		(localBrowser == 'Opera' && parseInt(localVersion) >= 9)
	);
var isHTML_EditorFF = (localBrowser == 'Firefox');
-->
</script>
<script src="assets/scripts/wysiwyg/innovaeditor.js" language="JavaScript" type="text/javascript"></script>

<!---\\ Module Functions (add, edit, update, delete) Go here //--->
<CFPARAM name="row_color" default="1">
<cfif NOT isDefined('url.do')>
<CFPARAM name="do" default="m">
<cfelseif isDefined('url.do')>
<CFPARAM name="do" default="#url.do#">
</cfif>
<CFPARAM name="Delete" default="no">
<CFPARAM name="Update" default="none">
<CFPARAM name="Add" default="none">
<CFPARAM name="message" default="none">
<CFPARAM name="inPage" default="0">
<!---\\ Add Function //--->
<cfif isDefined('url.Add') and #url.Add# is "yes">
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="add_article">

  insert into #table_usrs# (id, firstname, lastname, username, password, emailaddress, signature, avatar_url, location, use_gravatar, accept_pm, newsletter_sign_up, blog_sign_up, sign_up_date) values ('#CreateUUID()#', '#form.firstname#', '#form.lastname#','#form.username#', '#form.password_new#', '#form.emailaddress#', '#form.signature#', '#form.avatar_url#', '#form.location#', '#form.use_gravatar#', '#form.accept_pm#','#form.newsletter_sign_up#','#form.blog_sign_up#', <cfif #db_type# Eq "mysql">'#dateformat(now(), "YYYY-MM-DD HH:MM:SS")#'<cfelse>'#dateformat(now(), "MM/DD/YYYY")#'</cfif>)
  </CFQUERY>
</CFTRANSACTION>
  <cflocation url="users.cfm?do=m" addToken="No">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_admin_news">
	DELETE FROM #table_usrs# WHERE username = #url.username#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="users.cfm?do=m" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_admin_news">
  update #table_usrs# set   <cfif isDefined('form.password_new') and #form.password_new# NEQ "">password='#form.password_new#',</cfif>firstname='#form.firstname#', lastname='#form.lastname#', emailaddress='#form.emailaddress#', signature='#form.signature#', avatar_url='#form.avatar_url#', location='#form.location#', use_gravatar ='#form.use_gravatar#', accept_pm='#form.accept_pm#', newsletter_sign_up='#form.newsletter_sign_up#', blog_sign_up='#form.blog_sign_up#' where username ='#form.username#'
			</CFQUERY>
  </CFTRANSACTION>
  <cflocation url="users.cfm?do=m" addToken="No">
</cfif>

<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<cfif ListFindNoCase("#allusers#", session.permissions, ",")>
<style type="text/css">
<!--
.style1 {
	font-size: 11px;
	font-weight: bold;
}
-->
</style>
<!--- BEGINNING OF YOUR CONTENT --->
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1"><cfoutput>#attributes.page#</cfoutput></span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" valign="top"><img src="assets/modules/modules_users.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add a User</a><br /></b>
      <cfelse>
      <a href="?do=a">Add a User</a><br />
      </cfif>
      <br />

      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>
      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can Edit Users Details.
    <hr width="95%" align="center"/>
<cfquery name="user_results" datasource="#datasrc#">
select * from #table_usrs#
</cfquery>
<table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>UserName</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Account Confirmed</strong></font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Subscriptions</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="user_results" StartRow="1" EndRow="#user_results.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td align="center"><b>#username#</b><br>
    #firstname# #lastname#<br />
    #emailaddress#</td>
        <td align="center"><cfif confirmed EQ "1">
    <font color="##006600">Yes</font>
    <cfelseif confirmed EQ "0">
    <font color="##990000">No</font>
    </cfif></td>
     <td align="left" valign="top">Newsletter: <cfif newsletter_sign_up EQ "1"><font color="##006600"> Subscribed</font><cfelseif newsletter_sign_up EQ "0"><font color="##990000">Not Subscribed</font></cfif><br />
    Blog: <cfif blog_sign_up EQ "1"><font color="##006600"> Subscribed</font><cfelseif blog_sign_up EQ "0"><font color="##990000">Not Subscribed</font></cfif><br />    </td>
          <td align="center"><A HREF="?do=e&id=#id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&username=#username#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
      </tr>
      <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
    </CFOUTPUT>
  </CFLOOP>
</table>
<cfelseif do EQ "a">
     
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add New Page</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox">
   <form name="frmProfile" action="?add=yes" method="post"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table class="plain">
			<tr>
				<td><b>First Name:</b></td>
				<td><input type="text" name="firstname"  class="formBox"></td>
			</tr>
            <tr>
				<td><b>Last Name:</b></td>
				<td><input type="text" name="lastname"  class="formBox"></td>
			</tr>
            <tr>
				<td><b>Username:</b></td>
				<td><input type="text" name="username"  class="formBox"></td>
			</tr>
			<tr>
				<td><b>Email Address:</b></td>
				<td><input type="text" name="emailaddress"  class="formBox"></td>
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
				<td><textarea style="height: 80px;" class="formBox" name="signature"></textarea>
			</td>
			</tr>
			
			
			<tr>
				<td><b>Avatar:</b></td>
				<td>
					<input type="radio" name="use_gravatar" value="1">Use Gravatar
					<p style="font-style: italic; margin: 0; margin-left: 25px;">For more information about the Globally Recognized Avatar, visit <a target="_blank" href="http://www.gravatar.com">gravatar.com</a></i><br>
					<i>Your gravatar will be used as long as you don't specify an alternate URL above.</p>
					<input type="radio" name="use_gravatar" value="0"> Use Other Avatar <a href="javascript:popup_ultraslim('avatars.cfm',550,400);">browse galleries</a><br>
					<p style="margin: 0; margin-left: 25px;">URL: <input type="text" class="formBox" name="avatar_url" ></p>
					<input type="radio" name="use_gravatar" value="0"> No Avatar				</td>
			</tr>
			
			<tr>
				<td><b>Location:</b></td>
				<td><input type="text" class="formBox" name="location" ></td>
			</tr>
	
			<tr>
				<td><b>Website:</b></td>
				<td><input type="text" class="formBox" name="website"></td>
			</tr>
			<tr>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
			<tr>
			  <td height="25" colspan="2">Module Options:</td>
			  </tr>
			<tr>
				<td><b>Private Messages:</b></td>
				<td>
					<input type="radio" name="accept_pm" value="1">Yes, allow others to send me private messages.<br/>
					<input type="radio" name="accept_pm" value="0">No, don't allow others to send me private messages.				</td>
			</tr>
			<tr>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
            <cfif #module_newsletter# EQ "1">
			<tr>
			  <td><strong>Subscribe to our Newsletter:</strong></td>
			  <td><input type="radio" name="newsletter_sign_up" value="1">Yes, I'd like to recieve newsletters.<br/>
					<input type="radio" name="newsletter_sign_up" value="0">No, I'm not interested in recieveing newsletters.				</td>
			  </tr>
			<tr>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
              </cfif>
              <cfif #module_blog# EQ "1">
			<tr>
			  <td><strong>Subscribe to our Blog:</strong></td>
			  <td><input type="radio" name="blog_sign_up" value="1">Yes, I'd like to subscribe to the blog, and be able to post comments.<br/>
					<input type="radio" name="blog_sign_up" value="0">No, I'd rather not subscribe to the blog.				</td>
			  </tr>
			<tr>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
              </cfif>
			<tr>
				<td colspan="2" align="right">
					<input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
			</tr>
		</table></td>
</tr>
</table>
</form></td>
   <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
   
  </tr>
  <tr>
   <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c1" alt="" /></td>
   <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
   <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c3" alt="" /></td>
   
  </tr>
</table>

    <cfelseif do EQ "e">
<CFQUERY DataSource="#datasrc#" Name="edit_article">
			SELECT *
			FROM #table_usrs# where id ='#url.id#'
</CFQUERY>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit User</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><cfoutput query="edit_article">
<form name="frmProfile" action="?update=yes" method="post">
		<input type="hidden" name="save" value="1" />
		<input type="hidden" name="username" value="#edit_article.username#" />
        <table class="plain">
			<tr>
				<td><b>First Name:</b></td>
				<td><input type="text" name="firstname" value="#edit_article.firstname#" class="formBox"></td>
			</tr>
            <tr>
				<td><b>Last Name:</b></td>
				<td><input type="text" name="lastname" value="#edit_article.lastname#" class="formBox"></td>
			</tr>
            <tr>
				<td><b>Username:</b></td>
				<td>#edit_article.username#</td>
			</tr>
			<tr>
				<td><b>Email Address:</b></td>
				<td><input type="text" name="emailaddress" value="#edit_article.emailaddress#" class="formBox"></td>
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
				<td><textarea style="height: 80px;" class="formBox" name="signature">#edit_article.signature#</textarea>
			</td>
			</tr>
			
			
			<tr>
				<td><b>Avatar:</b></td>
				<td>
					<input type="radio" name="use_gravatar" value="1"<cfif edit_article.use_gravatar eq 1> CHECKED</cfif>>Use Gravatar
					<p style="font-style: italic; margin: 0; margin-left: 25px;">For more information about the Globally Recognized Avatar, visit <a target="_blank" href="http://www.gravatar.com">gravatar.com</a></i><br>
					<i>Your gravatar will be used as long as you don't specify an alternate URL above.</p>
					<input type="radio" name="use_gravatar" value="0"<cfif edit_article.use_gravatar neq 1 and edit_article.avatar_url neq ""> CHECKED</cfif>> Use Other Avatar <a href="javascript:popup_ultraslim('avatars.cfm',550,400);">browse galleries</a><br>
					<p style="margin: 0; margin-left: 25px;">URL: <input type="text" class="formBox" name="avatar_url" value="#iif(edit_article.avatar_url eq "",de("http://"),de(edit_article.avatar_url))#"></p>
					<input type="radio" name="use_gravatar" value="0"<cfif edit_article.use_gravatar neq 1 and edit_article.avatar_url eq ""> CHECKED</cfif>> No Avatar				</td>
			</tr>
			
			<tr>
				<td><b>Location:</b></td>
				<td><input type="text" class="formBox" name="location" value="#edit_article.location#"></td>
			</tr>
	
			<tr>
				<td><b>Website:</b></td>
				<td><input type="text" class="formBox" name="website" value="#iif(edit_article.website eq "",de("http://"),de(edit_article.website))#"></td>
			</tr>
			<tr>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
			<tr>
			  <td height="25" colspan="2">Module Options:</td>
			  </tr>
			<tr>
				<td><b>Private Messages:</b></td>
				<td>
					<input type="radio" name="accept_pm" value="1"<cfif edit_article.accept_pm is 1> CHECKED</cfif>>Yes, allow others to send me private messages.<br/>
					<input type="radio" name="accept_pm" value="0"<cfif edit_article.accept_pm neq 1> CHECKED</cfif>>No, don't allow others to send me private messages.				</td>
			</tr>
			<tr>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
            <cfif #module_newsletter# EQ "1">
			<tr>
			  <td><strong>Subscribe to our Newsletter:</strong></td>
			  <td><input type="radio" name="newsletter_sign_up" value="1"<cfif edit_article.newsletter_sign_up is 1> CHECKED</cfif>>Yes, I'd like to recieve newsletters.<br/>
					<input type="radio" name="newsletter_sign_up" value="0"<cfif edit_article.newsletter_sign_up neq 1> CHECKED</cfif>>No, I'm not interested in recieveing newsletters.				</td>
			  </tr>
			<tr>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
              </cfif>
              <cfif #module_blog# EQ "1">
			<tr>
			  <td><strong>Subscribe to our Blog:</strong></td>
			  <td><input type="radio" name="blog_sign_up" value="1"<cfif edit_article.blog_sign_up is 1> CHECKED</cfif>>Yes, I'd like to subscribe to the blog, and be able to post comments.<br/>
					<input type="radio" name="blog_sign_up" value="0"<cfif edit_article.blog_sign_up neq 1> CHECKED</cfif>>No, I'd rather not subscribe to the blog.				</td>
			  </tr>
			<tr>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
              </cfif>
			<tr>
				<td colspan="2" align="right">
					<input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
			</tr>
		</table>
        </form>
        </cfoutput>
        </td>
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
</form>

<cfelseif do EQ "d">
<CFQUERY DataSource="#datasrc#" Name="delete_article">
			SELECT *
			FROM #table_usrs# where username ='#url.username#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete User</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you sure you want to delete the user account for: <b><cfoutput>#delete_article.username#</cfoutput></b>? <br>
    <br>
    <a href="?Delete=yes&username=<cfoutput>#delete_article.username#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="users.cfm">No</a>
  </center></a></td>
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
    </cfif>    </td>
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
<!--- END OF YOUR CONTENT --->
<cfelse>
You are not authorized to view this page.
</cfif>
</cf_headfoot>