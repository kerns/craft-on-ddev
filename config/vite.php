<?php

use craft\helpers\App;

return [
	'checkDevServer' => true,
	'devServerInternal' => 'http://localhost:3000',
	'devServerPublic' => Craft::getAlias('@web') . ':3000',
	'errorEntry' => 'src/js/app.js',
	'manifestPath' => Craft::getAlias('@webroot') . '/dist/manifest.json',
	'serverPublic' => '/dist/',
//	👇 Use this if you want an absolute path
//	'serverPublic' => Craft::getAlias('@web')  . '/dist/',
	'useDevServer' => (bool) App::env('VITE_USE_DEV_SERVER'),
];
