<cfcomponent>
	<cffunction name="allSites" access="public" returntype="query">
		
        <cfargument name="siteID" required="no" type="uuid">
        
		<cfquery datasource="webos" name="getallSites">
        SELECT 
        userID, userName, password, siteName, permissions, siteID, userLevel
        FROM webos_admins
        <cfif isDefined("arguments.siteID")>
        	where siteID = '#arguments.siteID#'
        </cfif>
        </cfquery>
		<cfreturn getallSites>
	</cffunction>
    
    <cffunction name="setSite" access="public" returntype="uuid">
    
    	<cfargument name="siteID" required="yes" type="uuid">
        
        <cfset session.SiteID = '#arguments.siteID#'>
       
       	<cfinvoke component="Sites" method="allSites" siteID ="#session.siteID#" returnvariable="NewSiteCreds">
        
        <cfset session.siteName="#NewSiteCreds.SiteName#">
        
        <cfreturn session.siteID />
        
    </cffunction>
    
</cfcomponent>