<cfoutput>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
	<tr><form name="form" action="?module=forum" method="POST" onSubmit="return checkFields();">
		<td bgcolor="black">
				<table width="100%" border="0" cellspacing="1" cellpadding="1">
				<tr bgcolor="##eeeeee">
					<td width="450" colspan="2" valign="MIDDLE" nowrap>
						&nbsp;&nbsp;New Topic</font>
					</td>
				</tr>
				<tr bgcolor="white">
					<td width="100%" colspan="2" valign="MIDDLE" nowrap>
						<font face="Verdana,Helvetica,Arial" size="1" color="##eeeeee">
						<table cellspacing="0" cellpadding="2" border=0 width=100%>
							<tr>
								<td valign="TOP">&nbsp;Name:</td>
								<td><input type="Text" name="author" size=30 maxlength=50 value=""></td>
							</tr>
							<tr>
								<td valign="TOP">&nbsp;Email:</td>
							  <td><input type="Text" name="email" size=30 maxlength=100 value=""></td>
							</tr>
							<tr>
								<td valign="TOP">&nbsp;Topic:</td>
								<td><input type="Text" name="title" size="30"  maxlength="75"></td>
							</tr>
							<tr>
								<td valign="TOP">&nbsp;Body:</td>
								<td><FONT face = "Verdana,Helvetica,Arial" color="##eeeeee"><textarea name="message" cols="55" rows="8" wrap="VIRTUAL"></textarea></font></td>
							</tr>
							<tr>
								<td></td><td valign="MIDDLE"><input type="Submit" name="submit" value="&nbsp;&nbsp;&nbsp;Post&nbsp;&nbsp;&nbsp;" align="Left"></td>
							</tr>
						</table>
						</font>
					</td>
				</tr>
			</table>
		</td><input type="hidden" name="action" value="PostNew">
		<input type="hidden" name="roomid" value="#RoomID#"></form>
	</tr>
</table>
</cfoutput>