<!---
	Name         : print.cfm
	Author       : James Harvey
	Created      : August 03, 2007
	Last Updated : August 08, 2007
	History      : Version 1.0
--->
<cfif not isDefined("URL.id")>
  <cflocation url="#application.siteAddress#index.cfm" addToken="false">
</cfif>
<cfif NOT isNumeric(URL.id)>
  <cflocation url="#application.siteAddress#index.cfm" addToken="false">
</cfif>
<!--- Set view post mode --->
<CFSET dpost = #id#>
<CFSET dpost = 0>
<CFPARAM name="this_search" default="">
<CFPARAM name="dopost" default="yes">
<CFPARAM name="cat" default="0">
<CFPARAM name="m" default=0>
<CFPARAM name="d" default=0>
<CFPARAM name="y" default=0>
<!---Get posts from the blog.cfc--->
<CFINVOKE COMPONENT="blog" METHOD="Get_Post" RETURNVARIABLE="get_posts" dosearch=0  id=#URL.id# search="#this_search#" cat="#cat#" mm=0 dd=0 yy=0></CFINVOKE>
<cftry>
  <cfdocument format="FlashPaper">
  <html>
  <style type="text/css">
@import url(<cfoutput>#application.siteAddress#</cfoutput>style.css);
</style>
  <body style="background:#FFFFFF">
  <div id="page">
    <div id="content">
      <div id="blogText">
        <cfdocumentitem type="header">
        <div style="font-size: 12px; text-align: right;"> <cfoutput>#application.siteDescription#</cfoutput> </div>
        </cfdocumentitem>
        <cfoutput QUERY="get_posts">
          <div class="postmetadata alt24">
            <div><a href="#application.siteAddress#index.cfm?dopost=yes&id=#get_posts.blID#" rel="bookmark" title="Permanent Link: #get_posts.blTitle#">#get_posts.blTitle#</a></div>
          </div>
          <div align="justify" valign="top">
          #get_posts.blText#
          <P align="justify">#get_posts.blText2#
          <P>
          <P>
          <P>
        </cfoutput>
        <CFINVOKE COMPONENT="blog" METHOD="Get_Com" RETURNVARIABLE="get_com" cid="#id#"></CFINVOKE>
        <div class="postmetadata alt23">&nbsp;<cfoutput>#get_com.RecordCount# Comment
            <cfif get_com.RecordCount NEQ 1>
              s
            </CFIF>
          </CFOUTPUT></div>
        <CFLOOP QUERY="get_com" StartRow="1" EndRow="#get_com.RecordCount#">
          <CFOUTPUT>
            <div class="PostComments">
              <ol class="commentlist">
                <li>
                  <p class="ComAuthor"><cite>
                    <CFIF get_com.cLink IS NOT "">
                      <a href="#get_com.cLink#" target="new">
                    </cfif>
                    #get_com.cName#
                    <CFIF get_com.cLink IS NOT "">
                      </a>
                    </cfif>
                    </cite></p>
                  <p class="ComLink"> #dateformat(get_com.cDate,"Dddd, Mmmm dd, YYYY")# </p>
                  <div class="Gravatar"></div>
                  #get_com.cCom# </li>
              </ol>
            </div>
          </cfoutput>
        </cfloop>
        </cfdocument>
      </div>
    </div>
  </div>
  <cfcatch>
  </cfcatch>
</cftry>
