<cftransaction>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.analytics#' where module_name='Google Analytics';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.articles#' where module_name='Articles';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.banners#' where module_name='Banners';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.blog#' where module_name='Blog';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.chat#' where module_name='Chat';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.didyouknow#' where module_name='Did you Knows';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.links#' where module_name='Links Directory';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.metatags#' where module_name='Meta Tags';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.pages#' where module_name='Pages';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">update webos_modules set module_installed='#form.podcasts#' where module_name='PodCasts';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.polls#' where module_name='Polls';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.ratesticker#' where module_name='Rate Ticker';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.rss#' where module_name='RSS Feeds';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.sefurls#' where module_name='SEO Friendly URLS';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.sitemap#' where module_name='Sitemap';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.sitesearch#' where module_name='Site Search';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.spotlights#' where module_name='Spotlights';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.tellafriend#' where module_name='Tell-A-Friend';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.stockticker#' where module_name='Stock Ticker';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.mainpage#' where module_name='Main Page';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.forum#' where module_name='Forum';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.breadcrumbs#' where module_name='Breadcrumbs';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.users#' where module_name='User Profiles';
</cfquery>
<cfquery name="modules" datasource="#form.datasrc#">
update webos_modules set module_installed='#form.newsletter#' where module_name='Newsletter';
</cfquery>
</cftransaction>