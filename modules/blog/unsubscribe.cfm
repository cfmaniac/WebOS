<!---
	Name         : unsubscribe.cfm
	Author       : James Harvey
	Created      : August 03, 2007
	Last Updated : August 08, 2007
	History      : Version 1.0
--->
<CFPARAM name="e" default="">
<CFPARAM name="t" default="">
<CFPARAM name="neStatus" default="">
<CFPARAM name="calMonth" default=0>
<CFPARAM name="calDay" default=0>
<CFPARAM name="calYear" default=0>
<CFPARAM name="commentID" default=0>


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
      <h2>Unsubscribe</h2>
    </div>
    <br />
    <br />
    <cfif e EQ "">
      <P>
        <cflocation url = "index.cfm" addToken = "No">
        <cfelse>
		
		<cfif commentID neq 0>
		
  <CFTRANSACTION>
    <CFQUERY DataSource="#datasrc#" Name="updateSubscription">
					UPDATE #table_blog_comments#
					SET	cSubscribe = 0
					WHERE cEmail = '#e#' and cDomain='#application.siteDomain#'
			</CFQUERY>
  </CFTRANSACTION>
<P>
        <P>You have been unsubscribed from the thread.

		<cfelse>
        <CFQUERY DataSource="#datasrc#" Name="get_user">
			SELECT nl.neID, nl.neEmail, nl.neToken, nl.neStatus, nl.neDomain 
			FROM #table_blog_news# nl
			WHERE nl.neEmail = '#e#'
			AND nl.neToken = '#t#' and nl.neDomain='#application.siteDomain#'
		</CFQUERY>
		
		
      <cfif get_user.neStatus EQ 1>
        <CFTRANSACTION>
          <CFQUERY DataSource="#datasrc#" Name="editUser">
					DELETE FROM #table_blog_news#
					WHERE neToken = '#t#'
			</CFQUERY>
        </CFTRANSACTION>
        <P>
        <P> You email address has been removed from the system.
          <cfelse>
        <P>
        <P> You have already been removed from the system
      </cfif>
	
	      </cfif>
	
	
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
