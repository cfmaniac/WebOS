<!---
	Name         : navLinks.cfm
	Author       : James Harvey
	Created      : August 03, 2007
	Last Updated : August 03, 2007
	History      : Version 1.0
--->
<cfif URL.linkID EQ 1>
  <CFPARAM name="start" default="1">
  <cfparam name="disp" default="10">
  <cfparam name="show_back_config" default="0">
  <cfparam name="show_next_config" default="0">

  <cfset end=Start + disp>
  <cfif start + disp greater than get_posts.RecordCount>
    <cfset end=999>
    <cfelse>
    <cfset end=Start + disp - 1>
  </cfif>
  <cfset ad = 1>
  <cfif start not equal 1>
    <cfif start gte disp>
      <cfset prev=disp>
      <cfset prevrec=start - disp>
      <cfelse>
      <cfset prev=start - 1>
      <cfset prevrec=1>
    </cfif>
    <cfset show_back_config = 1>
  </cfif>
  <cfif end lt get_posts.RecordCount>
    <cfif start + disp * 2 GTE get_posts.RecordCount>
      <cfset next=get_posts.RecordCount - start - disp + 1>
      <cfelse>
      <cfset next=disp>
    </cfif>
    <cfset show_next_config = 1>
  </cfif>
  <cfelseif url.linkID eq 2>
  <div class="navigation">
    <cfif show_back_config eq 1>
      <div class="alignleft"><a href="http://#site_domain##site_folder#index.cfm?module=blog&start=<CFOUTPUT>#prevrec#</CFOUTPUT>"><small>&laquo; Newer Entries</small></a></div>
    </cfif>
    <cfif show_next_config eq 1>
      <div class="alignright"><a href="http://#site_domain##site_folder#index.cfm?module=blog&start=<CFOUTPUT>#Evaluate("start + disp")#</cfoutput>"><small>Older Entries &raquo;</small></a></div>
    </cfif>
  </div>
  <cfelseif URL.LinkID EQ 3>
  <a name="comment">&nbsp;</a>
  <cfinvoke component="blog" METHOD="Get_Com" returnvariable="get_com" cid="#get_posts.blID#"></cfinvoke>
  <div class="commentCount"><strong><cfoutput>#get_com.RecordCount# Comment<cfif get_com.RecordCount neq 1>s</cfif>
    </cfoutput></strong></div>
  <cfloop query="get_com" startrow="1" endrow="#get_com.RecordCount#">
    <cfoutput>
      <div align="justify" class="commentText">
        <cfset incomment1 = replace(get_com.cCom, Chr(10) & Chr(13),"<br /><br />","ALL")>
        <cfset incomment2 = replace(incomment1, Chr(10) & Chr(13),"<br /><br />","ALL")>
        #incomment2#</div>
      <div class="postcomment" align="right">
        <cfif get_com.cLink is not "">
          <a href="#get_com.cLink#" target="new"><strong>#get_com.cName#</strong></a> - <span class="ComLink">#dateformat(get_com.cDate,"Dddd, Mmmm dd, YYYY")#</span>
          <cfelse>
          <strong>#get_com.cName#</strong> - <span class="ComLink">#dateformat(get_com.cDate,"Dddd, Mmmm dd, YYYY")#</span>
        </cfif>
      </div>
    </cfoutput>
  </cfloop>
  <br />
  <br />
  <br />




  <cfif showForm is "yes">
    <b>Leave a comment.</b>
    <p>
    <form name="comment" method="post" action="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=blog&dopost=yes&id=<CFOUTPUT>#get_posts.blID#&c&d</CFOUTPUT>&add_comment=add"  onSubmit="stripHTML(this.inname, this.inemail, this.incomment)">
      <label>Name:<br>
      <input type="text" value="<cfif IsDefined("Cookie.BlogName")><cfoutput>#Cookie.BlogName#</cfoutput><cfelse><cfoutput>#inname#</cfoutput></cfif>" name="inname" <cfif comment_name IS "yes">class="TextField"</cfif> TABINDEX=1>
      <BR>
      <cfif comment_name IS "yes">
        <small><font color="#fF0000"> &nbsp;*Name field is required</font></small><br />
      </cfif>
      </label>
      <label>URL:<br>
      <input type="text" value="<cfif IsDefined("Cookie.BlogURL")><cfoutput>#Cookie.BlogURL#</cfoutput><cfelse><cfoutput>#inlink#</cfoutput></cfif>" name="inlink" TABINDEX=2>
      </label>
      <br>
      <label>Email:<br>
      <input type="text" value="<cfif IsDefined("Cookie.BlogEmail")><cfoutput>#Cookie.BlogEmail#</cfoutput><cfelse><CFOUTPUT>#inemail#</CFOUTPUT></cfif>" name="inemail" <cfif comment_email IS "yes">class="TextField"<cfelseIF comment_email IS "no">class="TextField"</cfif> TABINDEX=3>
      <small>&nbsp;Email will not be displayed</small><BR>
      <cfif comment_email IS "yes">
        <small><font color="#fF0000"> &nbsp;*Email field is required</font></small><br />
        <cfelseIF comment_email IS "no">
        <small><font color="#fF0000"> &nbsp;*You entered an invalid email address.</font></small><br />
      </cfif>
      </label>
      <br>
      <label>Comment:<br>
      <textarea name="incomment" cols="31" rows="5" wrap=physical onKeyDown="textCounter(this.form.incomment,this.form.remLen,500);" onKeyUp="textCounter(this.form.incomment,this.form.remLen,500);" <cfif comment_com IS "yes">class="TextField"</cfif> TABINDEX=4><CFOUTPUT>#incomment#</CFOUTPUT></textarea>
      &nbsp;
      <input readonly type=text name=remLen size=3 maxlength=3 value="500">
      <small><font color="#C2BDBD"> characters left</font></small><br>
      <cfif comment_com IS "yes">
        <small><font color="#fF0000"> &nbsp;*Comment field is required</font></small><br>
      </cfif>
      </label>
      <!---<!--- create captcha --->
      <cfif not structKeyExists(application, "captcha")>
        <cfset application.captcha.captcha = createObject("component", "captcha.captchaService").init(configFile="captcha/captcha.xml") />
        <cfset application.captcha.captcha.setup()>
      </cfif>
      <cfoutput>
        <label>
        Enter text shown in the image:<br>
        <input type="text" name="captcha" <cfif comment_cap IS "yes">class="TextField"</cfif> TABINDEX=5>
        <cfif comment_cap IS "yes">
          <small><font color="##fF0000"> &nbsp;*You did not match the image text.</font></small><br>
        </cfif>
        <!--- Captcha ---><br />
        <cfset captcha = application.captcha.captcha.createHashReference()>
        <img src="#application.siteAddress#captcha/captcha.cfm?hash=#captcha.hash#">
        <input name="hash" type="hidden" value="#captcha.hash#" />
      </cfoutput>
      </label>
      <label><br><br />--->
      <label>Subscribe: <input type="checkbox" name="insubscribe" id="insubscribe" value="1" <cfif insubscribe is "on">checked</cfif> />
      </label><br>
      <label>Remember Me: <input type="checkbox" name="inrememberme" id="inrememberme" value="1" <cfif inrememberme is "on">checked</cfif> />
      </label><br><br>
      <input type="submit" name="Submit" value="Submit">
      </td>
      </label>
    </form>
    </p>
    <cfelse>
    <div class="alts" align="center"> <small><font color="##ff0000"><CFOUTPUT><B>#message#</B></CFOUTPUT></font></small> </div>
  </cfif>
  <cfelseif url.linkID EQ 4>
  <cfinvoke component="blog" METHOD="Get_Post" returnvariable="get_posts" dosearch=#variables.tsearch#  id=#variables.dpost# search="#form.this_search#" cat="#url.cat#" mm=#url.calMonth# dd=#url.calDay# yy=#URL.calYear#></cfinvoke>
  <cfif  add_comment IS "add">
    <cfif inname IS "">
      <cfset comment_name = "yes">
    </cfif>
    <cfif inemail IS "">
      <cfset comment_email = "yes">
      <cfelseif not ReFind(".+@.+..+", inemail)>
      <cfset comment_email = "no">
    </cfif>
    <cfif incomment IS "">
      <cfset comment_com = "yes">
    </cfif>
    <!---<cfif not application.captcha.captcha.validateCaptcha(form.hash, form.captcha)>
      <cfset comment_cap  = "yes" >
    </cfif>--->
    <!---<cfif comment_name IS "yes" OR comment_email IS "yes" or comment_email IS "no" or comment_com IS "yes" or comment_cap is "yes">
      <cfset showForm = "yes">
      <cfelse>--->
