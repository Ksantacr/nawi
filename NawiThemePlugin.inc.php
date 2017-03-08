<?php

import('lib.pkp.classes.plugins.ThemePlugin');

class NawiThemePlugin extends ThemePlugin {

	public function init(){
		$this->setParent('bootstrapthreethemeplugin');
		$this->addStyle('my-custom-style', 'styles/nawi.css');
	}
	function getDisplayName(){
		return __('plugins.themes.nawi.name');
	}
	function getDescription(){
		return __('plugins.themes.nawi.description');
	}

}
?>
