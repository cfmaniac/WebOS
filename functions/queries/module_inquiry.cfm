<!---\\ Gathers Company Info //--->
<cfquery name="company_info" datasource="#datasrc#">
select * from #table_company_nfo#
</cfquery>
<!---\\Gets Company Hours//--->
<cfquery name="company_hours" datasource="#datasrc#">
select * from #table_company_hrs#
</cfquery>
<!---\\Gets Form Fields//--->
<cfquery name="inquiry_fields" datasource="#datasrc#" maxrows="15">
select * from #table_inquiry# where display_field='1'
</cfquery>