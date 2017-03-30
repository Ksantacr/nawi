{**
* templates/frontend/components/primaryNavMenu.tpl
*
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* Primary navigation menu list for OJS
*}
<ul id="main-navigation" class="nav navbar-nav">

  {if $enableAnnouncements}
  <li>
    <a href="{url router=$smarty.const.ROUTE_PAGE page="announcement"}">
      {translate key="announcement.announcements"}
    </a>
  </li>
  {/if}

  {if $currentJournal}

  <li class="dropdown">
    <a href="{url router=$smarty.const.ROUTE_PAGE page="about"}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{**{translate key="navigation.about"}*}ACERCA DE<span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="about"}">
          {**{translate key="about.aboutContext"}**}La revista
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="editorialTeam"}">
          {**{translate key="about.editorialTeam"}*}Equipo editorial
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="submissions"}">
          {**{translate key="about.submissions"}*}Suscripciones
        </a>
      </li>
    </ul>
{if $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
  <li>
    <a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}">
      {**{translate key="navigation.archives"}*}VOLUMENES
    </a>
  </li>
  <li>
    {**<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="current"}">*}
    <a href="{url router=$smarty.const.ROUTE_PAGE page="about"}">
      {**{translate key="navigation.current"}*}CALL FOR PAPER
    </a>
  </li>
  
  {/if}
    {/if}
  </ul>
