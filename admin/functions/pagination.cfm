<cfoutput>
<cfscript>
   obj = createobject("component","pagination");
   search = obj.mymethod(id=url.id);
</cfscript>

<!--- modify paging recordsets behavior of dreamweaver--->
<cfif search.recordcount>
   <cfset StartRow=Min((PageNum-1)*MaxRows+1,Max(search.RecordCount,1))>
   <cfset EndRow=Min(StartRow+MaxRows-1,search.RecordCount)>
   <cfset TotalPages=Ceiling(search.RecordCount/MaxRows)>
   <cfset QueryString=Iif(CGI.QUERY_STRING NEQ "",DE("&"&XMLFormat(CGI.QUERY_STRING)),DE(""))>
   <cfset tempPos=ListContainsNoCase(QueryString,"PageNum=","&")>
   <cfif tempPos NEQ 0>
      <cfset QueryString=ListDeleteAt(QueryString,tempPos,"&")>
   </cfif>
<cfif search.recordcount gt MaxRows>

   <div class="pagenum">

   <!—setup the numbers that we need to google bar -->
   <cfif PageNum gte Ceiling(shownumbers/2)>
      <cfif (shownumbers mod 2) neq 0>
         <cfset minimum = PageNum - int(shownumbers/2)-1>
      <cfelse>
         <cfset minimum = PageNum - int(shownumbers/2)>
      </cfif>
   </cfif>

   <!—-- sometimes minimum is equal to zero, the setup to 1--->
   <cfif minimum eq 0>
      <cfset minimum = 1>
   </cfif>

   <!--- setup the first page or page no. 1 --->

   <cfif PageNum gt 1>
      <a href="#CurrentPage#?PageNum=1#QueryString#"<cfif minimum eq PageNum>style="font-weight:bold; color:##339966"</cfif>>First Page</a> ||
      <cfif minimum gte 2>
         ...
      </cfif>
   </cfif>

   <!- setup the other number pages ->

   <cfloop index="limit" from="1" to="#shownumbers#">
      <cfif TotalPages gte minimum >
         <a href="#CurrentPage#?PageNum=#minimo##QueryString#" <cfif minimo eq PageNum>style="font-weight:bold; color:##FF9900"</cfif>>#minimo#</a>


      </cfif>
      <cfif minimo lt TotalPages>
         <cfif limit eq shownumbers>
            ...
         <cfelse>
            ,
         </cfif>
      </cfif>
      <cfif minimum gt TotalPages>
         <cfbreak>
      </cfif>
      <cfset minimum = minimo + 1>
   </cfloop>

   <!--- setup the last page --->
   <cfif PageNum lt TotalPages>
      || <a href="#CurrentPage#?PageNum=#TotalPages##QueryString#" <cfif minimo eq PageNum>style="font-weight:bold; color:##339966"</cfif>>Last Page</a>
   </cfif>
   </div>
</cfif>

Table of results
<table>
Now the trick for cfloop to calculate the end record is: endrow = StartRow + ( Maxrows – 1) (easy isn’t?)
<cfloop query="search"
            startRow="#StartRow#"
            endrow="#StartRow + (MaxRows - 1)#">
   <cfif search.currentrow mod 2 eq 0>
      <cfset color ="##EEEEEE">
   <cfelse>
      <cfset color ="##FFFFFF">
   </cfif>
   <tr bgcolor="#color#">
      <td class="searchborder" >#search.id#&nbsp;</td>
      <td class="searchborder" >#search.name#&nbsp;</td>
      <td class="searchborder" >#search.address#&nbsp;</td>
   </tr>
</cfloop>

</table>
</cfif>
</cfoutput>