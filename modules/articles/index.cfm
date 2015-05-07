<!---\\ Module Configuration //--->
<cfset module ="articles">
<!---\\ End of Module Configuration //---->
<cfif NOT isdefined('url.article_id') and NOT isdefined('url.section')>
 <!---\\ Load Articles List //--->
 <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">WebOS Articles</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="news"> 
  <tr> 
    <td width="100%" height="100" valign="top" class="news"> 
    <cfoutput query="GetArticles" maxrows="100"> 
        <cfset newtitle = article_title> 
        <cfset fin1 = find(#CHR(32)#, newtitle,50)> 
		<cfset newtitle2 = "">
        <cfif Fin1 NEQ 0> 
          <cfset newtitle2 = #left(newtitle,fin1)# > 
          <cfset newtitle3  = ReplaceNoCase(newtitle2," ", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"'", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,".", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"&", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,":", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,",", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"and", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"--", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"/", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"?", "-", "all")> 
          <cfelse> 
          <cfset newtitle3  = ReplaceNoCase(newtitle2," ", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"'", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,".", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"&", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,":", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,",", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"and", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"--", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"/", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"?", "-", "all")>
        </cfif> 
        <cfif right(newtitle3,1) EQ "-"> 
          <cfset newlength = len(newtitle3) - 1> 
          <cfset newtitle4 = left(newtitle3, newlength)> 
          <cfelse> 
          <cfset newtitle4 = #newtitle3#> 
        </cfif> 
		       <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><A href="http://#site_domain##site_folder#index.cfm?module=#module#&article_id=#article_id#" class="news"><strong>#left(article_title,100)#...</strong></A></td>
  </tr>
  <tr>
    <td><em>#article_source#</em><br> 
    #left(article_description,80)#...<br> 
       <br></td>
  </tr>
  <tr>
    <td> <A href="http://#site_domain##site_folder#index.cfm?module=#module#&article_id=#article_id#" class="news">Read more >></A></td>
  </tr>
  <tr>
    <td><hr>
</td>
  </tr>
</table>

      </cfoutput>
</td> 
  </tr> 
</table>
</td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"></td>
  </tr>
    <tr>
    <td><a href="http://<cfoutput>#site_domain##site_folder#index.cfm?module=#module#</cfoutput>&section=archives">View Articles in Our Archive</a></td>
  </tr>
</table>
 <cfelseif isDefined('url.article_id')>
 <!---\\ Loads the Actual Article //--->
 <cfinclude template="articles.cfm">
</cfif> 