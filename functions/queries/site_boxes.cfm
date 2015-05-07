<!---\\Get Left Sideboxes //--->
<cfquery name="left_boxes" datasource="#datasrc#">
select * from #table_sideboxes# where side_box_active ='1' and side_box_column='left' Order BY side_box_position ASC      
</cfquery>
<!---\\Get Right SideBoxes//--->
<cfquery name="right_boxes" datasource="#datasrc#">
select * from #table_sideboxes# where side_box_active ='1' and side_box_column='right' Order BY side_box_position ASC      
</cfquery>