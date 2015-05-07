<!---
	Name         : application.cfm
	Author       : James Harvey
	Created      : August 03, 2007
	Last Updated : August 08, 2007
	History      : Version 1.0
--->
<cfapplication name="SWIBlog"
	   clientmanagement="Yes"
	   setclientcookies="Yes" 
	   sessionmanagement="Yes"
	   sessiontimeout=#CreateTimeSpan(0,1,0,0)#
	   applicationtimeout=#CreateTimeSpan(0,1,0,0)#>

		<cfset application.dataSource = "CF_POLL">
		<!--- Valid types: msaccess, mssql, mysql --->
		<cfset application.dbType = "mssql">
		<cfset application.siteDirectory = "blog_dev"> <!--- leave blank for root also it's case sensitive' --->
		<cfset application.siteTitle = "Development Blog">
		<cfset application.siteDescription = "Blog Development for SWI Digital">
		<cfset application.siteEmail = "j.harvey@swidigital.com">
		<cfset application.siteAurthor = "James Harvey">
        <cfset application.sitemailServer = "mail.swidigital.com">
        <cfset application.siteDomain = #CGI.HTTP_HOST#>
        <cfset application.siteTemplate = "default">
		<cfset application.feedAmount = 20>
	<cfif application.siteDirectory is not "">
		<cfset application.siteAddress = "http://#CGI.HTTP_HOST#/#application.siteDirectory#/">
	<cfelse>
		<cfset application.siteAddress = "http://#CGI.HTTP_HOST#/">
	</cfif>
		<cfset application.currentPath = getCurrentTemplatePath()>		
		<cfset application.currentDirectory = getDirectoryFromPath(application.currentPath)>
		<cfset application.sitePath = getDirectoryFromPath(application.currentPath)>
		<cfset application.thisYear = year(now())>
		<cfset request.dataSource = application.dataSource>
		<cfset request.siteTitle = application.siteTitle>

		<cfif ListLast(CGI.PATH_INFO,".") NEQ "cfm">
		  <cfif Find(".cfm",CGI.PATH_INFO)>
		    <cfset lenRHSofDotCFM = Len(CGI.PATH_INFO) - (Find(".cfm",CGI.PATH_INFO)+4)>
		    <cfelse>
		    <cfset lenRHSofDotCFM = Len(CGI.PATH_INFO)>
		  </cfif>
		  <cfif lenRHSofDotCFM GT 0>
		    <cfset RHSofDotCFM = Right( CGI.PATH_INFO, lenRHSofDotCFM )>
		    <cfset numURLItems = listLen(RHSofDotCFM,'/')>
		    <cfset numURLItems = numURLItems - (numURLItems mod 2)>
		    <cfloop from ="1" to="#numURLItems#" index="i" step="2">
		      <cfset URL[ GetToken(RHSofDotCFM,i,'/') ] = GetToken(RHSofDotCFM,i+1,'/')>
		    </cfloop>
		  </cfif>
		</cfif>
		
		<CFPARAM NAME="session.allowin" DEFAULT="false">
        <CFPARAM NAME="session.superuser" DEFAULT="false">
		<CFPARAM NAME="session.user_id" DEFAULT="0">
		  		
		<cfif application.siteDirectory is not "">
		<cfif GetDirectoryFromPath(cgi.script_name) is "/#application.siteDirectory#/admin/">
			<cfif session.allowin neq "true">
		    <cfif ListLast(CGI.SCRIPT_NAME, "/") EQ "http://#site_domain##site_folder#index.cfm?module=users">
		      <cfelseif ListLast(CGI.SCRIPT_NAME, "/") EQ "login_process.cfm">
		      <cfelse>
		      <!--- this user is not logged in, alert user and redirect to the http://#site_domain##site_folder#index.cfm?module=users page --->
		      	 <script>
		                 self.location="http://#site_domain##site_folder#index.cfm?module=users";
		         </script>
		      <!--- Now abort the page --->
		      <cfabort />
		    </cfif>
		  </cfif>
		</cfif>
		<cfelse>
		<cfif GetDirectoryFromPath(cgi.script_name) is "/admin/">		  
			<cfif session.allowin neq "true">
		    <cfif ListLast(CGI.SCRIPT_NAME, "/") EQ "http://#site_domain##site_folder#index.cfm?module=users">
		      <cfelseif ListLast(CGI.SCRIPT_NAME, "/") EQ "login_process.cfm">
		      <cfelse>
		      <!--- this user is not logged in, alert user and redirect to the http://#site_domain##site_folder#index.cfm?module=users page --->
		      	 <script>
		                 self.location="http://#site_domain##site_folder#index.cfm?module=users";
		         </script>
		      <!--- Now abort the page --->
		      <cfabort />
		    </cfif>
		  </cfif>
		</cfif>
		</cfif>

