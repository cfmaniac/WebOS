<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Newsletter Administration">
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

<script type="text/javascript" src="assets/scripts/calendarDateInput.js">
</script>
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
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <cfquery name="unsubscribe" datasource="#datasrc#">
  Update #table_usrs# set newsletter_sign_up = '0' where emailaddress='#url.emailaddress#'
  </cfquery>
  <CFQUERY DataSource="#datasrc#" Name="delete_newsletters">
	DELETE FROM #table_newsletters# WHERE newsletteruserid = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_newsletter.cfm?do=m" addToken="No">
</cfif>
<cfif isDefined('url.Delete_arch') and #url.Delete_arch# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_newsletters">
	DELETE FROM #table_newsletters_arch#	WHERE newsletter_id = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_newsletter.cfm?do=sent" addToken="No">
</cfif>
<!---\\ Send Function //--->
<cfif isDefined('url.send') and #url.send# is "yes">
  <CFTRANSACTION>
  <cfif isdefined('form.message') and #form.message# NEQ "">
  <CFQUERY NAME="GetMembers" DATASOURCE="#datasrc#">
       SELECT *
         FROM #table_newsletters#
      <CFIF Form.EmailType EQ "1">
        WHERE EmailType = 1
      <CFELSE>
        WHERE EmailType = 0
      </CFIF>
     ORDER BY newsletteruserid
    </CFQUERY>

    <CFLOOP QUERY="GetMembers" endrow="#getmembers.recordcount#">
        <!--- Determine if email going out will be in HTML format or not --->
        <CFIF #Form.EmailType# EQ "1">
            <CFMAIL To="#GetMembers.Email#"
                From="#site_email#"
                Subject="#form.subject#"  server="#site_mail_server#">

                <cfif isDefined('form.#editor_name#')>#form.newslettercontent#<cfelseif NOT isDefined('form.#editor_name#')>#form.newslettercontentAdv#</cfif>
                Sent: #DateFormat(Now(), 'ddd. mmmm dd, yyyy')#
                to Unsubcribe visit: http://#site_domain##site_folder#/?module=newsletter&action=unsubscribe

            </CFMAIL>
        <CFELSEIF #Form.EmailType# EQ "0">
            <CFMAIL To="#GetMembers.Email#"
                From="#site_email#"
                Subject="#form.subject#"
                type="HTML"  server="#site_mail_server#">

                 <cfif isDefined('form.#editor_name#')>#form.newslettercontent#<cfelseif NOT isDefined('form.#editor_name#')>#form.newslettercontentAdv#</cfif>
                Sent: #DateFormat(Now(), 'ddd. mmmm dd, yyyy')#
                to Unsubcribe visit: http://#site_domain##site_folder#/?module=newsletter&action=unsubscribe

            </CFMAIL>
        </CFIF>
    </CFLOOP>
  <CFQUERY DataSource="#datasrc#" Name="insert_newsletters">
  INSERT INTO #table_newsletters_arch# (newsletter_title, newsletter_content, date_sent)
  VALUES ('#form.subject#', <cfif isDefined('form.#editor_name#')>'#form.newslettercontent#',<cfelseif NOT isDefined('form.#editor_name#')>'#form.newslettercontentAdv#',</cfif> <cfif #db_type# EQ "mysql"> '#dateformat(now(), "YYYY-MM-DD HH:MM:SS")#'<cfelse>'#dateformat(now(), "mm/dd/yyyy")#'</cfif>)
			</CFQUERY>
  </cfif>
  </CFTRANSACTION>
  <cflocation url="module_newsletter.cfm?do=m" addToken="No">
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
    <td width="100" valign="top"><img src="assets/modules/modules_newsletter.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "sendout">
      <b><a href="?do=sendout">Send out A Newsletter</a></b>
      <cfelse>
      <a href="?do=sendout">Send out A Newsletter</a><br /><br />
      <br />
      </cfif>
      <cfif do EQ "sent">
      <b><a href="?do=sent">View Sent Newsletters</a></b>
      <cfelse>
      <a href="?do=sent">View Sent Newsletters</a>
      </cfif>
      <br />
      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>
      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can view/delete subscribers, View Sent Emails, and Send Newsletters.
    <hr width="95%" align="center"/>
<CFQUERY DataSource="#datasrc#" Name="display_newsletters">
			SELECT *
			FROM #table_newsletters# 
            </CFQUERY>
<table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="25" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">ID</font></span></td>
    <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Subscriber Name</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Email</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_newsletters" StartRow="1" EndRow="#display_newsletters.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="25">#display_newsletters.newsletteruserid#</td>
        <td align="center">#display_newsletters.firstname# #display_newsletters.lastname#</td>
        <td align="center">#display_newsletters.email#</td>
          <td align="center"><A HREF="?do=d&id=#display_newsletters.newsletteruserid#&emailaddress=#display_newsletters.email#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
      </tr>
      <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
    </CFOUTPUT>
  </CFLOOP>
</table>
<cfelseif do EQ "sendout">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Send out Newsletter</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>

    <form action="?send=yes" method="post">
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td width="48%">
    The Newsletter Subject:
    </td>
    <td width="2%">&nbsp;</td>
    <td width="48%">
    <input type="text" name="subject" />
    </td>
    </tr>
       <cfinclude template="functions/wysiwyg.cfm"><BR>
    <tr>
    <td width="48%">   
        Send as:</td>
        <td width="2%">&nbsp;</td>
        <td width="48%">
        Text <input type="Radio" name="EmailType" value="1">
        HTML <input type="Radio" name="EmailType" value="0"><br>
        </td>
        </tr>
        <tr>
        <td width="48%">&nbsp;</td>
        <td width="2%">&nbsp;</td>
        <td width="48%">
        <input type="Submit" Value="Mail Newsletter">
        </td>
        </tr>
        </table>
    </FORM>
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


    <cfelseif do EQ "sent">
<CFQUERY DataSource="#datasrc#" Name="archived_mail">
			SELECT *
			FROM #table_newsletters_arch#
</CFQUERY>

<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg">Viewing Sent Emails</td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  You are now viewing your Sent Email Newsleters. You can either Click on the title of the email to View the contents of it, or delete it from the archive altogether. Please Note: Removing the Email from here also removed it from the Front End Newsletter Archives. 
  <hr width="95%" />
  <table width="100%"  border="0" cellspacing="1" cellpadding="5">
    <tr align="center" bgcolor="#9CB6DE">
      <td width="25" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">ID</font></span></td>
      <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Newsletter Title</strong></font></span></td>
      <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Date Sent</strong></font></span></td>
      <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
    </tr>
    <CFLOOP QUERY="archived_mail" StartRow="1" EndRow="#archived_mail.RecordCount#">
      <CFOUTPUT>
        <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
          <td width="25">#archived_mail.newsletter_id#</td>
          <td align="center"><a href="?do=view_archive&id=#archived_mail.newsletter_id#"><b>#archived_mail.newsletter_title#</b></a></td>
          <td align="center">#dateformat(archived_mail.date_sent, "mm/dd/yyyy")#</td>
          <td align="center"><a href="?do=del_mail&amp;id=#archived_mail.newsletter_id#"><img src="assets/icons/icon_delete_reply.gif" width="15" height="15" border="0" alt="d" /></a></td>
        </tr>
        <CFIF row_color EQ 1>
          <CFSET row_color = 0>
          <CFELSE>
          <CFSET row_color = 1>
        </CFIF>
      </CFOUTPUT>
    </CFLOOP>
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
</form>
<cfelseif do EQ "view_archive">
<cfquery name="view" datasource="#datasrc#">
select * from #table_newsletters_arch# where newsletter_id='#url.id#'
</cfquery>
<cfoutput query="view">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg">Viewing Archived Mail: #newsletter_title#</td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="##ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>This Email was originally sent on:<b><i>#dateformat(date_sent, "mm/dd/yyyy")#</i></b><br /><br />
  #newsletter_content#
  <hr />
  <a href="?do=sent">Return to the Archive</a> | <a href="?do=del_mail&id=#newsletter_id#">Delete this Archive</a>
  &nbsp;</td>
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
</cfoutput>
<cfelseif do EQ "d">
<CFQUERY DataSource="#datasrc#" Name="delete_page">
			SELECT *
			FROM #table_newsletters# where newsletteruserid ='#url.id#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Subscriber</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you sure you want to unsubscribe user :: <cfoutput>#delete_page.firstname# #delete_page.lastname#</cfoutput>? <br>
    <br>
    <a href="?Delete=yes&id=<cfoutput>#id#</cfoutput>&emailaddress=#delete_page.email#">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_newsletter.cfm">No</a>
  </center>
</a></td>
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
<cfelseif do EQ "del_mail">
<cfquery name="deletemail" datasource="#datasrc#">
select * from #table_newsletters_arch# where newsletter_id='#url.id#'
</cfquery>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Archived Email</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you sure you want to delete the archived message: <cfoutput>#deletemail.newsletter_title#</cfoutput>? <br>
    <br>
    <a href="?Delete_arch=yes&id=<cfoutput>#id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_newsletter.cfm">No</a>
  </center>
</a></td>
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