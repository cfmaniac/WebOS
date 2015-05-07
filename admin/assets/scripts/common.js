// JavaScript Document for WebOS:
// $Id: common.js,v 1.12.2.23 2007/08/30 10:49:09 max Exp $

//
// Enviroment identificator
//
var localIsDOM = document.getElementById?true:false;
var localIsJava = navigator.javaEnabled();
var localIsStrict = document.compatMode=='CSS1Compat';
var localPlatform = navigator.platform;
var localVersion = "0";
var localBrowser = "";
var localBFamily = "";
var isHttps = false;
if (window.opera && localIsDOM) {
	localBFamily = localBrowser = "Opera";
	if (navigator.userAgent.search(/^.*Opera.([\d.]+).*$/) != -1)
		localVersion = navigator.userAgent.replace(/^.*Opera.([\d.]+).*$/, "$1");
	else if (window.print)
		localVersion = "6";
	else
		localVersion = "5";
} else if (document.all && document.all.item)
	localBFamily = localBrowser = 'MSIE';
if (navigator.appName=="Netscape") {
	localBFamily = "NC";
	if (!localIsDOM) {
		localBrowser = 'Netscape';
		localVersion = navigator.userAgent.replace(/^.*Mozilla.([\d.]+).*$/, "$1");
		if(localVersion != '')
			localVersion = "4";
	} else if(navigator.userAgent.indexOf("Safari") >= 0)
		localBrowser = 'Safari';
	else if (navigator.userAgent.indexOf("Netscape") >= 0)
		localBrowser = 'Netscape';
	else if (navigator.userAgent.indexOf("Firefox") >= 0)
		localBrowser = 'Firefox';
	else 
		localBrowser = 'Mozilla';
	
}
if (navigator.userAgent.indexOf("MSMSGS") >= 0)
	localBrowser = "WMessenger";
else if (navigator.userAgent.indexOf("e2dk") >= 0)
	localBrowser = "Edonkey";
else if (navigator.userAgent.indexOf("Gnutella") + navigator.userAgent.indexOf("Gnucleus") >= 0)
	localBrowser = "Gnutella";
else if (navigator.userAgent.indexOf("KazaaClient") >= 0)
	localBrowser = "Kazaa";

if (localVersion == '0' && localBrowser != '') {
	var rg = new RegExp("^.*"+localBrowser+".([\\d.]+).*$");
	localVersion = navigator.userAgent.replace(rg, "$1");
}
var localIsCookie = ((localBrowser == 'Netscape' && localVersion == '4')?(document.cookie != ''):navigator.cookieEnabled);

if (document.location.protocol == "https:") { 
    isHttps = true;
}

function change_antibot_image(id) {
	var image = document.getElementById(id);
	if (image)
		image.src = xcart_web_dir+"/antibot_image.php?tmp="+Math.random()+"&section="+id+"&regenerate=Y";
}


/*
	Find element by classname
*/
function getElementsByClassName( clsName ) {
	var arr = new Array(); 
	var elems = document.getElementsByTagName("*");
	
	for ( var cls, i = 0; ( elem = elems[i] ); i++ ) {
		if ( elem.className == clsName ) {
			arr[arr.length] = elem;
		}
	}
	return arr;
}
//
// Opener/Closer HTML block
//
function visibleBox(id,skipOpenClose) {
	elm1 = document.getElementById("open"+id);
	elm2 = document.getElementById("close"+id);
	elm3 = document.getElementById("box"+id);

	if(!elm3)
		return false;

	if (skipOpenClose) {
		elm3.style.display = (elm3.style.display == "")?"none":"";
	} else if(elm1) {
		if (elm1.style.display == "") {
			elm1.style.display = "none";
			if(elm2)
				elm2.style.display = "";
			elm3.style.display = "none";
			var class_objs = getElementsByClassName('DialogBox');
			for (var i = 0; i < class_objs.length; i++) {
				class_objs[i].style.height = "1%";
			}
		} else {
			elm1.style.display = "";
			if(elm2)
				elm2.style.display = "none";
			elm3.style.display = "";
		}
	}
}

