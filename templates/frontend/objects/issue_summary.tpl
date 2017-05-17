{**
 * templates/frontend/objects/issue_summary.tpl
 *
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists
 *
 * @uses $issue Issue The issue
 *}
<div class="issue-summary media">

	{* Retrieve separate entries for $issueTitle and $issueSeries *}
	{assign var=issueTitle value=$issue->getLocalizedTitle()}
	{assign var=issueSeries value=$issue->getIssueSeries()}
	{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}

	{* Show cover image and use cover description *}
	{if $issue->getCoverImage()}
	{if $issueTitle}
				<div class="series lead">
					{$issueSeries|escape}
				</div>
			{/if}
		<div class="media-left">
			
			<a class="cover" href="{url op="view" path=$issue->getBestIssueId()}">
			<img src="{$issueCover|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}></a>
		</div>
	{/if}


	<div class="media-body">
		<h2 class="media-heading">
			<a class="title" href="{url op="view" path=$issue->getBestIssueId($currentJournal)}">
				{if $issueTitle}
					{$issueTitle|escape}
				{else}
					{$issueSeries|escape}
				{/if}
			</a>
			
		</h2>
		<div class="description">
			{$issueDescription|strip_unsafe_html|nl2br}
		</div>
	</div>
</div><!-- .issue-summary -->
