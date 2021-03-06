{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showGalleyLinks bool Show galley links to users without access?
 *}
{assign var=articlePath value=$article->getBestArticleId($currentJournal)}
{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}

<div class="article-summary media">
	{if $article->getCoverImage()}
		<div class="cover media-left">
			<a href="{url page="article" op="view" path=$articlePath}" class="file">
				<img class="media-object" src="{$publicFilesDir|escape}/{$article->getCoverImage()|escape}">
			</a>
		</div>
	{/if}

	<div class="media-body">
		<h3 class="media-heading">
			<a href="{url page="article" op="view" path=$articlePath}">
				{$article->getLocalizedTitle()|strip_unsafe_html}
			</a>


			<ul class="galleys_links">
				{foreach from=$article->getGalleys() item=galley}
					<li>
						{assign var="hasArticleAccess" value=$hasAccess}
						{if ($article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN)}
							{assign var="hasArticleAccess" value=1}
						{/if}
						{include file="frontend/objects/galley_link.tpl" parent=$article hasAccess=$hasArticleAccess}
					</li>
				{/foreach}
			</ul>



		</h3>

		{if $showAuthor || $article->getPages() || ($article->getDatePublished() && $showDatePublished)}

			{if $showAuthor}
				<div class="meta">
					{if $showAuthor}
						<div class="authors">
							{$article->getAuthorString()}
						</div>
					{/if}
				</div>
			{/if}

			{* Page numbers for this article *}
			<!--{if $article->getPages()}
				<p class="pages">
					{$article->getPages()|escape}
				</p>
			{/if}-->

			{*<div class="btn-group" role="group">
				{foreach from=$article->getGalleys() item=galley}
					{include file="frontend/objects/galley_link.tpl" parent=$article}
				{/foreach}
			</div>*}


			<!-- Archivos a descargar -->
			{if $hasAccess}
			
			
			<!--
			<ul class="galleys_links">
				{foreach from=$article->getGalleys() item=galley}
					<li>
						{assign var="hasArticleAccess" value=$hasAccess}
						{if ($article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN)}
							{assign var="hasArticleAccess" value=1}
						{/if}
						{*include file="frontend/objects/galley_link.tpl" parent=$article hasAccess=$hasArticleAccess*}

					</li>
				{/foreach}
			</ul>-->

	{/if}
		{/if}
	</div>

	{call_hook name="Templates::Issue::Issue::Article"}
</div><!-- .article-summary -->
