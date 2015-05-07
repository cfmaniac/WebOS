<cfcomponent>
	<cffunction name="getrates" access="public" returntype="any">
	<cfargument name="dest_url" required="yes" type="any">
    <cfargument name="dest_dir" required="yes" type="any">
    <cfargument name="grabrates_url" required="yes" type="any">
    <!---<cfhttp url="http://www.bankrate.com/aff/jsfeeds/aff-mtg-2.js" method="get">--->
    <cfhttp url="#arguments.grabrates_url#" method="get">
<cfset content = #cfhttp.FileContent#>
<!---Removes the Logo--->
<cfset content = replace(#content#,'<a href="http://www.bankrate.com/aff/default.asp" target="_blank"><img src="http://www.bankrate.com/brm/images/brmlogos/bankrate_120.gif" alt="Bankrate.com" width="120" height="22" border="0">','')>
<!---Removes the 30yr Mortgage Link--->
<cfset content = replace(#content#,'<a href="http://www.bankrate.com/aff/subhome/mtg_m1.asp" target="_blank">30 yr fixed mtg</a>','30 Year Fixed Mortgage')>
<!---Removes the 15yr Mortgage Link--->
<cfset content = replace(#content#,'<a href="http://www.bankrate.com/aff/subhome/mtg_m2.asp" target="_blank">15 yr fixed mtg</a>','15 Year Fixed Mortgage')>
<!---Removes the 30yr Jumbo Mortgage Link--->
<cfset content = replace(#content#,'<a href="http://www.bankrate.com/aff/subhome/mtg_m4.asp" target="_blank">30 yr fixed jumbo mtg</a>','30 Year Fixed Jumbo Mortgage')>
<!---Removes the 5/1 ARM Link--->
<cfset content = replace(#content#,'<a href="http://www.bankrate.com/aff/subhome/mtg_m6.asp" target="_blank">5/1 ARM</a>','5/1 ARM')>
<!---Removes the 30yr Graph Link--->
<cfset content = replace(#content#,'<a href="http://www.bankrate.com/aff/graphs/graph_trend.asp?product=1&amp;prodtype=M&amp;ad=mtg" target="_blank"><img src="http://www.bankrate.com/brm/images/brm_nd/graph.gif" border="0" width="29" height="11" alt="Graph the three month trend"></a>','')>
<!---Removes the 15yr Graph Link--->
<cfset content = replace(#content#,'<a href="http://www.bankrate.com/aff/graphs/graph_trend.asp?product=2&amp;prodtype=M&amp;ad=mtg" target="_blank"><img src="http://www.bankrate.com/brm/images/brm_nd/graph.gif" border="0" width="29" height="11" alt="Graph the three month trend"></a>','')>
<!---Removes the 30yr fixed jumbo Graph Link--->
<cfset content = replace(#content#,'<a href="http://www.bankrate.com/aff/graphs/graph_trend.asp?product=3&amp;prodtype=M&amp;ad=mtg" target="_blank"><img src="http://www.bankrate.com/brm/images/brm_nd/graph.gif" border="0" width="29" height="11" alt="Graph the three month trend"></a>','')>
<!---Removes the 4th Graph Link--->
<cfset content = replace(#content#,'<a href="http://www.bankrate.com/aff/graphs/graph_trend.asp?product=4&amp;prodtype=M&amp;ad=mtg" target="_blank"><img src="http://www.bankrate.com/brm/images/brm_nd/graph.gif" border="0" width="29" height="11" alt="Graph the three month trend"></a>','')>
<!---Removes the 5/1 ARM Graph Link--->
<cfset content = replace(#content#,'<a href="http://www.bankrate.com/aff/graphs/graph_trend.asp?product=6&amp;prodtype=M&amp;ad=mtg" target="_blank"><img src="http://www.bankrate.com/brm/images/brm_nd/graph.gif" border="0" width="29" height="11" alt="Graph the three month trend"></a>','')>
<!---Writes the File to a Temp Directory--->
<cffile action="Write" file="#GetTempDirectory()#ticker.js" output="#content#"> 

<!---Moves the File--->
<!---<cffile action ="move" source = "#GetTempDirectory()#ticker.js" destination = "" nameconflict="overwrite">--->
<cffile action="move" source="#GetTempDirectory()#ticker.js" destination="#arguments.dest_dir#" nameconflict="overwrite">
<cfoutput>
<script language="javascript" src="#arguments.dest_url#ticker.js">
</script>
</cfoutput>

	</cffunction>
</cfcomponent>