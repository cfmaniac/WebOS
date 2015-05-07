<!---\\Main Page Module Setup//--->
<cfquery name="main_page_setup" datasource="#datasrc#">
SELECT * from #table_mainpage# WHERE main_page_expire_date >='#dateformat(now(), "MM/DD/YYYY")#'
</cfquery>   

<cfif main_page_setup.main_page_time_sensitive eq "1">
<!---\\If Main Page is Time Sensitive//--->
<cfquery name="mainpage_content" datasource="#datasrc#">
select * from #table_mainpage# where main_page_expire_date between '#dateformat(now(), "MM/DD/YYYY")#' and '#main_page_setup.main_page_expire_date#' and main_page_active='1'
</cfquery>
<cfelse>
<!---\\If Main Page is NOT Time Sensitive//--->
<cfquery name="mainpage_content" datasource="#datasrc#">
select * from #table_mainpage# where main_page_active='1'
</cfquery>
</cfif>