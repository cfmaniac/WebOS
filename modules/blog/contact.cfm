<!---
	Name         : contact.cfm
	Author       : James Harvey
	Created      : August 03, 2007
	Last Updated : August 08, 2007
	History      : Version 1.0
--->
<!--- create captcha --->
<cfif not structKeyExists(application, "captcha")>
  <cfset application.captcha.captcha = createObject("component", "captcha.captchaService").init(configFile="captcha/captcha.xml") />
  <cfset application.captcha.captcha.setup()>
</cfif>
<cfparam name="form.name" default="">
<cfparam name="form.email" default="">
<cfparam name="form.skills" default="">
<cfparam name="form.comments" default="">
<cfparam name="URL.id" default=0>
<CFPARAM name="calMonth" default=0>
<CFPARAM name="calDay" default=0>
<CFPARAM name="calYear" default=0>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!---Get titles from the blog.cfc--->
<CFINVOKE COMPONENT="blog" METHOD="Get_Titles" RETURNVARIABLE="get_title" id=#URL.id#></CFINVOKE>
<title><cfoutput>#application.siteTitle#</cfoutput></title>
<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/include/addons.cfm">
</head>
<body>
<div class="page">
<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/include/menu.cfm">
  <cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/include/header.cfm">
  <div id="content"> <br />
    <strong>Contact Us</strong><br />
    <br />
    <cfset showForm = true>
    <cfif structKeyExists(form, "sendcomments")>
      <cfset error = "">
      <cfif not len(trim(form.name))>
        <cfset error = error & "You must include your name.<br>">
      </cfif>
      <cfif not len(trim(form.email)) or not isValid("email", form.email)>
        <cfset error = error & "Include a valid email address.<br>">
      </cfif>
      <cfif not len(trim(form.comments))>
        <cfset error = error & "Nothing was entered in the comment form.<br>">
      </cfif>
      <cfif not application.captcha.captcha.validateCaptcha(form.hash, form.captcha)>
        <cfset error = error & "You did not match the image text.<br>">
      </cfif>
      <cfif error is "">
        <cfmail server="#application.sitemailServer#" to="#application.siteEmail#" from ="#form.email#" subject="#application.siteTitle# Contact Page" wraptext="75">
          From: #form.name# (#form.email#)
          Comments: #form.comments#
        </cfmail>
        <cfset showForm = false>
      </cfif>
    </cfif>
    <cfif showForm>
      <cfif structKeyExists(variables, "error")>
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
      <cfoutput>
        <form action="contact.cfm" method="post">
          <table width="100%" border="0" align="center">
            <tr>
              <td align="right"><strong>Name:</strong></td>
              <td><input type="text" name="name" value="#form.name#"></td>
            </tr>
            <tr>
              <td align="right"><strong>Email address:</strong></td>
              <td><input type="text" name="email" value="#form.email#"></td>
            </tr>
            <tr>
              <td align="right"><strong>Comment:</strong></td>
              <td><textarea name="comments" cols="40" rows="8">#form.comments#</textarea></td>
            </tr>
            <tr>
              <td align="right"><strong>Enter text shown in the image:</strong></td>
              <td><input type="text" name="captcha">
                <br>
                <!--- Captcha --->
                <cfset captcha = application.captcha.captcha.createHashReference()>
                <img src="captcha/captcha.cfm?hash=#captcha.hash#">
                <input name="hash" type="hidden" value="#captcha.hash#" />
              </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><input type="submit" name="sendcomments" value="Send Comments"></td>
            </tr>
          </table>
        </form>
      </cfoutput>
      <cfelse>
      <cfoutput>
        <p> Thank you for sending your comments, #form.name#. </p>
      </cfoutput>
      </TD>
      </TR>
      </TABLE>
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
