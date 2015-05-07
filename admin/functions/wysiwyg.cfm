

<!---\\Dynamic WYSIWYG EDITOR table Row for Modules that require a WYSIWYG Editor//--->
<cfif isDefined('url.do') and url.do EQ "a">
<tr>
    <td colspan="3" align="center" valign="top"><div class="AELinkBox" style="width: 576px;">
<a href="javascript: void(0);" id="<cfoutput>#editor_name#</cfoutput>Enb" onClick="javascript: enableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">WYSIWYG editor</a>
<b id="<cfoutput>#editor_name#</cfoutput>EnbB" style="display: none;">WYSIWYG editor</b>&nbsp;&nbsp;<a href="javascript: void(0);" style="display: none;" id="<cfoutput>#editor_name#</cfoutput>Dis" onClick="javascript: disableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">View Source</a>
<b id="<cfoutput>#editor_name#</cfoutput>DisB">View Source</b>
</div>
<textarea id="<cfoutput>#editor_name#</cfoutput>" name="<cfoutput>#editor_name#</cfoutput>" cols="50" rows="30" style="width:576px;"></textarea>
<div id="<cfoutput>#editor_name#</cfoutput>Box" style="width: 576px;">
<textarea id="<cfoutput>#editor_name#</cfoutput>Adv" cols="50" rows="30" style="width:576px;"></textarea>
<script type="text/javascript">
<!--

	if (isHTML_Editor) {
		if (!isHTML_EditorFF)
			document.getElementById('<cfoutput>#editor_name#</cfoutput>Box').style.display = 'none';

		var <cfoutput>#editor_name#</cfoutput>Editor = new InnovaEditor('<cfoutput>#editor_name#</cfoutput>Editor');
		
		<cfoutput>#editor_name#</cfoutput>Editor.width = 576;
		if (navigator.appName.indexOf('Microsoft')!=-1)
			<cfoutput>#editor_name#</cfoutput>Editor.height = 30*13;
		else if (navigator.appName.indexOf('Netscape')!=-1)
			<cfoutput>#editor_name#</cfoutput>Editor.height = 30*14;
		else
			<cfoutput>#editor_name#</cfoutput>Editor.height = 30*12;

		<cfoutput>#editor_name#</cfoutput>Editor.mode = 'XHTML';
		<cfoutput>#editor_name#</cfoutput>Editor.REPLACE("<cfoutput>#editor_name#</cfoutput>Adv");
		if (isHTML_EditorFF)
			document.getElementById('<cfoutput>#editor_name#</cfoutput>Box').style.display = 'none';

		var reg = new RegExp("(;|^)<cfoutput>#editor_name#</cfoutput>EditorEnabled=Y","");
		if (document.cookie.search(reg) != -1)
			document.getElementById('<cfoutput>#editor_name#</cfoutput>Enb').onclick;

	} else
		document.getElementById('<cfoutput>#editor_name#</cfoutput>Box').style.display = 'none';
-->
</script>
</div>   </td>
    </tr>
<cfelseif isDefined('url.do') and url.do EQ "e">
<tr>
    <td colspan="3" align="center" valign="top"><div class="AELinkBox" style="width: 576px;">
<a href="javascript: void(0);" id="<cfoutput>#editor_name#</cfoutput>Enb" onClick="javascript: enableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">WYSIWYG editor</a>
<b id="<cfoutput>#editor_name#</cfoutput>EnbB" style="display: none;">WYSIWYG editor</b>&nbsp;&nbsp;<a href="javascript: void(0);" style="display: none;" id="<cfoutput>#editor_name#</cfoutput>Dis" onClick="javascript: disableEditor('<cfoutput>#editor_name#</cfoutput>','<cfoutput>#editor_name#</cfoutput>', <cfoutput>#editor_name#</cfoutput>Editor);">View Source</a>
<b id="<cfoutput>#editor_name#</cfoutput>DisB">View Source</b>
</div>
<textarea id="<cfoutput>#editor_name#</cfoutput>" name="<cfoutput>#editor_name#</cfoutput>" cols="50" rows="30" style="width:576px;">
<cfif cgi.script_name EQ "#site_folder#admin/module_articles.cfm">
<cfoutput>#edit_article.article_description#</cfoutput>
<cfelseif cgi.script_name EQ "#site_folder#admin/module_didyouknow.cfm">
<cfoutput>#edit_dyk.dyk_content#</cfoutput>
<cfelseif cgi.script_name EQ "#site_folder#admin/module_links.cfm">
<cfoutput>#link_edit.link_desc#</cfoutput>
<cfelseif cgi.script_name EQ "#site_folder#admin/module_mainpage.cfm">
<cfoutput>#edit_page.main_page_content#</cfoutput>
<cfelseif cgi.script_name EQ "#site_folder#admin/module_pages.cfm">
<cfoutput>#edit_page.page_content#</cfoutput>
<cfelseif cgi.script_name EQ "#site_folder#admin/module_spotlights.cfm">
<cfoutput>#edit_spotlight.spotlight_description#</cfoutput>
<cfelseif cgi.script_name EQ "#site_folder#admin/admin_news.cfm">
<cfoutput>#edit_article.news_content#</cfoutput>
<cfelseif cgi.script_name EQ "#site_folder#admin/module_links.cfm">
<cfoutput>#link_edit.link_desc#</cfoutput>
</cfif>
</textarea>
<div id="<cfoutput>#editor_name#</cfoutput>Box" style="width: 576px;">
<textarea id="<cfoutput>#editor_name#</cfoutput>Adv" cols="50" rows="30" style="width:576px;">

</textarea>
<script type="text/javascript">
<!--

	if (isHTML_Editor) {
		if (!isHTML_EditorFF)
			document.getElementById('<cfoutput>#editor_name#</cfoutput>Box').style.display = 'none';

		var <cfoutput>#editor_name#</cfoutput>Editor = new InnovaEditor('<cfoutput>#editor_name#</cfoutput>Editor');
		
		<cfoutput>#editor_name#</cfoutput>Editor.width = 576;
		if (navigator.appName.indexOf('Microsoft')!=-1)
			<cfoutput>#editor_name#</cfoutput>Editor.height = 30*13;
		else if (navigator.appName.indexOf('Netscape')!=-1)
			<cfoutput>#editor_name#</cfoutput>Editor.height = 30*14;
		else
			<cfoutput>#editor_name#</cfoutput>Editor.height = 30*12;

		<cfoutput>#editor_name#</cfoutput>Editor.mode = 'XHTML';
		<cfoutput>#editor_name#</cfoutput>Editor.REPLACE("<cfoutput>#editor_name#</cfoutput>Adv");
		if (isHTML_EditorFF)
			document.getElementById('<cfoutput>#editor_name#</cfoutput>Box').style.display = 'none';

		var reg = new RegExp("(;|^)<cfoutput>#editor_name#</cfoutput>EditorEnabled=Y","");
		if (document.cookie.search(reg) != -1)
			document.getElementById('<cfoutput>#editor_name#</cfoutput>Enb').onclick;

	} else
		document.getElementById('<cfoutput>#editor_name#</cfoutput>Box').style.display = 'none';
-->
</script>
</div>   </td>
    </tr>
</cfif>    
<!---\\End of the table row//--->