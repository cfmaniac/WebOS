<!---
	Name         : podCategory.cfm
	Author       : James Harvey
	Created      : August 08, 2007
	Last Updated : August 08, 2007
	History      : Version 1.0
--->
 <table width="180" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="templates/<cfoutput>#site_template#/#site_assets_dir#</cfoutput>/menu_bg.gif" class="main_page_title">WebOS Blog Categories</td>
  </tr>
  <tr>
    <td><ul>
          <CFLOOP QUERY="get_cats" StartRow="1" EndRow="#get_cats.RecordCount#" >
            <cfoutput>
              
                <li><A HREF="#application.siteAddress#index.cfm/cat/#get_cats.ctCat#">#get_cats.ctCat#</a>&nbsp;[#get_cats.cnum#]</li>
             
            </cfoutput>
          </CFLOOP>
        </ul>  </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"></td>
  </tr>
</table>     