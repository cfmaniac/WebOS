<cfquery datasource="#datasrc#" name="banner">
select * from #table_banners#
order by ID desc
</cfquery>