<cfif IsDefined("FORM.new_message") and FORM.new_message IS NOT "">
      <cfset FORM.new_message = ReplaceList(FORM.new_message, Application.WordBanList, Application.WordReplace)>
	 <cfset Application.MessageLog = "<b>#session.MyUserName#</b>: #FORM.new_message#<br>" & Application.MessageLog>
</cfif>
<style type="text/css">
<!--
body,td,th {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: ##4279BC;
}
body {
	background-color: ##FFFFFF;
	background-repeat: no-repeat;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style><body onLoad="document.post.new_message.focus();MM_preloadImages('../../templates/Default/modules/chat/images/postmessages_r4_c8_f2.jpg','../../templates/Default/modules/chat/images/postmessages_r4_c10_f2.jpg');">

<form action="postmessages.cfm" method="post" name="post_msg">
<table width="450" border="0" align="center" cellpadding="0" cellspacing="0">
<!-- fwtable fwsrc="chat_box.png" fwpage="Page 1" fwbase="postmessages.jpg" fwstyle="Dreamweaver" fwdocid = "137776882" fwnested="0" -->
  <tr>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="6" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="10" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="133" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="23" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="89" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="9" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="9" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="70" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="19" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="71" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="10" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>

  <tr>
   <td colspan="11"><img name="postmessages_r1_c1" src="../../templates/Default/modules/chat/images/postmessages_r1_c1.jpg" width="449" height="8" border="0" id="postmessages_r1_c1" alt="" /></td>
   <td><img name="postmessages_r1_c12" src="../../templates/Default/modules/chat/images/postmessages_r1_c12.jpg" width="1" height="8" border="0" id="postmessages_r1_c12" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="1" height="8" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="postmessages_r2_c1" src="../../templates/Default/modules/chat/images/postmessages_r2_c1.jpg" width="6" height="20" border="0" id="postmessages_r2_c1" alt="" /></td>
   <td><img name="postmessages_r2_c2" src="../../templates/Default/modules/chat/images/postmessages_r2_c2.jpg" width="10" height="20" border="0" id="postmessages_r2_c2" alt="" /></td>
   <td colspan="6" background="../../templates/Default/modules/chat/images/postmessages_r2_c3.jpg">You are Currently Logged in as: <b><cfoutput>#session.MyUsername#</cfoutput></b></td>
   <td><img name="postmessages_r2_c9" src="../../templates/Default/modules/chat/images/postmessages_r2_c9.jpg" width="19" height="20" border="0" id="postmessages_r2_c9" alt="" /></td>
   <td colspan="3"><img name="postmessages_r2_c10" src="../../templates/Default/modules/chat/images/postmessages_r2_c10.jpg" width="82" height="20" border="0" id="postmessages_r2_c10" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="1" height="20" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="3" rowspan="3" background="../../templates/Default/modules/chat/images/postmessages_r3_c1.jpg">&nbsp;</td>
   <td rowspan="3"><img name="postmessages_r3_c4" src="../../templates/Default/modules/chat/images/postmessages_r3_c4.jpg" width="23" height="27" border="0" id="postmessages_r3_c4" alt="" /></td>
   <td colspan="2"><img name="postmessages_r3_c5" src="../../templates/Default/modules/chat/images/postmessages_r3_c5.jpg" width="98" height="3" border="0" id="postmessages_r3_c5" alt="" /></td>
   <td rowspan="3"><img name="postmessages_r3_c7" src="../../templates/Default/modules/chat/images/postmessages_r3_c7.jpg" width="9" height="27" border="0" id="postmessages_r3_c7" alt="" /></td>
   <td><img name="postmessages_r3_c8" src="../../templates/Default/modules/chat/images/postmessages_r3_c8.jpg" width="70" height="3" border="0" id="postmessages_r3_c8" alt="" /></td>
   <td rowspan="3"><img name="postmessages_r3_c9" src="../../templates/Default/modules/chat/images/postmessages_r3_c9.jpg" width="19" height="27" border="0" id="postmessages_r3_c9" alt="" /></td>
   <td><img name="postmessages_r3_c10" src="../../templates/Default/modules/chat/images/postmessages_r3_c10.jpg" width="71" height="3" border="0" id="postmessages_r3_c10" alt="" /></td>
   <td rowspan="3" colspan="2"><img name="postmessages_r3_c11" src="../../templates/Default/modules/chat/images/postmessages_r3_c11.jpg" width="11" height="27" border="0" id="postmessages_r3_c11" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="1" height="3" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><input type="text" name="new_message" id="new_message" style="width:89px;height:20px; border-top:1px solid #000; border-left: 0px solid #000; border-right: 0px solid #000; border-bottom: 1px solid #000; font-size:9px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#033260;font-weight:bold;"/></td>
   <td><img name="postmessages_r4_c6" src="../../templates/Default/modules/chat/images/postmessages_r4_c6.jpg" width="9" height="20" border="0" id="postmessages_r4_c6" alt="" /></td>
   <td><a href="#" onMouseOut="MM_swapImgRestore();" onMouseOver="MM_swapImage('postmessages_r4_c8','','../../templates/Default/modules/chat/images/postmessages_r4_c8_f2.jpg',1);" onClick="document.post_msg.submit();"><img name="postmessages_r4_c8" src="../../templates/Default/modules/chat/images/postmessages_r4_c8.jpg" width="70" height="20" border="0" id="postmessages_r4_c8" alt="" /></a></td>
   <td><a href="logout.cfm" onMouseOut="MM_swapImgRestore();" onMouseOver="MM_swapImage('postmessages_r4_c10','','../../templates/Default/modules/chat/images/postmessages_r4_c10_f2.jpg',1);" target="_top"><img name="postmessages_r4_c10" src="../../templates/Default/modules/chat/images/postmessages_r4_c10.jpg" width="71" height="20" border="0" id="postmessages_r4_c10" alt="" /></a></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="1" height="20" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="2"><img name="postmessages_r5_c5" src="../../templates/Default/modules/chat/images/postmessages_r5_c5.jpg" width="98" height="4" border="0" id="postmessages_r5_c5" alt="" /></td>
   <td><img name="postmessages_r5_c8" src="../../templates/Default/modules/chat/images/postmessages_r5_c8.jpg" width="70" height="4" border="0" id="postmessages_r5_c8" alt="" /></td>
   <td><img name="postmessages_r5_c10" src="../../templates/Default/modules/chat/images/postmessages_r5_c10.jpg" width="71" height="4" border="0" id="postmessages_r5_c10" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="1" height="4" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="12"><img name="postmessages_r6_c1" src="../../templates/Default/modules/chat/images/postmessages_r6_c1.jpg" width="450" height="10" border="0" id="postmessages_r6_c1" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/images/spacer.gif" width="1" height="10" border="0" alt="" /></td>
  </tr>
</table>
</form>