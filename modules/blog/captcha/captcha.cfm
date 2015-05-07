<cfif not structKeyExists(url, "hash")>
	<cfabort>
</cfif>

<cfset variables.captcha = application.captcha.captcha.createCaptchaFromHashReference("stream",url.hash) />
<cfcontent type="image/jpg"  variable="#variables.captcha.stream#" reset="false" />