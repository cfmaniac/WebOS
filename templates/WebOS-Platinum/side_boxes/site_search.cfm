<cfset current_box ="site_search.cfm">
<cfquery datasource="#datasrc#" name="detect_column">
select * from #table_sideboxes# where side_box_filename ='#current_box#'
</cfquery>

<div id="login" class="boxed">
<!---\\Box Title//--->
<div class="title"><h2><cfoutput query="detect_column">#side_box_name#</cfoutput></h2>
   
</div> 
<!---\\End box Title//--->
<!---\\Box Content//--->
<div class="content">           
<form name="side_search" action="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=sitesearch" method="post">
    <table width="160" border="0" align="center" cellpadding="0" cellspacing="0">
<!-- fwtable fwsrc="side_search.png" fwpage="Page 1" fwbase="search.cfm.jpg" fwstyle="Dreamweaver" fwdocid = "247205545" fwnested="1" -->
  <tr>
   <td><img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#sitesearch/search_left.jpg" />
  </td>
   <td><img name="searchcfm_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/search.cfm_r1_c1.jpg" width="27" height="35" border="0" id="searchcfm_r1_c1" alt="" /></td>
   <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="91">
	  <tr>
	   <td><img name="searchcfm_r1_c2" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/search.cfm_r1_c2.jpg" width="91" height="7" border="0" id="searchcfm_r1_c2" alt="" /></td>
	  </tr>
	  <tr>
	   <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="91">
		  <tr>
		   <td><input type="text" name="keywords" id="keywords" style="width:82px;height:18px; border-top:1px solid #000; border-left: 0px solid #000; border-right: 0px solid #000; border-bottom: 1px solid #000; font-size:9px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#033260;font-weight:bold;" value="Search Us" onfocus="document.side_search.keywords.value=
'';"/>
          </td>
		   <td><img name="searchcfm_r2_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/search.cfm_r2_c3.jpg" width="9" height="20" border="0" id="searchcfm_r2_c3" alt="" /></td>
		  </tr>
		</table></td>
	  </tr>
	  <tr>
	   <td><img name="searchcfm_r3_c2" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/search.cfm_r3_c2.jpg" width="91" height="8" border="0" id="searchcfm_r3_c2" alt="" /></td>
	  </tr>
	</table></td>
   <td><a href="javascript:;" onclick="document.side_search.submit();"onmouseout="MM_swapImgRestore();" onmouseover="MM_swapImage('searchcfm_r1_c4','','<cfoutput>#site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/search.cfm_r1_c4_f2.jpg',1);"><img name="searchcfm_r1_c4" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/search.cfm_r1_c4.jpg" width="42" height="35" border="0" id="searchcfm_r1_c4" alt="" /></a></td>
    <td><img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#sitesearch/search_right.jpg" />
  </td>
  </tr>
</table>
    </form>
</div>
<!---\\end Box Content//--->
</div>