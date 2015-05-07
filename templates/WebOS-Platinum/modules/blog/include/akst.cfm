<!---
	Name         : akst.cfm
	Author       : James Harvey
	Created      : August 08, 2007
	Last Updated : August 08, 2007
	History      : Version 1.0
--->

<div id="akst_form"> <a href="javascript:void($('akst_form').style.display='none');" class="akst_close"><IMG SRC="<cfoutput>#site_domain##site_folder#/modules/blog/</cfoutput>templates/<cfoutput>#site_template#</cfoutput>/images/close.gif" WIDTH="18" HEIGHT="17" BORDER="0" ALT="Close"></a>
  <ul class="tabs">
    <li id="akst_tab1" class="selected" onclick="akst_share_tab('1');">Social Web</li>
    <li id="akst_tab2" onclick="akst_share_tab('2');">E-mail</li>
  </ul>
  <div class="clear"></div>
  <div id="akst_social">
    <ul>
      <li><a href="#" id="akst_delicious" target="new">del.icio.us</a></li>
      <li><a href="#" id="akst_digg" target="new">Digg</a></li>
      <li><a href="#" id="akst_furl" target="new">Furl</a></li>
      <li><a href="#" id="akst_netscape" target="new">Netscape</a></li>
      <li><a href="#" id="akst_yahoo_myweb" target="new">Yahoo! My Web</a></li>
      <li><a href="#" id="akst_stumbleupon" target="new">StumbleUpon</a></li>
      <li><a href="#" id="akst_google_bmarks" target="new">Google Bookmarks</a></li>
      <li><a href="#" id="akst_technorati" target="new">Technorati</a></li>
      <li><a href="#" id="akst_blinklist" target="new">BlinkList</a></li>
      <li><a href="#" id="akst_newsvine" target="new">Newsvine</a></li>
      <li><a href="#" id="akst_magnolia" target="new">ma.gnolia</a></li>
      <li><a href="#" id="akst_reddit" target="new">reddit</a></li>
      <li><a href="#" id="akst_windows_live" target="new">Windows Live</a></li>
      <li><a href="#" id="akst_tailrank" target="new">Tailrank</a></li>
      <li><a href="#" id="akst_slashdot" target="new">Slashdot</a></li>
      <li><a href="#" id="akst_spurl" target="new">Spurl</a></li>
    </ul>
    <div class="clear"></div>
  </div>
  <div id="akst_email">
    <form action="<cfoutput>#site_domain##site_folder#/modules/blog/</cfoutput>sendit.cfm" method="post">
      <fieldset>
      <legend>E-mail It</legend>
      <ul>
        <li>
          <label>To Address:</label>
          <input type="text" name="femail" value="" class="akst_text" />
        </li>
        <li>
          <label>Your Address:</label>
          <input type="text" name="email" value="" class="akst_text" />
        </li>
        <li>
          <input type="submit" name="submit" value="Send It" />
        </li>
      </ul>
      <input type="hidden" name="sendid" id="akst_post_id" value="" />
      </fieldset>
    </form>
  </div>