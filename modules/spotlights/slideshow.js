

var nua = navigator.userAgent.toLowerCase();
var nn = nua.indexOf("netscape/7.1") != -1;

if (nn) {
	var ssTop = getElementTop("slideshow_rdr");
	var elem = document.getElementById("slideshow_rdr");
	elem.className += " .slide_nn";
	elem = document.getElementById("slideshowcontrols");
	elem.style.left = "15px";
	elem.style.top = String(ssTop + 272) + "px";
}

function hp_addLoadEvent(func) {
	var oldonload = window.onload;
	if (typeof window.onload != 'function') {
		window.onload = func;
	} else {
		window.onload = function() {
			oldonload();
			func();
		}
	}
}

function loadSlides() {
	var elem, elem_id;

	for (i=2;i<=slide_images.length;i++) {
		elem_id = "slide_image" + String(i);
		elem = document.getElementById(elem_id);
		if (elem != null) {
			elem.src = slide_images[i-1];
		}
	}
}

hp_addLoadEvent(loadSlides);

function getElementTop(p_elm) {
	var y = 0;
	var elm;
	if(typeof(p_elm) == "object"){
		elm = p_elm;
	} else {
		elm = document.getElementById(p_elm);
	}
	while (elm != null) {
		y+= elm.offsetTop;
		elm = elm.offsetParent;
	}
	return parseInt(y);
}

