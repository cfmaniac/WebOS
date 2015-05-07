<!---
	Name         : navLinks2.cfm
	Author       : James Harvey
	Created      : August 03, 2007
	Last Updated : August 03, 2007
	History      : Version 1.0
--->
<cfif not structKeyExists(application, "captcha")>
  <cfset application.captcha.captcha = createObject("component", "captcha.captchaService").init(configFile="captcha/captcha.xml") />
  <cfset application.captcha.captcha.setup()>
</cfif>

<cfoutput>
  <cfset captcha = application.captcha.captcha.createHashReference()>
  <img src="#site_address#captcha/captcha.cfm?hash=#captcha.hash#">
  <input name="hash" type="hidden" value="#captcha.hash#" />
</cfoutput>