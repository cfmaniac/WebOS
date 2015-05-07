<cfif isdefined('url.cat') and url.cat NEQ "Home">
    <!---Loads the Podcasts List--->
    <cfquery name="pod_cast_list" datasource="#datasrc#">
select * from #table_pods# where pod_cast_category='#url.cat#'
    </cfquery>
    <cfelseif isDefined('url.cat') and url.cat EQ "Home">
     <!---Loads the Podcasts List--->
    <cfquery name="pod_cast_list" datasource="#datasrc#">
    select * from #table_pods#  
    </cfquery>
    <cfelseif NOT isdefined('url.cat')>
     <cfquery name="pod_cast_list" datasource="#datasrc#">
    select * from #table_pods#  
    </cfquery>
    </cfif>
    <cfquery name="pod_cast_cats" datasource="#datasrc#">
    select * from #table_pod_cats#
    </cfquery>