<!--- Module Configuration --->
<cfset module ="forum">
<cfparam name="ForumTitle" default="#site_name# Forums">
<cfparam name="RowColor" default="ccccff">
<cfparam name="MaxDisplay" default="25">
<cfparam name="ThreadMail" default="0">
<cfparam name="SmtpServer" default="">
<cfparam name="EmailFrom" default="#site_email#">
<cfparam name="RoomID" default="1">

<cfparam name="MultiRoom" default="1">

<cfparam name="AdminEmail" default="#site_email#">
<cfparam name="AdminPassword" default="">

<cfparam name="SubmitAlias" default="index.cfm">
<cfparam name="Action" default="">


<cfparam name="ImagePath" default="http://#site_domain##site_folder#modules/forum/images/">
<cfparam name="URLPath" default="http://#site_domain##site_folder#index.cfm?module=forum">
<cfparam name="QueryCacheTime" default="5">



<cfparam name="startRow" default="1">
<cfparam name="currentPage" default="1">
<cfparam name="entryID" default="0">
<cfparam name="PostNum" default="0">
<cfparam name="EndPostNum" default="0">

<cfparam name="Flush" default="0">
<cfparam name="MaxSearchResultRows" default="75">
<!--- Forum Template --->
<cfinclude template="templates/top.cfm">

<!--- Configuration parameters


--->

<cfscript>	
	ForumTitle = "#site_name# Forums";
	RowColor = "ccccff";
	DefaultFont = "<font face='Verdana,Helvetica,Arial, San-seif' size='1'>";
	CollapseThreads = 0;
	MaxDisplay = 10;
	ImagePath = "http://#site_domain##site_folder#modules/forum/images/";
	URLPath = "http://#site_domain##site_folder#index.cfm?module=forum";
	
	ThreadMail = 1;
	SMTPServer = "#site_mail_server#";
	EmailFrom = "#site_name#_Forums@#site_domain#";
	
	MultiRoom = 1;
	
	DbName = "#datasrc#";
	
	AdminEmail = "#site_email#";
	AdminPassword = "";
	
	SubmitAlias = "index.cfm";
	QueryCacheTime = 5;
	MaxSearchResultRows = 75;
</cfscript>
<cfparam name="ViewThreads" default="#IIF(ParameterExists(CollapseThreads),CollapseThreads,1)#">
<!---End of Module Configuration--->
<cfswitch expression="#Action#">
	<cfcase value="Detail"><cfinclude template="detail.cfm"></cfcase>
	<cfcase value="Admin"><cfinclude template="admin.cfm"></cfcase>
	<cfcase value="Reply"><cfinclude template="post.cfm"></cfcase>
	<cfcase value="New"><cfinclude template="New.cfm"></cfcase>
	<cfcase value="Post,PostNew" delimiters=","><cfinclude template="post.cfm"></cfcase>
	<cfcase value="Search,SearchReady" delimiters=","><cfinclude template="search.cfm"></cfcase>
	<cfcase value="Forum"><cfinclude template="list.cfm"></cfcase>
	<cfdefaultcase><cfinclude template="welcome.cfm"></cfdefaultcase>
</cfswitch>


