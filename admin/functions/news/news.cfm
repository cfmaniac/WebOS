<cfquery name="getnews" datasource="#datasrc#">
select * from #table_a_news# 
</cfquery>
<style type="text/css">
<!--
.style1 {
	font-size: 10px;
	color: #0072AC;
}
-->
</style>

<cfoutput >
<CFLOOP startRow = "1" query="getnews" endrow="#getnews.RecordCount#">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td><b>#news_title#</b></td>
  </tr>
  <tr>
    <td>#news_content#</td>
  </tr>
  <tr>
    <td align="right" valign="top"><span class="style1">#DateFormat(news_date, "mm/dd/yyyy")#</span></td>
  </tr>
  <tr>
    <td align="right" valign="top"><hr /></td>
  </tr>
</table>
</CFLOOP>
</cfoutput>
