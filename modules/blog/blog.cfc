<cfcomponent displayname="blog" hint="Post processing">
<!---<cfset datasrc = "MassDevelopment001">--->	
<cfinclude template="../../functions/webos_dsn.cfm">
<cfinclude template="../../functions/webos_tables.cfm">
<cffunction NAME="Get_Post" returntype="query" hint="Get all posts">
	  <cfparam name="arguments.search" default="">
	  	<cfquery datasource="#datasrc#" Name="get_posts">
				select bl.blID, bl.blTitle, bl.blDate, bl.blText, bl.blText2, bl.blCategory, bl.blLink, bl.blView, blPage, blUser, Month(bl.blDate) AS mm, Day(bl.blDate) AS dd, Year(bl.blDate) AS yy, 
				   (select count(ct.cbid) from #table_blog_comments# ct where ct.cbid = bl.blID and ct.cStatus = 1) AS pnum, bl.blDomain from #table_blog# bl where bl.blDomain ='#application.sitedomain#'      
			<cfif arguments.dosearch eq 1>
				and bl.blTitle LIKE '%#arguments.search#%' 
				or bl.blText LIKE '%#arguments.search#%' 
				or bl.blText2 LIKE '%#arguments.search#%'
				order BY bl.blID DESC
			<cfelseif arguments.id neq 0>
				and bl.blID = #arguments.id#
			<cfelseif arguments.cat is not  "0">
				and bl.blCategory LIKE '#arguments.cat#'
				and bl.blPage = 0
				order BY bl.blID DESC
			<cfelseif arguments.mm neq 0>
				and Month(bl.blDate) = #arguments.mm#
				and Day(bl.blDate) = #arguments.dd#
				and Year(bl.blDate) = #arguments.yy#
				and bl.blPage = 0
				order BY bl.blID DESC
			<cfelseif arguments.id eq 0>
				and bl.blPage = 0
				order BY bl.blID DESC
			</cfif>  
		</cfquery>
  <cfreturn get_posts>
</cffunction>

<cffunction NAME="Get_Cat" returntype="query" hint="Get all cats">
		<cfquery datasource="#datasrc#" Name="get_cats">
			select ct.ctID, ct.ctCat, (select count(bl.blCategory) from #table_blog# bl where bl.blCategory=ct.ctCat and bl.blPage = 0) AS cnum, ct.ctDomain from #table_blog_cats# ct where ct.ctDomain = '#application.siteDomain#'
			order BY ct.ctCat ASC
		</cfquery>
  <cfreturn get_cats>
</cffunction>

<cffunction NAME="Get_Cal" returntype="query" hint="Get all cats">
		<cfquery datasource="#datasrc#" Name="get_cals">
			select blID, blTitle, blDate, Day(blDate) AS dd
			from #table_blog#
		  	where blDate Between #arguments.MonthStart# and #arguments.MonthEnd#
		</cfquery>
  <cfreturn get_cals>
</cffunction>

<cffunction NAME="Get_Com" returntype="query" hint="Get all comments">
		<cfquery datasource="#datasrc#" Name="get_com">
			select co.cID, co.cbid, co.cName, co.cLink, co.cEmail, co.cCom, co.cDate, co.cStatus, co.cSubscribe
		    from #table_blog_comments# co
			where co.cbid = #arguments.cid# 
			and co.cStatus = 1
		</cfquery>
  <cfreturn get_com>
</cffunction>

<cffunction NAME="getSubscribers" returntype="query" hint="Get all comments">
		<cfquery datasource="#datasrc#" Name="getSubscribers">
			select DISTINCT co.cEmail
		    from #table_blog_comments# co
			where co.cbid = #arguments.cid# 
			and co.cStatus = 1
			and co.cSubscribe = 1
			and co.cEmail not like '#arguments.tEmail#'
		</cfquery>
  <cfreturn getSubscribers>
</cffunction>

<cffunction NAME="Get_Titles" returntype="string" hint="Get dynamic title">
	<cfif arguments.id gt 0>
		<cfquery datasource="#datasrc#" Name="get_title">
			select bl.blID, bl.blTitle
			from #table_blog# bl      
			where bl.blID = #arguments.id# 
		</cfquery>
    	<cfset get_title = "#get_title.blTitle#">
    <cfelse>
    	<!---<cfset get_title = #site_name#>--->
        <cfset get_title = "1">
	</cfif>
  <cfreturn get_title>
</cffunction>

</cfcomponent>
