<!--- Create a users table in your database that has fields for username, pwd, firstname, lastname and accesslevel --->

<cfinclude template="../functions/webos_dsn.cfm">
<cfinclude Template="../functions/webos_tables.cfm">
<cfinclude template="../functions/site_config.cfm">
<cfinclude template="../functions/init.cfm">

<!---\\Editor Definitions//--->
<cfif cgi.script_name EQ "#site_folder#admin/module_articles.cfm">
<cfset editor_name ="articlescontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_blog.cfm">
<cfset editor_name ="blogpostcontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_didyouknow.cfm">
<cfset editor_name ="didyouknowcontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_forum.cfm">
<cfset editor_name ="forummsgcontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_links.cfm">
<cfset editor_name ="linksdesccontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_mainpage.cfm">
<cfset editor_name ="mainpagecontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_newsletter.cfm">
<cfset editor_name ="newslettercontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_pages.cfm">
<cfset editor_name ="pagecontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_spotlights.cfm">
<cfset editor_name ="spotlightcontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/admin_news.cfm">
<cfset editor_name ="adminnewscontent">
<cfelseif cgi.script_name EQ "#site_folder#admin/module_links.cfm">
<cfset editor_name ="link_desc">
</cfif>
<!---\\End of Editor Definitions//--->

<!--- Specify the numeric value (or values in a comma-delimited list) of the access level allowed in this admin area --->
<cfset adminsonly = "1">
<cfset admins_managers = "1,2">
<cfset allusers = "0,1,2,3">

<!--- Lets create our session info so we can use session variables to login and out --->
<CFAPPLICATION NAME="WebOSAdmin"
               SESSIONMANAGEMENT="Yes"
               SESSIONTIMEOUT="#CreateTimeSpan(0,1,0,0)#">
<!---Users Variables for Sessions--->               
<!--- Checks to see if aaplication.usersinfo exists, or if we need to create it--->               
<cflock timeout="15" scope="APPLICATION" type="EXCLUSIVE"> 
    <cfif NOT isDefined("Application.UsersInfo")>
          <cfset Application.UsersInfo = StructNew()>
    </cfif> 
</cflock>
<!---Creates a unique user Session ID--->
<cflock name="#CreateUUID()#" timeout="60" type="EXCLUSIVE">
      <cfset user_cfid = Evaluate(CFID)>
      <cfset user_time = Now()>
</cflock>
<!---Let's check if the user has been counted for or if it exisits on the structure--->
<cflock scope="APPLICATION" type="EXCLUSIVE" timeout="16">
 <cfif NOT StructKeyExists(Application.UsersInfo, user_cfid)>
  <cfset temp = StructInsert(Application.UsersInfo, user_cfid, user_time)>
 </cfif>
</cflock>
<!---Creates a delete the session so they don't stay on our who's online list forever--->
<cflock scope="APPLICATION" type="EXCLUSIVE" timeout="60">
 <cfloop collection="#Application.UsersInfo#" item="itmUser">
  <cfif
   Evaluate(DateDiff("n", StructFind(Application.UsersInfo, itmUser), Now())) GT 10
  >
    <cfset StructDelete(Application.UsersInfo, itmUser)>
  </cfif>
 </cfloop>
</cflock>

<!---We're done with the user variables--->
<CFPARAM NAME="session.user" DEFAULT="unknown">

<!--- Set text style --->
<style>
.standard {font-family: Arial, Helvetica, sans-serif; font-size:10pt;}
</style>

<!--- Include login template --->
<CFINCLUDE TEMPLATE="functions/login.cfm">





