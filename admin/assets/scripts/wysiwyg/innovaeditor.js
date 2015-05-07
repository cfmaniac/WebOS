/*** Editor Script Wrapper ***/
if (isHTML_Editor) {
var oScripts=document.getElementsByTagName("script");	
var sEditorPath;
for(var i=0;i<oScripts.length;i++)
	{
	var sSrc=oScripts[i].src.toLowerCase();
	if(sSrc.indexOf("scripts/wysiwyg/innovaeditor.js")!=-1) sEditorPath=oScripts[i].src.replace(/innovaeditor.js/,"");
	}

if(navigator.appName.indexOf('Microsoft')!=-1)
	document.write("<scr"+"ipt src='"+sEditorPath+"editor.js'></scr"+"ipt>");
else
	document.write("<scr"+"ipt src='"+sEditorPath+"moz/editor.js'></scr"+"ipt>");
}

function enableEditor(id, name, obj) {
	if (!isHTML_Editor)
		return alert(txt_advanced_editor_warning);

	if (!document.getElementById(id) || !document.getElementById(id+'Box') || !document.getElementById(id+'Adv') || !document.getElementById(id+'Dis') || !obj)
		return false;

	if (localBrowser == 'Opera') {
		var sx = document.body.scrollLeft;
		var sy = document.body.scrollTop;
	}

	document.getElementById(id).style.display = 'none';
	document.getElementById(id+'Box').style.display = '';
	document.getElementById(id).name = "";
	document.getElementById(id+'Adv').name = name;
	document.getElementById(id+'Enb').style.display = 'none';
	document.getElementById(id+'EnbB').style.display = '';
	document.getElementById(id+'Dis').style.display = '';
	document.getElementById(id+'DisB').style.display = 'none';
	setCookie(id+'EditorEnabled', 'Y');
//	obj.putHTML(document.getElementById(id).value.replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&amp;/g,'&'));
	obj.putHTML(document.getElementById(id).value);
	obj.focus();

	if (localBrowser == 'Opera') {
		window.scrollTo(sx, sy);
	}
}

function disableEditor(id, name, obj) {
	if (!isHTML_Editor || !document.getElementById(id) || !document.getElementById(id+'Box') || !document.getElementById(id+'Adv') || !document.getElementById(id+'Dis') || !obj)
		return false;

	if (obj.mode == 'XHTMLBody')
		document.getElementById(id).value = obj.getXHTMLBody();
	else
		document.getElementById(id).value = obj.getXHTML();

	if (localBFamily == 'MSIE')
		setTimeout("document.getElementById('"+id+"').value = document.getElementById('"+id+"').value;", 100);

	document.getElementById(id).style.display = '';
	document.getElementById(id+'Box').style.display = 'none';
	document.getElementById(id).name = name;
	document.getElementById(id+'Adv').name = "";
	document.getElementById(id+'Enb').style.display = '';
	document.getElementById(id+'EnbB').style.display = 'none';
	document.getElementById(id+'Dis').style.display = 'none';
	document.getElementById(id+'DisB').style.display = '';
	setCookie(id+'EditorEnabled', 'N');

}


