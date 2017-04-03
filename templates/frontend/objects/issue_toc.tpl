{**
 * templates/frontend/objects/issue_toc.tpl
 *
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $showGalleyLinks bool Show galley links to users without access?
 *}
<div class="issue-toc nawi-revista">

	{* Indicate if this is only a preview *}
	{if !$issue->getPublished()}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="editor.issues.preview"}
	{/if}

	{* Issue introduction area above articles *}


<div class="nawi-tabs">
	<!-- Categorías de los artículos publicados-->
	<ul class="nav nav-tabs">
		{foreach name=sections from=$publishedArticles item=section}
		<li>
			<a href="#{$section.title|escape}" data-toggle="tab">{$section.title|escape}</a>
		</li>
		{/foreach}
	</ul>
	<!--Fin categorías-->
</div>
</div>
<div class="issue-toc nawi-revista no-wrap">
	<div class="heading">

		{* Issue cover image and description*}
		{assign var=issueCover value=$issue->getCoverImage()}
		{if $issueCover}
			<div class="nawi-portada">
				<a class="cover" href="{url op="view" page="issue" path=$issue->getBestIssueId()}">
					<img src="{$coverImagePath|escape}{$issueCover|escape}"{if $issue->getCoverImageAltText() != ''} alt="{$issue->getCoverImageAltText()|escape}"{/if}>
				</a>
				{*{if $issue->hasDescription()}
					<div class="description">
						{$issue->getLocalizedDescription()|strip_unsafe_html}
					</div>
				{/if}*}
			</div>

		{*elseif $issue->hasDescription()*}
			{*<div class="description">
				{$issue->getLocalizedDescription()|strip_unsafe_html}
			</div>*}
		{/if}

		{* PUb IDs (eg - DOI) *}
		{foreach from=$pubIdPlugins item=pubIdPlugin}
			{if $issue->getPublished()}
				{assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
			{else}
				{assign var=pubId value=$pubIdPlugin->getPubId($issue)}{* Preview pubId *}
			{/if}
			{if $pubId}
				{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
				<div class="pub_id {$pubIdPlugin->getPubIdType()|escape}">
					<span class="type">
						{$pubIdPlugin->getPubIdDisplayType()|escape}:
					</span>
					<span class="id">
						{if $doiUrl}
							<a href="{$doiUrl|escape}">
								{$doiUrl}
							</a>
						{else}
							{$pubId}
						{/if}
					</span>
				</div>
			{/if}
		{/foreach}
		{* Published date *}
		{* if $issue->getDatePublished() *}
			{*<div class="published">
				<strong>
					{translate key="submissions.published"}:
				</strong>
				{$issue->getDatePublished()|date_format:$dateFormatShort}
			</div>*}
		{* /if *}
	</div>
	{* Full-issue galleys *}
	{*{if $issueGalleys && ($hasAccess || $showGalleyLinks)}
		<div class="galleys">
			<div class="page-header">
				<h2>
					<small>{translate key="issue.fullIssue"}</small>
				</h2>
			</div>
			<div class="btn-group" role="group">
				{foreach from=$issueGalleys item=galley}
					{include file="frontend/objects/galley_link.tpl" parent=$issue}
				{/foreach}
			</div>
		</div>
	{/if}*}

<div class="div">
	<!-- Contenido de las categorías (Artículos)-->
	<div class="tab-content" id="jfs">
		{foreach name=sections from=$publishedArticles item=section}
		
		<div class="tab-pane fade" id="{$section.title|escape}">
			<div class="media-list">
				{foreach from=$section.articles item=article}
							
					{include file="frontend/objects/article_summary.tpl"}

				{/foreach}
			</div>
		</div>

		{/foreach}
	</div>
</div>

	{* Articles *}
	{*<div class="sections">
		{foreach name=sections from=$publishedArticles item=section}
			<section class="section">
				{if $section.articles}
					{if $section.title}
						<div class="page-header">
							<h2>
								<small>{$section.title|escape}</small>
							</h2>
						</div>
					{/if}
					<div class="media-list">
						{foreach from=$section.articles item=article}
							{include file="frontend/objects/article_summary.tpl"}
						{/foreach}
					</div>
				{/if}
			</section>
		{/foreach}

	</div><!-- .sections -->*}
</div><!-- .issue-toc -->