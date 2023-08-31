<?php
/**
 * Global functions and constants for the Excel2Decision Key Templates extension.
 *
 * @author Andreas Plank, Yaron Koren, Stephan Gambke
 */

if ( !defined( 'MEDIAWIKI' ) ) die();
# error_reporting(-1);
define( 'EXCEL2DECISION_KEY_TEMPLATES_VERSION', '0.2' );


$GLOBALS['wgExtensionCredits']['specialpage'][] = array(
	'path'           => __FILE__,
	'name'           => 'Excel2Decision Key Templates',
	'version'        => EXCEL2DECISION_KEY_TEMPLATES_VERSION,
	'author'         => array('Andreas Plank', 'Yaron Koren', 'Stephan Gambke'),
	# 'url'            => 'https://www.mediawiki.org/wiki/Extension:Data_Transfer',
	'descriptionmsg' => 'excel2decisionkeytemplates-desc',
	'license-name'   => 'GPL-2.0+'
);

###
# This is the path to your installation of Semantic Forms as
# seen on your local filesystem. Used against some PHP file path
# issues.
##
$e2dIP = dirname( __FILE__ );
##

// register all special pages and other classes
$GLOBALS['wgAutoloadClasses'] += array('E2DPageStructure' => $e2dIP . '/includes/E2D_PageStructure.php');
$GLOBALS['wgAutoloadClasses'] += array('E2DUtils' => $e2dIP . '/includes/E2D_Utils.php');

# $GLOBALS['wgSpecialPages'] += array('ExtensionKey' => 'ClassName');
$GLOBALS['wgSpecialPages'] += array('tab2keytemplates' => 'E2DImportTab');
$GLOBALS['wgAutoloadClasses'] += array('E2DImportTab' => $e2dIP . '/specials/E2D_ImportTab.php');
$wgHooks['AdminLinks'][] = 'e2dfAddToAdminLinks';

$GLOBALS['wgAwkData2KeyStartTemplates'] = $e2dIP . '/scripts/tab2KeyStart_and_Lead.awk';
$GLOBALS['wgAwkData2ImageSwitchTemplates'] = $e2dIP . '/scripts/tab2ImageSwitch.awk';
$GLOBALS['wgExcel2DecisionKeyTemplatesUploadSubDirectory'] = "/E2DecisionKeys";

// Only enable spreadsheet import if PHPExcel is installed.
if ( class_exists( 'PHPExcel' )) {
	$GLOBALS['wgSpecialPages'] += array('spreadsheet2keytemplates' => 'E2DImportSpreadsheet');
	$GLOBALS['wgAutoloadClasses'] += array('E2DImportSpreadsheet' => $e2dIP . '/specials/E2D_ImportSpreadsheet.php');
}

###
# This is the path to your installation of the Excel2Decision Key Templates extension as
# seen from the web. Change it if required ($wgScriptPath is the
# path to the base directory of your wiki). No final slash.
##
# $dtgScriptPath = $wgScriptPath . '/extensions/Excel2DecisionKeyTemplates';
##

###
# Permission to convert files
###
# $wgGroupPermissions['sysop']['datatransferimport'] = true;
# $wgAvailableRights[] = 'datatransferimport';

// Global settings
$GLOBALS['wgExcel2DecisionKeyTemplatesGawk'] = 'gawk';

# Notice: Undefined index: wgMessagesDirs in /usr/share/mediawiki20/extensions/Excel2DecisionKeyTemplates/Excel2DecisionKeyTemplates.php on line 67 Fatal error: Unsupported operand types in /usr/share/mediawiki20/extensions/Excel2DecisionKeyTemplates/Excel2DecisionKeyTemplates.php on line 67 
$GLOBALS['wgMessagesDirs'] += array('Excel2DecisionKeyTemplates' => __DIR__ . '/i18n');	
$GLOBALS['wgExtensionMessagesFiles'] += array('Excel2DecisionKeyTemplates' => $e2dIP . '/languages/E2D_Messages.php');
$GLOBALS['wgExtensionMessagesFiles'] += array('Excel2DecisionKeyTemplatesAlias' => $e2dIP . '/languages/E2D_Aliases.php');

$GLOBALS['wgResourceModules'] += array(
	'ext.Excel2DecisionKeyTemplates' => array(
		'scripts' => 'ext.excel2decisionkeytemplates.core.js' ,
		'dependencies' => array('jquery.ui.tabs', 'jquery.ui.accordion'),
		'localBasePath' => $e2dIP ."/js",
		# 'remoteExtPath' => end( ( explode( DIRECTORY_SEPARATOR . 'extensions' . DIRECTORY_SEPARATOR , __DIR__, 2 ) ) )
	)
);
/**********************************************/
/***** other global helpers               *****/
/**********************************************/

/**
 * Add links to the 'AdminLinks' special page, defined by the Admin Links
 * extension
 */
function e2dfAddToAdminLinks( $admin_links_tree ) {
	$import_export_section = $admin_links_tree->getSection( wfMessage( 'adminlinks_importexport' )->text() );
	$main_row = $import_export_section->getRow( 'main' );
	$main_row->addItem( ALItem::newFromSpecialPage( 'spreadsheet2keytemplates' ) );
	$main_row->addItem( ALItem::newFromSpecialPage( 'tab2keytemplates' ) );
	return true;
}
