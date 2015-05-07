<!---\\ Module Configuration //--->
<cfset module ="blog">
<!---\\ End of Module Configuration //---->
<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir##module#/include/param.cfm">
<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir##module#/include/addons.cfm">

<!---<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/include/menu.cfm">--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">WebOS Blog</td>
  </tr>
  <tr>
    <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left" valign="top"><!---Get posts from the blog.cfc--->

<cfif add_comment is not "">
    <cfset url.linkID = 4>
    <cfinclude template="navLinks.cfm">
</cfif>
  <cfinvoke component="blog" METHOD="Get_Post" returnvariable="get_posts" dosearch=#variables.tsearch#  id=#variables.dpost# search="#form.this_search#" cat="#url.cat#" mm=#url.calMonth# dd=#url.calDay# yy=#URL.calYear#></cfinvoke>
  
  <cfif get_posts.blView EQ ''>
    <cfset get_posts.blView = 0>
  </cfif>
  <cfif url.dopost IS "yes">
    <cfset showForm = "yes">

    <!--- <cfdump var="#get_Posts#"><Cfabort> --->
	<cfset counts = #get_posts.blView# + 1>
    <cflock timeout="3" type="exclusive" name="lockCount">
      <cftransaction>
        <cfquery datasource="#datasrc#" Name="updatecount">
				UPDATE #table_blog#
				SET	blview = #variables.counts#
				WHERE blID = #URL.id#
			</cfquery>
      </cftransaction>
    </cflock>
  </cfif>
  <!---Add the Next and Back links for more then 10 entries.--->
  <cfset url.linkID = 1>
  <cfinclude template="navLinks.cfm">
  <div id="content">
   <cfif get_posts.recordcount eq 0><br /><br />No posts available.</cfif>
    <cfloop query="get_posts" startrow="#start#" endrow="#end#" >
      <cfoutput>
        <cfset linkurl = ReplaceNoCase(get_posts.blTitle," ","-","ALL")>
        <div class="post" id="post">
          <h2><a href="http://#site_domain##site_folder#index.cfm?module=blog&dopost=yes&id=#get_posts.blID#&#variables.linkurl#" rel="bookmark" title="Permanent Link: #get_posts.blTitle#">#get_posts.blTitle#</a></h2>
          <p class="postmetadatatop"> Posted in <a href="http://#site_domain##site_folder#index.cfm?module=blog&cat=#get_posts.blCategory#" title="View all posts in #get_posts.blCategory#" rel="category tag" class="small">#get_posts.blCategory#</a> | #dateformat(get_posts.blDate,"mmm dd, YYYY")# #TimeFormat(get_posts.blDate, "h:mm:tt")# | Posted by: #get_posts.blUser#</p>
          <div class="entry">
            <p>
                <cfset blText11 = Replace(get_posts.blText, "[code]", "<center><div class='code'>","ALL")>
                <cfset blText12 = Replace(blText11, "[/code]", "</div></center>","ALL")>
                #blText12#
              <cfif URL.dopost IS "yes">
                <br>
                <br>
                <cfset blText21 = Replace(get_posts.blText2, "[code]", "<center><div class='code'>","ALL")>
                <cfset blText22 = Replace(blText21, "[/code]", "</div></center>","ALL")>
                #blText22#
              </cfif>
            </p>
            <cfif #get_posts.blText2# neq "">
              <cfif url.dopost is not "yes">
                <div align="right" class="nextNav"><a href="http://#site_domain##site_folder#index.cfm?module=blog&dopost=yes&id=#get_posts.blID#&#variables.linkurl#">Read More &raquo;</a></div>
              </cfif>
            </cfif>
          </div>
          <p class="postmetadatabottom"> <a href="http://#site_domain##site_folder#index.cfm?module=blog&dopost=yes&id=#get_posts.blID#&#variables.linkurl###comment" title="Comment on #get_posts.blTitle#">
            <cfif #get_posts.pnum# IS 0>
              [0]
              <cfelse>
              [#get_posts.pnum#]
            </cfif>
            <cfif #get_posts.pnum# IS 1>
              Comment
              <cfelse>
              Comments
            </cfif>
            </a> | <a href="#application.siteAddress#print.cfm/id/#get_posts.blID#" target="new">Print</a>
            <cfif get_posts.blLink gt 0>
              | <a href="#application.siteAddress#download/#get_posts.blLink#">Download</a>
            </cfif>
            <cfset blText13 = Replace(Variables.linkurl, "'", "","ALL")>
            | <a href="##" onclick="akst_share('#get_posts.blID#', 'http://#site_domain##site_folder#index.cfm?module=blog&dopost=yes&id=#get_posts.blID#/#blText13#', '#blText13#'); return false;" title="E-mail this, post to del.icio.us, etc." id="akst_config_#get_posts.blID#" class="akst_share_config" rel="noindex">Share This</a> |  Views:
            <cfif url.dopost IS "yes">
              #variables.counts#
              <cfelse>
              <cfif get_posts.blView eq ''>
                0
                <cfelse>
                #get_posts.blView#
              </cfif>
            </cfif>
          </p>
        </div>
      </cfoutput>
    </cfloop>
    <cfset url.linkID = 2>
    <cfinclude template="navLinks.cfm">
    <cfif url.dopost IS "yes">
      <cfset url.linkID = 3>
      <cfinclude template="navLinks.cfm">
    </cfif></td>
    <td width="10" align="left" valign="top">&nbsp;</td>
    <td width="180" align="left" valign="top"><cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir##module#/pods/podSearch.cfm"><br />
    <cfinclude template="incCalendar.cfm"><br />
    <cfinvoke component="blog" METHOD="Get_Cat" returnvariable="get_cats">
		<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir##module#/pods/podCategories.cfm"><br />
        <cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir##module#/pods/podSubscribe.cfm"><br />
    <cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir##module#/pods/podStats.cfm"><br /></td>
  </tr>
</table></td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"></td>
  </tr>
</table>

<cfinclude template="../../#site_template_dir##site_template#/#site_modules_dir#blog/include/akst.cfm">
</body>
</html>
