<?php
/**
 * Lets the user import a spreadsheet file to turn into wiki pages
 *
 * @author Stephan Gambke
 */

class E2DImportSpreadsheet extends E2DImportTab {

	public function __construct( $name='spreadsheet2keytemplates' ) {
		parent::__construct( $name, '', true );
	}

	protected function printForm() {
		$formText = E2DUtils::printTemplateSetConvertTo();
		$formText .= E2DUtils::printFileSelector( $this->getFiletype() );
		$formText .= wfMessage('e2d_convert_resource-limits_phpexcel')->parse();
		$formText .= E2DUtils::printSubmitButton();
		$text = "\t" . Xml::tags( 'form',
				array(
					'enctype' => 'multipart/form-data',
					'action' => '',
					'method' => 'post'
				), $formText ) . "\n";
		return $text;
	}

	protected function convertToTempfile( $file, $encoding ) {

		if ( is_null( $file ) ) {
			return wfMessage( 'emptyfile' )->text();
		}

		$metadata = stream_get_meta_data( $file );
		$filename = $metadata['uri'];

		@$objPHPExcel = PHPExcel_IOFactory::load( $filename );
		// getSheet(0)->toArray( null-value, do-calculate-formula, do-format-fields, do-return-cell-references )
		$TABLE = $objPHPExcel->getSheet(0)->toArray( '', true, true, false );
		
		return $this->writeToTemporaryTabSeparatedFile($TABLE);

		# return $this->importFromArray( $table, $pages );

	}

	protected function getFiletype() {
		return wfMessage( 'e2d_filetype_spreadsheet' )->text();
	}
}