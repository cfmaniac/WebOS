<!--- a/p error had to set up no recordcount default --->

<CFQUERY NAME="rss_config" datasource="#datasrc#">
   SELECT *
   FROM    #table_rss_conf#
</CFQUERY>

<cfif not rss_config.recordcount>
	<cfset rss_config.randomize_feeds = "0">
</cfif>

<CFQUERY NAME="get_rss" datasource="#datasrc#">
   SELECT <cfif rss_config.randomize_feeds eq "1"> Top #rss_config.random_feed_value# <cfelseif rss_config.randomize_feeds eq "0">*<cfelse>*</cfif>
   FROM    #table_rss#
   WHERE  rss_status = <cfqueryparam cfsqltype="CF_SQL_INTEGER" null="no" value="1">
   ORDER   BY rss_weight ASC
</CFQUERY>

<CFQUERY NAME="get_our_rss" datasource="#datasrc#">
   SELECT * FROM    #table_our_feeds#
   WHERE  rss_status = '1'
   ORDER   BY rss_weight ASC
</CFQUERY>