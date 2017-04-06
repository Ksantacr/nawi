{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * UPDATED/CHANGED/MODIFIED: Marc Behiels - marc@elemental.ca - 250416
 *
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}


<div id="main-content" class="page_index_journal" role="content">

	<!-- <h1>
		{translate key="announcement.announcements"}
	</h1> -->
	<h2 class="popular">Más populares</h2>

	

	{call_hook name="Templates::Index::journal"}

	{if $homepageImage}
		<!-- <div class="homepage-image">
			<img class="img-responsive" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
			<p>Descripción de la imagen</p>
		</div> -->

		<div class="homepage-image">
			
			<figure class="imagen-principal">
				
				<img class="img-responsive" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">

				<figcaption>
					{$additionalHomeContent}
				</figcaption>

			</figure>

		</div>
	{/if}

	{if $journalDescription}
		<div class="journal-description">
			{$journalDescription}
		</div>
	{/if}

	{* Announcements *}
	{if $numAnnouncementsHomepage && $announcements|count}
		<section class="cmp_announcements media">
			<header class="page-header">
				<h2>
					{translate key="announcement.announcements"}
				</h2>
			</header>
			<div class="media-list">
				{foreach name=announcements from=$announcements item=announcement}
					{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
						{php}break;{/php}
					{/if}
					{include file="frontend/objects/announcement_summary.tpl" heading="h3"}
				{/foreach}
			</div>
		</section>
	{/if}

	{* Latest issue *}
	{if $issue}
		<section class="current_issue">
			<!-- <header class="page-header">
				<h2>
					{*translate key="journal.currentIssue"*}
				</h2>
			</header> -->
			<h2 class="current_issue_title lead">
				{$issue->getIssueIdentification()|strip_unsafe_html}
			</h2>
			{include file="frontend/objects/issue_toc.tpl"}
		</section>
	{/if}
	{*<div class="view_all_issue">
		<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="btn btn-primary read-more">
				{translate key="journal.viewAllIssues"}
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
	</div>*}
	{* Additional Homepage Content *}
	{*if $additionalHomeContent}
		<section class="additional_content">
			{$additionalHomeContent}
		</section>
	{/if*}
</div><!-- .page -->

	{* Search form *}
	{if !$noContextsConfigured}
		<!-- <div class="pull-md-right"> -->
		{include file="frontend/components/searchForm_simple.tpl"}
		<!-- </div> -->
	{/if}


{include file="frontend/components/footer.tpl"}
