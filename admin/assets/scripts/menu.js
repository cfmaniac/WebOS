// Rev. 09/07/2003

function Toggle(item) {
	var obj;
	if ( document.getElementById ) 
   	{
		obj=document.getElementById(item);
	} else {
		obj = document.all[item];
	}
	var key;
   	if ( document.getElementById ) 
   	{
		key=document.getElementById("x" + item);
	} else {
		key = document.all['x' +item];
	}	

	if (obj != undefined) {
		var visible = ( obj.style.display != 'none');
		if (visible) {
			obj.style.display="none";
			key.innerHTML="<img src='assets/icons/arrow_closed.gif' width='10' height='10' hspace='0' vspace='0' border='0'>";
		} else {
			obj.style.display="block";
			key.innerHTML="<img src='assets/icons/arrow_opened.gif' width='10' height='10' hspace='0' vspace='0' border='0'>";
		}
	}
	
}

function Expand() {
   if (document.getElementById) {
	    divs=document.getElementsByTagName("DIV");
	} else {		
		divs = document.all['DIV'];
	}

   for (i=0;i<divs.length;i++) {
     divs[i].style.display="block";
     key=document.getElementById("x" + divs[i].id);
     key.innerHTML="<img src='assets/icons/arrow_opened.gif' width='10' height='10' hspace='0' vspace='0' border='0'>";
   }
}

function Collapse() {
	if (document.getElementById) {
	    divs=document.getElementsByTagName("DIV");
	} else {		
		divs = document.all['DIV'];
	}
   
   for (i=0;i<divs.length;i++) {
     divs[i].style.display="none";
     key=document.getElementById("x" + divs[i].id);
     key.innerHTML="<img src='assets/icons/arrow_closed.gif' width='10' height='10' hspace='0' vspace='0' border='0'>";
   }
}