/*
	URL encode
*/
function urlEncode(url) {
	return url.replace(/\s/g, "+").replace(/&/, "&amp;").replace(/"/, "&quot;")
}

/*
	Math.round() wrapper
*/
function round(n, p) {
	if (isNaN(n))
		n = parseFloat(n);
	if (!p || isNaN(p))
		return Math.round(n);
	p = Math.pow(10, p);
	return Math.round(n*p)/p;
}

/*
	Price format
*/
function price_format(price, thousand_delim, decimal_delim, precision) {
	var thousand_delim = (arguments.length > 1 && thousand_delim !== false) ? thousand_delim : number_format_th;
	var decimal_delim = (arguments.length > 2 && decimal_delim !== false) ? decimal_delim : number_format_dec;
	var precision = (arguments.length > 3 && precision !== false) ? precision : number_format_point;

	if (precision > 0) {
		precision = Math.pow(10, precision);
		price = Math.round(price*precision)/precision;
		var top = Math.floor(price);
		var bottom = Math.round((price-top)*precision)+precision;

	} else {
		var top = Math.round(price);
		var bottom = 0;
	}

	top = top+"";
	bottom = bottom+"";
	var cnt = 0;
	for (var x = top.length; x >= 0; x--) {
		if (cnt % 3 == 0 && cnt > 0 && x > 0)
			top = top.substr(0, x)+thousand_delim+top.substr(x, top.length);

		cnt++;
	}

	return (bottom > 0) ? (top+decimal_delim+bottom.substr(1, bottom.length)) : top;
}

/*
	Substitute
*/
function substitute(lbl) {
var x, rg;
	for(x = 1; x < arguments.length; x+=2) {
		if(arguments[x] && arguments[x+1]) {
			rg = new RegExp("\\{\\{"+arguments[x]+"\\}\\}", "gi");
			lbl = lbl.replace(rg,  arguments[x+1]);
			rg = new RegExp('~~'+arguments[x]+'~~', "gi");
			lbl = lbl.replace(rg,  arguments[x+1]);
		}
	}
	return lbl;
}

function getWindowOutWidth(w) {
	if (!w)
		w = window;
	if (localBFamily == "MSIE")
		return w.document.body.clientWidth;
	else
		return w.outerWidth;
}

function getWindowOutHeight(w) {
	if (!w)
		w = window;
	if (localBFamily == "MSIE")
		return w.document.body.clientHeight;
	else
		return w.outerHeight;
}

function getWindowWidth(w) {
	if (!w)
		w = window;
    if (localBFamily == "MSIE")
		return w.document.body.clientWidth;
    else 
		return w.innerWidth;
}

function getWindowHeight(w) {
	if (!w)
		w = window;
    if (localBFamily == "MSIE")
		return w.document.body.clientHeight;
	else
		return w.innerHeight;
}

function getDocumentHeight(w){
	if (!w)
		 w = window;
	if (localBFamily == "MSIE" || (localBFamily == "Opera" && localVersion >= 7 && localVersion < 8))
		return isStrict ? w.document.documentElement.scrollHeight : w.document.body.scrollHeight;
	if (localBFamily == "NC")
		return w.document.height
	if (localBFamily == "Opera")
		return w.document.body.style.pixelHeight
}

function getDocumentWidth(w) {
	if (!w)
		w = window;
	if (localBFamily == "MSIE" || (localBFamily == "Opera" && localVersion >= 7 && localVersion < 8))
		return isStrict ? w.document.documentElement.scrollWidth : w.document.body.scrollWidth;
	if (localBFamily == "NC")
		return w.document.width;
	if (localBFamily == "Opera")
		return w.document.body.style.pixelWidth;
}

function expandWindowX(w, step, limit) {
	if (!w)
		w = window;

	if (!step)
		step = 10;

	var go = true;
	var i = 200;
	while (go && i--) {
		if (limit && getWindowOutWidth()+step > limit)
			break;

		try {
			w.scrollTo(step, 0);
			go = (w.document.documentElement && w.document.documentElement.scrollLeft > 0) || (w.document.body && w.document.body.scrollLeft > 0);
			if (go)
				w.resizeBy(step, 0);

		} catch (e) {
			return false;
		}
	}

	return true;
}

function expandWindowY(w, step, limit) {
	if (!w)
		w = window;

	if (!step)
		step = 10;

	var go = true;
	var i = 200;
	while (go && i--) {
		if (limit && getWindowOutHeight()+step > limit)
			 break;

		try {
			w.scrollTo(0, step);
			go = (w.document.documentElement && w.document.documentElement.scrollTop > 0) || (w.document.body && w.document.body.scrollTop > 0);
			if (go)
				w.resizeBy(0, step);

		} catch(e) {
			return false;
		}
	}

	return true;
}

/*
	Check list of checkboxes
*/
function checkMarks(form, reg, lbl) {
var is_exist = false;

	if (form.elements.length == 0)
		return true;

	for (var x = 0; x < form.elements.length; x++) {
		if (form.elements[x].name.search(reg) == 0 && form.elements[x].type == 'checkbox' && !form.elements[x].disabled) {
			is_exist = true;
			if (form.elements[x].checked)
				return true;
		}
	}

	if (!is_exist)
		return true;
	else if (lbl)
		alert(lbl);
	else if (lbl_no_items_have_been_selected)
		alert(lbl_no_items_have_been_selected);
	return false;
}

/*
	Submit form with specified value of 'mode' parmaeters
*/
function submitForm(formObj, formMode) {
	if (!formObj)
		return false;
	if (formObj.tagName != "FORM") {
		if (!formObj.form)
			return false;
		formObj = formObj.form;
	}
	if (formObj.mode)
		formObj.mode.value = formMode;
	formObj.submit();
}

/*
	Analogue of PHP function sleep()
*/
function sleep(msec) {
	var then = new Date().getTime()+msec;
	while (then >= new Date().getTime()){
	}
}

/*
	Convert number from current format
	(according to 'Input and display format for floating comma numbers' option)
	to float number
*/
function convert_number(num) {
	var regDec = new RegExp(reg_quote(number_format_dec), "gi");
	var regTh = new RegExp(reg_quote(number_format_th), "gi");
	var pow = Math.pow(10, parseInt(number_format_point));
	num = parseFloat(num.replace(" ", "").replace(regTh, "").replace(regDec, "."));
	return Math.round(num*pow)/pow;
}

/*
	Check string as number
	(according to 'Input and display format for floating comma numbers' option)
*/
function check_is_number(num) {
	var regDec = new RegExp(reg_quote(number_format_dec), "gi");
	var regTh = new RegExp(reg_quote(number_format_th), "gi");
	num = num.replace(" ", "").replace(regTh, "").replace(regDec, ".");
	return (num.search(/^[0-9]+(\.[0-9]+)?$/) != -1);
}

/*
	Qutation for RegExp class
*/
function reg_quote(s) {
	return s.replace(/\./g, "\\.").replace(/\//g, "\\/").replace(/\*/g, "\\*").replace(/\+/g, "\\+").replace(/\[/g, "\\[").replace(/\]/g, "\\]");
}

function setCookie(name, value, path, expires) {
	if (typeof(expires) == 'object') {
		try {
			var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
			var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
			if (days[expires.getDay()] && months[expires.getMonth()])
				expires = days[expires.getDay()]+" "+expires.getDate()+"-"+months[expires.getMonth()]+"-"+expires.getFullYear()+" "+expires.getHours()+":"+expires.getMinutes()+":"+expires.getSeconds()+" GMT";
		} catch(e) { }
	}

	if (typeof(expires) != 'string')
		expires = false;

	document.cookie = name+"="+escape(value)+(expires ? "; expires=" + expires : "")+(path ? "; path="+path : "");
}

function deleteCookie(name) {
	document.cookie = name+"=0; expires=Fri, 31 Dec 1999 23:59:59 GMT;";
}

/*
	Clone object
*/
function cloneObject(orig) {
	var r = {};
	for (var i in orig) {
		r[i] = orig[i];
	}

	return r;
}

/*
	Get first checkbox and redirect to URL
*/
function getFirstCB(form, reg) {

	while (form.tagName && form.tagName.toUpperCase() != 'FORM')
		form = form.parentNode;

	if (!form.tagName || form.tagName.toUpperCase() != 'FORM' || form.elements.length == 0)
        return false;

	var selectedChk = false;
    for (var x = 0; x < form.elements.length; x++) {
        if (form.elements[x].name.search(reg) == 0 && form.elements[x].type == 'checkbox' && !form.elements[x].disabled && form.elements[x].checked) {
			selectedChk = form.elements[x];
			break;
        }
    }
    
    if (!selectedChk) {
		if (lbl_no_items_have_been_selected)
			alert(lbl_no_items_have_been_selected);

        return false;
	}

    return selectedChk;
}

/*
	getElementById() wrapper
*/
function _getById(id) {
	if (typeof(id) != 'string' || !id)
		return false;

	var obj = document.getElementById(id);
	if (obj && obj.id != id) {
		obj = false;
		for (var i = 0; i < document.all.length && obj === false; i++) {
			if (document.all[i].id == id)
				obj = document.all[i];
		}
	}

	return obj;
}

// undefined or not
function isset(obj) {
	return typeof(obj) != 'undefined' && obj !== null;
}


// Check - variable is function or not
function isFunction(f) {
	return (typeof(f) == 'function' || (typeof(f) == 'object' && (f+"").search(/\s*function /) === 0));
}
