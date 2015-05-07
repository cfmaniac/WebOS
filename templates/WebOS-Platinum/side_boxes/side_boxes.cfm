<cfset current_box ="side_boxes.cfm">
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

</div>
<!---\\end Box Content//--->
</div>