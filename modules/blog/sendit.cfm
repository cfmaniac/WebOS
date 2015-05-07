<!---
	Name         : contact.cfm
	Author       : James Harvey
	Created      : August 03, 2007
	Last Updated : August 08, 2007
	History      : Version 1.0
--->
<!--- create captcha --->
<cfif not isDefined("sendid")>
<cflocation url = "index.cfm" addToken = "No">
</cfif>
<cfparam name="URL.id" default=0>
<CFPARAM name="calMonth" default=0>
<CFPARAM name="calDay" default=0>
<CFPARAM name="calYear" default=0>
<CFPARAM name="form.sendid" default="#sendid#">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!---Get titles from the blog.cfc--->
<CFINVOKE COMPONENT="blog" METHOD="Get_Titles" RETURNVARIABLE="get_title" id=#URL.id#></CFINVOKE>
<title><cfoutput>#get_title#</cfoutput></title>
<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/include/addons.cfm">
</head>
<body>
<div class="page">
<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/include/menu.cfm">
  <cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/include/header.cfm">
  <div id="content"> <br />
    <strong>Send it</strong><br />
    <br />
    <cfparam name="sendid" default="">
<CFQUERY DataSource="#datasrc#" Name="get_posts">
			SELECT bl.blID, bl.blTitle, bl.blDate, bl.blCategory, bl.blLink, bl.blView, bl.blPage
			FROM blog_tbl bl
			WHERE bl.blID = #sendid#
		</CFQUERY>
<!--- create captcha --->

<cfif not structKeyExists(application, "captcha")>
  <cfset application.captcha.captcha = createObject("component", "captcha.captchaService").init(configFile="captcha/captcha.xml") />
  <cfset application.captcha.captcha.setup()>
</cfif>
<cfparam name="form.email" default="">
<cfparam name="form.femail" default="">
<cfparam name="form.notes" default="">

  <cfset showForm = true>
  <cfset linkurl = ReplaceNoCase(get_posts.blTitle," ","-","ALL")>
  <cfif structKeyExists(form, "sendcomments")>
    <cfset error = "">
    <cfif not len(trim(form.femail)) or not isValid("email", form.femail)>
      <cfset error = error & "Include a valid email address to your friend.<br>">
    </cfif>
    <cfif not len(trim(form.email)) or not isValid("email", form.email)>
      <cfset error = error & "Include a valid your email address.<br>">
    </cfif>
	<cfif not application.captcha.captcha.validateCaptcha(form.hash, form.captcha)>
      <cfset error = error & "You did not match the image text.<br>">
    </cfif>
    <cfif error is "">
      <cfmail server="#application.sitemailServer#" to="#form.femail#" from ="#form.email#" subject="From http://#application.siteDomain# - #get_posts.blTitle#" wraptext="75">
        From: #form.email# #get_posts.blTitle# #application.siteAddress#index.cfm/dopost/yes/id/#get_posts.blID#/#linkurl# Notes: #form.notes#
      </cfmail>
      <cfset showForm = false>
    </cfif>
  </cfif>
  <cfif showForm>
    <cfoutput> <B>Send Entry: #get_posts.blTitle#</B> </cfoutput>
    <P> The form below can be used to send a blog entry to a friend. Please fill out the form below. <BR>
      <BR>
      <BR>
      Please finish completing the form below. Thanks. <BR>
      <BR>
      <BR>
    <table width="80%" border="0" align="center">
      <TR>
        <TD><cfif structKeyExists(variables, "error")>
            <cfoutput>
              <p>
              <font color="ff0000"> <b>Please correct these errors:</b><br>
              <ul>
                #error#
              </ul>
              </font>
              </p>
            </cfoutput>
          </cfif>
        </TD>
      </TR>
    </TABLE>
    <cfoutput>
      <form action="sendit.cfm?sendid=#form.sendid#" method="post">
        <table width="90%" border="0" align="center">
          <tr>
            <td align="left"><strong>Your Email address:</strong><BR>
              <input type="text" name="email" value="#form.email#"></td>
          </tr>
          <tr>
            <td align="left"><strong>Receiver Email address:</strong><BR>
              <input type="text" name="femail" value="#form.femail#"></td>
          </tr>
          <tr>
            <td align="left"><strong>Optional Notes:</strong><BR>
              <textarea name="notes" id="notes">#form.notes#</textarea></td>
          </tr>
          <tr>
            <td align="left"><strong>Enter text shown in the image:</strong><BR>
              <input type="text" name="captcha">
              <br>
              <!--- Captcha --->
            
			<cfset captcha = application.captcha.captcha.createHashReference()>
               <img src="captcha/captcha.cfm?hash=#captcha.hash#">
              <input name="hash" type="hidden" value="#captcha.hash#" />
            </td>
          </tr>
          <tr>
            <td>&nbsp;<BR>
              <input type="submit" name="sendcomments" value="Send to Friend"></td>
          </tr>
        </table>
      </form>
    </cfoutput>
    <cfelse>
    <cfoutput>
      <p> Entry #get_posts.blTitle# has been sent to #form.femail#. </p>
    </cfoutput>
  </cfif>
  </div>
  <div id="sidebar">
    <ul>
      <li>
		<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/pods/podSearch.cfm">
      </li>
      <li>
        <cfinclude template="incCalendar.cfm">
      </li>
      <li>
		<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/pods/podStats.cfm">
      </li>
      <li>
        <CFINVOKE COMPONENT="blog" METHOD="Get_Cat" RETURNVARIABLE="get_cats">
		<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/pods/podCategories.cfm">
      </li>
      <li>
		<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/pods/podSubscribe.cfm">
	 </li>
    </ul>
  </div>
  <hr />
<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/include/footer.cfm">
</div>
</body>
</html>
