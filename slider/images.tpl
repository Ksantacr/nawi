{**
 * /lib/pkp/templates/controllers/tab/settings/appearance/form/images.tpl
 *
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief TinyMCE field for adding additional content to the homepage
 *
 *}
{assign var="uploadImageFieldId" value=$uploadImageLinkActions.imgCarousel1->getId() scope="global"}
{fbvFormSection for="$uploadImageFieldId" label="manager.setup.imgCarousel1" description="manager.setup.imgCarousel1Description"}
	<div id="imgCarousel1">
		{$imagesViews.imgCarousel1}
	</div>
	<div id="$uploadImageFieldId" class="pkp_linkActions">
		{include file="linkAction/linkAction.tpl" action=$uploadImageLinkActions.imgCarousel1 contextId="appearanceForm"}
	</div>
{/fbvFormSection}
<!--img1-->
{assign var="uploadImageFieldId" value=$uploadImageLinkActions.imgCarousel2->getId() scope="global"}
{fbvFormSection for="$uploadImageFieldId" label="manager.setup.imgCarousel2" description="manager.setup.imgCarousel2Description"}
	<div id="imgCarousel2">
		{$imagesViews.imgCarousel2}
	</div>
	<div id="$uploadImageFieldId" class="pkp_linkActions">
		{include file="linkAction/linkAction.tpl" action=$uploadImageLinkActions.imgCarousel2 contextId="appearanceForm"}
	</div>
{/fbvFormSection}
<!--img2-->
{assign var="uploadImageFieldId" value=$uploadImageLinkActions.imgCarousel3->getId() scope="global"}
{fbvFormSection for="$uploadImageFieldId" label="manager.setup.imgCarousel3" description="manager.setup.imgCarousel3Description"}
	<div id="imgCarousel3">
		{$imagesViews.imgCarousel3}
	</div>
	<div id="$uploadImageFieldId" class="pkp_linkActions">
		{include file="linkAction/linkAction.tpl" action=$uploadImageLinkActions.imgCarousel3 contextId="appearanceForm"}
	</div>
{/fbvFormSection}
<!--img3-->
{*$uploadImageLinkActions|@debug_print_var*}
