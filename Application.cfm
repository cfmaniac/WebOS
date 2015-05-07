<cfapplication name = "WEBOS_ColdFusion Content Management Suite"  loginStorage = "session" clientManagement = "Yes"   clientStorage = "cookie" setClientCookies = "Yes" sessionManagement = "Yes"  sessionTimeout = #CreateTimeSpan(1, 0, 0, 0)#  applicationTimeout = #CreateTimeSpan(1, 0, 0, 0)# setDomainCookies = "Yes">

<cfinclude template="functions/site_config.cfm">
<cfinclude template="functions/init.cfm">

<!---\\ Sets up Application Variables for functions/webos_mailer.cfm //--->
<cfif isDefined('form.referrer') and #form.referrer# EQ "admin_reply">
<cfset application.mailto ="#form.to#">
<cfelse>
<cfset Application.mailto="#site_email#">
</cfif>
<cfset Application.replyto="#site_email#">
<cfset Application.Client ="#client_name#">
<cfset Application.server ="#site_mail_server#">
<!---\\ End of webos_mailer.cfm set up variables //--->

<!---\\ Assigns the Website ID & Website Cat ID to the Website //--->
<cfif isDefined('website_id') and website_id NEQ "">
<cfset application.WebsiteID = #website_id#>
<cfelseif NOT isDefined('website_id')>
<cfset application.WebsiteID = "0001">
</cfif>
<cfif isDefined('website_cat_id') and website_id NEQ "">
<cfset application.WebsiteCategoryID = #website_cat_id#>
<cfelseif NOT isDefined('website_cat_id')>
<cfset application.WebsiteCategoryID = "0001">
</cfif>

<!---\\ Begin Modules System //--->

<cfif module_blog EQ "1">
<!---\\ Loads Blog Application information if module is Installed //--->
<!--- Valid types: msaccess, mssql, mysql --->
<cfset application.dbType = "mssql">
<cfset application.siteDirectory = "#site_folder##site_modules_dir#blog"> 
<!--- leave blank for root also it's case sensitive' --->
<cfset application.siteTitle = "#site_name#">
<cfset application.siteDescription = "">
<cfset application.siteEmail = "#site_email#">
<cfset application.siteAuthor = "James Harvey">
<cfset application.sitemailServer = "#site_mail_server#">
<cfset application.siteDomain = #CGI.HTTP_HOST#>

<!---Query to Load Blog Configuration Information: Primarily, SiteTemplate:--->
<cfquery name="load_config" datasource="#datasrc#">
select blog_site_id, blog_site_domain, blog_site_template from #table_blog_conf# where blog_site_domain ='#application.sitedomain#'
</cfquery>
<!---End  Blog Configuration Information Query--->
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
<cfset request.dataSource = #datasrc#>
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
<CFPARAM NAME="session.allowin" DEFAULT="No">
<CFPARAM NAME="session.superuser" DEFAULT="false">
<CFPARAM NAME="session.user_id" DEFAULT="0">
<CFPARAM NAME="session.username" DEFAULT="">
<cfparam name="session.session_key" Default="">
		  		
<cfif application.siteDirectory is not "">
<cfif GetDirectoryFromPath(cgi.script_name) is "/#application.siteDirectory#/admin/">
<cfif session.allowin neq "true">
<cfif ListLast(CGI.SCRIPT_NAME, "/") EQ "?module=users">
<cfelseif ListLast(CGI.SCRIPT_NAME, "/") EQ "?module=user&action=login">
<cfelse>
<!--- this user is not logged in, alert user and redirect to the ?module=users page --->
<script>
self.location="?module=users";
</script>
<!--- Now abort the page --->
<cfabort />
</cfif>
</cfif>
</cfif>
<cfelse>
<cfif GetDirectoryFromPath(cgi.script_name) is "/admin/">		  
<cfif session.allowin neq "true">
<cfif ListLast(CGI.SCRIPT_NAME, "/") EQ "?module=users">
<cfelseif ListLast(CGI.SCRIPT_NAME, "/") EQ "?module=user&action=login">
<cfelse>
<!--- this user is not logged in, alert user and redirect to the ?module=users page --->
<script>
 self.location="?module=user";
</script>
<!--- Now abort the page --->
<cfabort />
</cfif>
</cfif>
</cfif>
</cfif>
</cfif>

<cfif module_breadcrumbs EQ "1">
<!---\\ Loads Blog Application information if module is Installed //--->
<cfscript>
    if (NOT structKeyExists(session, 'clickstream')) {
        session.clickstream = arrayNew(1);
    }
</cfscript>
</cfif>

<cfif module_chat EQ "1">
<!---\\ Loads Chat Application information if module is Installed //--->
<cfsetting enablecfoutputonly="Yes">
<cfparam name="Application.UserList" default="">
<!---<cfset Application.UserListCounter = ListAppend(Application.UserListCounter, 0, "#chr(9)#")>--->
<cfparam name="Application.UserListCounter" default="">
<cfparam name="Application.MessageLog" default="">
<cfset Application.WordBanList = "f__k,s__t,c__t,p___y">
<cfset Application.WordReplace = "****,****.****,*****">
<cfset Application.Title = "WebOS Chat!">

<!---\\ First define default session //--->
<cfparam name="session.MyUsername" default="">
<cfparam name="session.goodUser" default="No">

<!---\\ Now see if the user has logged themselves in //--->
<cfif IsDefined("FORM.MyUsername") and FORM.MyUsername neq "">
<!---\\ First see if the username is available //--->
<cfset UserOkToUse = ListFind(Application.UserList, FORM.MyUsername, "#chr(9)#")>
<!---\\ Username ok to use //--->
<cfif UserOkToUse eq 0>
<cfset session.MyUsername = FORM.MyUsername>
<cfset session.goodUser = "Yes">
<!---\\ Now add user to list of users //--->
<cfset Application.UserList = ListAppend(Application.UserList, FORM.MyUsername, "#chr(9)#")>
<cfset Application.MessageLog = "<font color=Green><b>#session.MyUserName# Logged In at #DateFormat(now())# #TimeFormat(now())#</b></font><br>" & Application.MessageLog>
 <cfelse>
<cfset UserMessage = "Username taken, try another!">
 </cfif>
</cfif>
<cfsetting enablecfoutputonly="No">
</cfif>
