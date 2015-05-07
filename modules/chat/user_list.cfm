<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>user_list.jpg</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
</style>

</head>
<body bgcolor="#ffffff">
<table width="135" border="0" align="center" cellpadding="0" cellspacing="0">
<!-- fwtable fwsrc="chat_users.png" fwpage="Page 1" fwbase="user_list.jpg" fwstyle="Dreamweaver" fwdocid = "203887504" fwnested="0" -->
  <tr>
   <td><img src="../../templates/Default/modules/chat/spacer.gif" width="135" height="1" border="0" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>

  <tr>
   <td><img name="user_list_r1_c1" src="../../templates/Default/modules/chat/user_list_r1_c1.jpg" width="135" height="37" border="0" id="user_list_r1_c1" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/spacer.gif" width="1" height="37" border="0" alt="" /></td>
  </tr>
  <tr>
   <td valign="top" background="../../templates/Default/modules/chat/user_list_r2_c1.jpg"><form>
   <cfoutput>
   <ul>
   <cfloop list="#Application.UserList#" index="UserName" delimiters="#chr(9)#">
        <cfif #session.MyUsername# EQ #UserName#>
        <li><b>#UserName#</b></li>
        <cfelse>
         <li>#UserName#</li>
        </cfif>
    </cfloop>
    </ul>
	</cfoutput>
    <center>
    <!---<input type="submit" name="Refresh" value="Refresh User List">--->
    <input name="Refresh" type="image" src="../../templates/Default/modules/chat/images/refresh.jpg" />
    </center>
   </form>
   </td>
   <td><img src="../../templates/Default/modules/chat/spacer.gif" width="1" height="83" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="user_list_r3_c1" src="../../templates/Default/modules/chat/user_list_r3_c1.jpg" width="135" height="15" border="0" id="user_list_r3_c1" alt="" /></td>
   <td><img src="../../templates/Default/modules/chat/spacer.gif" width="1" height="15" border="0" alt="" /></td>
  </tr>
</table>
</body>
</html>