<cfif comment_name IS "yes" OR comment_email IS "yes" or comment_email IS "no" or comment_com IS "yes">
      <cfset showForm = "yes">
      <cfelse>
<cfif inrememberme is "1">
<cfcookie name="BlogName" value="#inname#"> 
<cfcookie name="BlogURL" value="#inlink#"> 
<cfcookie name="BlogEmail" value="#inemail#"> 
</cfif>
      <cfset showForm = "no">
	
<cfmail server="#application.sitemailServer#" to="#application.siteEmail#" from ="#inemail#" subject="New comment for #get_posts.blTitle# from http://#application.sitedomain#">
You have a new comment for post "#get_posts.blTitle#"
From #inname# 
URL: #inLink# 
Email: #inemail# 
Comment: #incomment# 
===========================================================
This message was sent by an automaticly from #application.siteTitle#
===========================================================
</cfmail>
<cfinvoke component="blog" METHOD="getSubscribers" returnvariable="getSubscribers" cid="#id#" tEmail="#inemail#"></cfinvoke>
<cfinvoke component="blog" METHOD="Get_Com" returnvariable="get_com" cid="#id#"></cfinvoke>
		<cfloop query="getSubscribers" startrow="1" endrow="#getSubscribers.RecordCount#">
	<cfoutput>
<cfmail server="#application.sitemailServer#" to="#getSubscribers.cEmail#"
from ="#application.siteEmail#"
subject="Comment added to #get_posts.blTitle#">
Comment added to Blog Entry: #get_posts.blTitle#
Comment made by: #inname# <cfif inlink is not "">(#inlink#)</cfif>
URL: #application.siteAddress#index.cfm/dopost/yes/id/#get_posts.blID#/
	
#incomment#
	
------------------------------------------------------------
Unsubscribe: #application.siteAddress#unsubscribe.cfm?commentID=#id#&e=#getSubscribers.cEmail#
This blog powered by CFBloggy
Created by James Harvey (jchharvey@gmail.com)
</cfmail>
	</cfoutput>
		</cfloop>
	      <cftransaction>
        	<cfquery datasource="#datasrc#" Name="addComment">
			    INSERT INTO #table_blog_comments# (cbid, cName, cLink, cEmail, cCom, cStatus, cSubscribe)
				VALUES (#id#, '#inname#', '#inlink#', '#inemail#', '#incomment#', 1, #insubscribe#)
			</cfquery>
      	</cftransaction>
      <cfset message = "Thank you, your comment has been added.">
    </cfif>
  </cfif>
</cfif>
