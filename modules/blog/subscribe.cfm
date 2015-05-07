<!---
	Name         : subscribe.cfm
	Author       : James Harvey
	Created      : August 03, 2007
	Last Updated : August 08, 2007
	History      : Version 1.0
--->
<CFPARAM name="addEmail" default="none">
<CFPARAM name="URL.id" default="0">
<CFPARAM name="ce" default="">
<CFPARAM name="calMonth" default=0>
<CFPARAM name="calDay" default=0>
<CFPARAM name="calYear" default=0>
<CFIF  addEmail IS "yes">
  <cfset token = "#RandRange(11111111,99999999)#">
  <CFIF nemail IS "">
    <CFSET ce = "yes">
    <cfelseif NOT ReFind(".+@.+..+", nemail)>
    <CFSET ce = "no">
  </CFIF>
  <CFIF ce IS "yes" OR ce IS "no">
    <cfset addEmail = "">
    <cfelse>
    <CFQUERY DataSource="#datasrc#" Name="get_email">
			SELECT nt.neEmail
            FROM #table_blog_news# nt
			WHERE nt.neEmail = '#FORM.nemail#' and nt.neDomain='#application.siteDomain#' AND nt.neStatus = 0
		</CFQUERY>
    <cfif #get_email.RecordCount# EQ 1>
      <cfset message = "This email address is already registed.">
      <cfelse>
      <CFTRANSACTION>
        <CFQUERY DataSource="#datasrc#" Name="addemail">
			    INSERT INTO #table_blog_news# (neEmail, neToken, neStatus, neDomain)
				VALUES ('#nemail#', '#token#', 0, '#domain#')
			</CFQUERY>
      </CFTRANSACTION>
      <cfmail server="#application.sitemailServer#" TO="#nemail#"
            FROM="#application.siteEmail#"
            SUBJECT="#application.siteTitle# Subscription Confirmation"
			type="html">
Please confirm your subscription to the blog by clicking the link below.        <br>
        <br>
        <a href="#application.siteAddress#confirmsubscription.cfm?e=#nemail#&t=#token#">#application.siteAddress#confirmsubscription.cfm?e=#nemail#&t=#token#</a><br>
        <br>
        <br>
        <br>
        ===========================================================<br>
        <br>
        This message was sent by an automaticly from #application.siteTitle#<br>
        <br>
        ===========================================================
      </CFMAIL>
      <cfset message = "Thank you, your email has been added.<br><br>Please check your email to finish the signup proccess.">
    </cfif>
  </CFIF>
</CFIF>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><cfoutput>#application.siteTitle#</cfoutput></title>
<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/include/addons.cfm">
</head>
<body>
<div class="page">
<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/include/menu.cfm">
  <cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/include/header.cfm">
  <div id="content">
    <div class="post" id="post">
      <h2>Subscribe</h2>
    </div>
    <br />
    <br />
    <cfif addEmail IS "yes">
      <cfoutput>#message#</cfoutput>
      <cfelse>
      Enter your email address to subscribe to this blog.
      <P>
      <form name="newletter" method="post" action="<cfoutput>#application.siteAddress#</cfoutput>subscribe.cfm/addEmail/yes">
        <input type="text" value="" name="nemail" size="25" >
        <CFIF ce IS "yes">
          <small><font color="#ff0000"> &nbsp;*This field is required</font></small>
          <CFelseIF ce IS "no">
          <small><font color="#ff0000"> &nbsp;*Email address is invalid</font></small>
        </CFIF>
        <br>
        <br>
        <input type="submit" value="Submit">
      </form>
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
