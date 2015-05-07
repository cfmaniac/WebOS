<!---\\ WEBOS MAILER :: Global Mail script for the webos CMS //--->

<!---\\ Before being able to successfully send an email this file needs to identify and parse 3
very important variables:
Variable 1 : #form.subject# [Emails will not be sent with out a subject]
Variable 2 : #form.thanks_location# [Redirect location after mail has been parsed and sent]
Variable 3 : #form.referrer# [This tells the script what module sent the form] This is generally populated from the #module# variable set up in the index.cfm file of each module
End of Development Notes for WebOS Mailer //--->
<Cfmail to="#form.to#" from="#site_name#" subject="#form.subject#" type="html" server="mail.swidigital.com" replyto="#form.from#">
#form.reply#

<hr>
Sent using  <a href="http://webos.riaforge.com">WebOS</a>:: Coldfusion Content Management & Website Operating System.
&copy; #dateformat(now(), "YYYY")# #site_name#
<hr>
</Cfmail>
<cflocation addtoken="no" url="#form.thanks_location#">