function slideshow(objName)
{
  /* Parameters */
  this.objName = objName;
  this.playDelay = 7000;
  this.fadeDelay = 30;
  this.loop = true;
  this.slideBaseId = 'slide';
  this.slidelinks_containerBaseId = 'slidelinks_container';
  this.linkBaseId = 'slidelink';
  this.pauseId = 'slidepause';
  this.hideClass = 'hide';
  this.activeClass = 'activeslide';
  this.fadeClass = 'opacity';
  this.current = 0;
  this.last = 0;
  this.slides = [];
  this.slidelinks_containers = [];
  this.playTimeoutId = 0;
  this.fadeTimeoutId = 0;

  /* Global variables used:
     slideduration = array of playDelay values
   */

  /* Methods */
  this.init = function()
    {
      /* This will be called automatically when you create the new object. */

      /* Get all of the slide DIVs */
      var count = 1;
      var s;
      while (s = this.getElementById(this.slideBaseId + count)) {
	this.slides[count-1] = s;
	count++;
      }
	  count = 1;
      while (sl_cont = this.getElementById(this.slidelinks_containerBaseId + count)) {
	this.slidelinks_containers[count-1] = sl_cont;
	count++;
      }
      this.display();
    }

  this.getElementById = function(id)
    {
      if (document.getElementById) {
	return document.getElementById(id);
      }
      else if (document.all) {
	return document.all[id];
      }
      else if (document.layers) {
	return document.layers[id];
      } else {
	throw 'Invalid element id "' + id + '"';
      }
    }

  this.addClassName = function(id, classname)
    {
      var e;

      /* The id parameter can be an element id string,
	 or a pointer to an element in the DOM
      */
      if (typeof(id) == 'string') {
	e = this.getElementById(id);
      } else {
	e = id;
      }

      if (!e || typeof e.className != 'string') {
	throw "Cannot add class to element " + id;
      }

      /* Check if the class is already there */
      if (!e.className.match(new RegExp('\\b' + classname + '\\b'))) {
	e.className += ' ' + classname;
      }
    }


  this.addParentClassName = function(id, classname)
    {
      var e;

      /* The id parameter can be an element id string,
	 or a pointer to an element in the DOM
      */
      if (typeof(id) == 'string') {
	e = this.getElementById(id);
      } else {
	e = id;
      }

      if (!e || typeof e.className != 'string') {
	throw "Cannot add class to element " + id;
      }

      /* Check if the class is already there */
      if (!e.className.match(new RegExp('\\b' + classname + '\\b'))) {
	e.className += ' ' + classname;
      }
    }




  this.removeClassName = function(id, classname)
    {
      var e;

      if (typeof(id) == 'string') {
	e = this.getElementById(id);
      } else {
	e = id;
      }

      if (!e || typeof e.className != 'string') {
	throw "Cannot remove class from element " + id;
      }

      e.className = e.className.replace(new RegExp(' ?\\b' + classname + '\\b'), '');
    }

  this.removeParentClassName = function(id, classname)
    {
      var e;

      if (typeof(id) == 'string') {
	e = this.getElementById(id);
      } else {
	e = id;
      }

      if (!e || typeof e.className != 'string') {
	throw "Cannot remove class from element " + id;
      }

      e.className = e.className.replace(new RegExp(' ?\\b' + classname + '\\b'), '');
    }






  this.display = function()
    {
      var s, sl_cont, i, hideRegExp, activeRegexp;

      /* Hide all slides but the current one */
      for (i=0; i < this.slides.length; i++) {
	s = this.slides[i];
	sl_cont = this.slidelinks_containers[i];

	if (s) {
	  this.addClassName(s, this.hideClass);
	  this.addClassName(sl_cont, this.hideClass);
	  this.removeClassName(s, this.fadeClass+'.');
	  this.removeClassName(sl_cont, this.fadeClass+'.');
	}
	this.removeClassName(this.linkBaseId + (i+1), this.activeClass);
	this.removeParentClassName(this.getElementById(this.linkBaseId + (i+1)).parentNode, 'activeslidelist');

	  }

      /* Reveal the current slide */
      this.removeClassName(this.slides[this.current], this.hideClass);
      this.removeClassName(this.slidelinks_containers[this.current], this.hideClass);

      /* Indicate which slide link is active */
      this.addClassName(this.linkBaseId + (this.current+1), this.activeClass);
      this.addParentClassName(this.getElementById(this.linkBaseId + (this.current+1)).parentNode, 'activeslidelist');

      /* Fade in the slide */
      this.fadeIn();
    }

  this.next = function()
    {
      this.stop();
      this.last = this.current;
      this.current++;
      if (this.current >= this.slides.length) {
	if (this.loop) {
	  this.current = 0;
	} else {
	  this.current--;
	}
      }
      this.display();
    }

  this.previous = function()
    {
      this.stop();
      this.last = this.current;
      this.current--;
      if (this.current < 0) {
	if (this.loop) {
	  this.current = this.slides.length - 1;
	} else {
	  this.current = 0;
	}
      }
      this.display();
    }

  this.play = function(next)
    {
      var delay = this.playDelay;

      /* Clear the timeout to prevent potential conflicts */
      if (this.playTimeoutId) {
	clearTimeout(this.playTimeoutId);
      }

      if (next) {
	this.next();
      }

      if (slideduration) {
	delay =  slideduration[this.current];
      }

      this.playTimeoutId = setTimeout(this.objName + ".play(true)", delay);
      this.setPauseText();
    }

  this.playToggle = function()
    {
      if (this.isPlaying()) {
	this.stop();
      } else {
	this.play('next');
      }
    }

  this.stop = function()
    {
      if (this.playTimeoutId) {
	clearTimeout(this.playTimeoutId);
      }
      this.playTimeoutId = 0;
      this.setPauseText();
    }

  this.isPlaying = function()
    {
      return this.playTimeoutId;
    }

  this.setPauseText = function()
    {
      var pauseElement = document.getElementById(this.pauseId);
      if (!pauseElement) {
	throw('Error getElementById '+this.pauseId);
      }

      if (this.isPlaying()) {
	pauseElement.innerHTML = '<img src="templates/Default/modules/spotlights/images/pause.gif" border="0" height="15" width="15" alt="Pause the spotlights and browse manually">';
      } else {
	pauseElement.innerHTML = '<img src="templates/Default/modules/spotlights/images/play.gif" border="0" height="15" width="15" alt="Resume the automatic spotlight feature">';
      }
    }

  this.gotoSlide = function(n)
    {
      this.stop();
      this.last = this.current;
      this.current = n - 1;
      this.display();
    }

  this.fadeIn = function(i)
    {
      /* Make sure current and last slide are different */
      if (this.current == this.last) {
	return;
      }

      /* Argument "i" is a number from 1 to 10 */
      if (!i) {
	i = 1;
      }

      /* Make sure we have a valid number 1-10 */
      if (i<1 || i>10) {
	throw "Invalid fadeIn number " + i;
      }

      if (i==10) {
		this.removeClassName(this.slides[this.current], this.fadeClass + '.');
		this.removeClassName(this.slides[this.last], this.fadeClass + '.');
		return;
      }

	  if (i==5) {
		this.removeClassName(this.slidelinks_containers[this.current], this.fadeClass + '.');
		this.removeClassName(this.slidelinks_containers[this.last], this.fadeClass + '.');
	  }

      /* Make sure there are no conflicting fades going on */
      this.fadeCancel();

      /* Set the opacity style for the new slide to fade in */
      this.addClassName(this.slides[this.current], this.fadeClass + i);
      this.removeClassName(this.slides[this.current], this.fadeClass + '[^' + i + ']');

      /* Set the opacity style for the old slide to fade out */
      this.addClassName(this.slides[this.last], this.fadeClass + (10-i));
      this.removeClassName(this.slides[this.last], this.fadeClass + '[^' + (10-i) + ']');

      if (i < 10) {
	this.fadeTimeoutId = setTimeout(this.objName+'.fadeIn('+(i+1)+')', this.fadeDelay);
      }
    }

  this.fadeCancel = function()
    {
      if (this.fadeTimeoutId) {
	clearTimeout(this.fadeTimeoutId);
      }
      this.fadeTimeoutId = 0;
    }

  /* Initialize the display */
  this.init();
}

if (typeof(slide_images) == "object") {
	if (slide_images.length < 3) {
		if (slide_images[1] != undefined) {
			var ss = new slideshow("ss","slide");
			ss.play();
		}
	}
	else {
		var ss = new slideshow("ss","slide");
		ss.play();
	}
}