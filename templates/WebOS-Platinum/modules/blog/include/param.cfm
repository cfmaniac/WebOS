<!---
	Name         : param.cfm
	Author       : James Harvey
	Created      : August 08, 2007
	Last Updated : August 08, 2007
	History      : Version 1.0
--->
<cfparam name="nemail" default="">
<cfparam name="ce" default="">
<cfparam name="emails" default="">
<cfparam name="search" default="">
<!--- <cfparam name="this_search" default=""> --->
<cfparam name="dopost" default="no">
<cfparam name="cat" default="0">
<cfparam name="calMonth" default=0>
<cfparam name="calDay" default=0>
<cfparam name="calYear" default=0>
<cfparam name="add_comment" default="">
<cfparam name="comment_name" default="">
<cfparam name="comment_email" default="">
<cfparam name="comment_com" default="">
<cfparam name="comment_cap" default="">
<cfparam name="incomment" default="">
<cfparam name="inname" default="">
<cfparam name="inlink" default="">
<cfparam name="inemail" default="">
<cfparam name="insubscribe" default=0>
<cfparam name="inrememberme" default="">
<cfparam name="message" default="">
<cfparam name="showForm" default="No">
<cfparam name="url.id" default=0>
<!--- Set search mode --->
<cfif NOT IsDefined("URL.search")>
  <cfset URL.search = "no">
</cfif>
<cfif URL.search IS "yes">
  <cfset tsearch = 1>
  <cfelse>
  <cfset tsearch = 0>
</cfif>
<!--- Set view post mode --->
<cfif NOT IsDefined("URL.dopost")>
  <cfset URL.dopost = "">
</cfif>
<cfif URL.dopost IS "yes">
  <cfset dpost = #id#>
  <cfelse>
  <cfset dpost = 0>
</cfif>
<cfif NOT IsDefined("URL.cat")>
  <cfset URL.cat = "0">
</cfif>
<cfif NOT IsDefined("URL.calMonth")>
  <cfset URL.calMonth = "0">
</cfif>
<cfif NOT IsDefined("URL.calDay")>
  <cfset URL.calDay = "0">
</cfif>
<cfif NOT IsDefined("URL.calYear")>
  <cfset URL.calYear = "0">
</cfif>
<cfif NOT IsDefined("FORM.this_search")>
  <cfset FORM.this_search = "">
</cfif>