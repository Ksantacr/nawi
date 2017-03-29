{**
 * templates/frontend/components/searchForm_simple.tpl
 *
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Simple display of a search form with just text input and search button
 *
 * @uses $searchQuery string Previously input search query
 *}
{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
<form class="navbar-form navbar-nawi" role="search" method="post" action="{url page="search" op="search"}">
  <div class="form-group">
    <input class="form-control buscar" name="query" placeholder="Buscar" value="{$searchQuery|escape}" type="text" aria-label="{translate|escape key="common.searchQuery"}" placeholder="">
  </div>
  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span>{*translate key="common.search"*}</button>
</form>
{/if}
