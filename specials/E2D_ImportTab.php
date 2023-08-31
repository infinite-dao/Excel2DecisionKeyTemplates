<?php
/**
 * Lets the user import a CSV file to turn into wiki pages
 *
 * @author Andreas Plank, Yaron Koren
 */

class E2DImportTab extends SpecialPage {

	protected $mBasenameTempfile = "";
	/**
	 * a ready to use string of shell variables
	 * 
	 * AWK can parse shellvariables via option -v 'variable=value'
	 * @var string 
	 */
	protected $mAwkShellVariables = "";
	/**
	 * path of the tempfile AWK is reading from
	 * @var string 
	 */
	protected $mTempTabfilePath = "";
	/**
	 * path of the tempfile AWK is writes outout to
	 * @var string 
	 */
	protected $mTempOutputfilePath = "";
	/**
	 * Constructor
	 */
	public function __construct( $name='Tab2KeyTemplates' ) {
		parent::__construct( $name , '', true);
	}

	function execute( $query ) {
		$this->setHeaders();

//		if ( ! $this->getUser()->isAllowed( 'datatransferimport' ) ) {
//			throw new PermissionsError( 'datatransferimport' );
//		}
		
		$text = $this->checkGawkExists();
		$this->getOutput()->addModules('ext.Excel2DecisionKeyTemplates');
		
		// $text.='getCheck convert_file:'.$this->getRequest()->getCheck('convert_file') .'<br/>'
		// . ' getVal is_null file_name:' . $this->getRequest()->getFileName('file_name') .'<br/>';
		
		if ( $this->getRequest()->getCheck('convert_file') && $this->getRequest()->getFileName('file_name') ) {
			$text.= $this->convertFromUpload();
			$text.= $this->convertData2Templates();
			if (file_exists($this->mTempOutputfilePath)) {
				$text.=wfMessage("e2d_convert_success_keystart_template")->text();
				$text.=$this->printFormReload();
				$text.= file_get_contents($this->mTempOutputfilePath) ; // ready out put from awk script output
			} else {
				$text.=wfMessage('e2d_error_output_file', $this->mTempOutputfilePath)->parse();
			}
		} else {
			if ( $this->getRequest()->getCheck('convert_file') && ! $this->getRequest()->getFileName('file_name') )  {
				$text.=wfMessage('e2d_error_no_file_selected', $this->mTempOutputfilePath)->parse();
			}
			$text.= $this->printForm();
		}
		$this->getOutput()->addHTML( $text );
		$this->removeTempFiles();
	}

	/**
	 * Check if gawk exists
	 * @return null|text
	 */
	protected function checkGawkExists () {
		global $wgExcel2DecisionKeyTemplatesGawk;
		if (!wfShellExec("command -v $wgExcel2DecisionKeyTemplatesGawk")) {
			return wfMessage("e2d_error_gawk")->text();
		}
		return null;
	}
	
	protected function removeTempFiles() {
		if (file_exists($this->mTempOutputfilePath)) unlink ($this->mTempOutputfilePath);
		if (file_exists($this->mTempTabfilePath)) unlink ($this->mTempTabfilePath);
	}
	/**
	 * 
	 * @return string import messages
	 */
	protected function convertFromUpload () {

		$text = E2DUtils::printImportingMessage();
		$uploadResult = ImportStreamSource::newFromUpload( "file_name" );

		if ( !$uploadResult->isOK() ) {
			$uploadError = $this->getOutput()->parse( $uploadResult->getWikiText() );
			$text .= $uploadError;
			return $text;
		}

		$source = $uploadResult->value;

		$encoding = $this->getRequest()->getVal( 'encoding' );

		$error_msg = $this->convertToTempfile( $source->mHandle, $encoding );

		if ( ! is_null( $error_msg ) ) {
			$text .= $error_msg;
			return $text;
		}

		return $text;
	}

	/**
	 * Parse template options from the form to shell variables in AWK
	 * 
	 * @return string readdy to pass to thee command line
	 */
	protected function getGlobalTemplateOptions2ShellVariables () {
		$option_shell_cmds="";
  # shellvar_image_framestyle (unused) # imageswitch_image_framestyle (unused)
  # shellvar_caption_lines             # imageswitch_caption_lines
  # shellvar_caption_style             # imageswitch_caption_style
  # shellvar_image_width               # imageswitch_image_width
  # shellvar_layout_format             # imageswitch_layout_format
  # shellvar_lead_lines                # imageswitch_lead_lines
  # shellvar_link_url                  # imageswitch_link_url
  # shellvar_rating                    # imageswitch_rating
  # shellvar_recommendation_group      # imageswitch_recommendation_group
  # shellvar_pagename_addendum         # imageswitch_pagename_addendum
  # shellvar_style                     # imageswitch_style
		foreach (array(
			'imageswitch_caption_lines', 
			'imageswitch_caption_style', 
			'imageswitch_image_width', 
			'imageswitch_image_framestyle', 
			'imageswitch_layout_format', 
			'imageswitch_lead_lines',
			'imageswitch_link_url',
			'imageswitch_pagename_addendum', 
			'imageswitch_rating', 
			'imageswitch_recommendation_group', 
			'imageswitch_style') as $option_imageswitch) {
			$$option_imageswitch = $this->getRequest()->getVal( $option_imageswitch );
			if ($$option_imageswitch) {
				switch ($$option_imageswitch) {
					case "other": break; // from no selection
					default:
						$$option_imageswitch = str_replace("'", "", $$option_imageswitch);
						// replace imageswitch_style to AWK variable shellvar_style
						$option_shell_cmds .=" -v " . wfEscapeShellArg(str_replace("imageswitch_", "shellvar_", $option_imageswitch). "=". $$option_imageswitch);
						break;
				}
			}
		}
		return $option_shell_cmds;
	}

	protected function convertData2Templates () {
		global $wgAwkData2KeyStartTemplates, $wgAwkData2ImageSwitchTemplates, $wgExcel2DecisionKeyTemplatesGawk, $wgLanguageCode;
		$exit_status=0;
		$returntext=Null;
		$this->mTempOutputfilePath =str_replace(".tab", ".txt", $this->mTempTabfilePath);
		$template_set_convert_to = $this->getRequest()->getVal( 'templateset' );
		$shell_variables4awk = "";
		
		switch ($template_set_convert_to) {
			case "imageswitch":
				$shell_variables4awk = $this->getGlobalTemplateOptions2ShellVariables();
				$cmd= wfEscapeShellArg($wgExcel2DecisionKeyTemplatesGawk)
					. $shell_variables4awk
					. " -v " . wfEscapeShellArg("shellvar_wgLanguageCode=$wgLanguageCode")
					. " -f " . wfEscapeShellArg($wgAwkData2ImageSwitchTemplates)
					. " " . wfEscapeShellArg($this->mTempTabfilePath)
					. " > " .wfEscapeShellArg($this->mTempOutputfilePath)
				;
				break;
			case "key_start_and_lead":
				$cmd= wfEscapeShellArg($wgExcel2DecisionKeyTemplatesGawk)
					. " -v " . wfEscapeShellArg("shellvar_wgLanguageCode=$wgLanguageCode")
					. " -f " . wfEscapeShellArg($wgAwkData2KeyStartTemplates)
					. " " . wfEscapeShellArg($this->mTempTabfilePath)
					. " > " .wfEscapeShellArg($this->mTempOutputfilePath)
				;
				break;
		}
		
		 wfShellExec("$cmd", $exit_status);
		 if ($exit_status > 0) {
			 $returntext=wfMessage(e2d_error_command_line, array($exit_status, $cmd))->text();
		 }			 
		return $returntext;
	}
	protected function printForm() {
		$formText = E2DUtils::printTemplateSetConvertTo();   
		$formText .= E2DUtils::printFileSelector( $this->getFiletype() );
		$utf8OptionText = "\t" . Xml::element( 'option',
				array(
					'selected' => 'selected',
					'value' => 'utf8'
				), 'UTF-8' ) . "\n";
		$utf16OptionText = "\t" . Xml::element( 'option',
				array(
					'value' => 'utf16'
				), 'UTF-16' ) . "\n";
		$encodingSelectText = Xml::tags( 'select',
				array( 'name' => 'encoding' ),
				"\n" . $utf8OptionText . $utf16OptionText. "\t" ) . "\n\t";
		$formText .= "\t" . Xml::tags( 'p', null, $this->msg( 'e2d_convert_encodingtype', 'CSV' )->text() . " " . $encodingSelectText ) . "\n";
		$formText .= E2DUtils::printSubmitButton();
		$text = "\t" . Xml::tags( 'form',
				array(
					'enctype' => 'multipart/form-data',
					'action' => '',
					'method' => 'post'
				), $formText ) . "\n";
		return $text;
	}

	protected function printFormReload() {
		$formText = E2DUtils::printSubmitButton('e2d_convert_new_data', 'reload_this_page');
		$text = "\t" . Xml::tags( 'form',
				array(
					'enctype' => 'multipart/form-data',
					'action' => '',
					'method' => 'post'
				), $formText ) . "\n";
		return $text;
	}

	protected function convertToTempfile( $csv_file, $encoding ) {
		if ( is_null( $csv_file ) ) {
			return wfMessage( 'emptyfile' )->text();
		}

		$TABLE = array();
		if ( $encoding == 'utf16' ) {
			// Change encoding to UTF-8.
			// Starting with PHP 5.3 we could use str_getcsv(),
			// which would save the tempfile hassle.
			$tempfile = tmpfile();
			$csv_string = '';
			while ( !feof( $csv_file ) ) {
				$csv_string .= fgets( $csv_file, 65535 );
 			}
			fwrite( $tempfile, iconv( 'UTF-16', 'UTF-8', $csv_string ) );
			fseek( $tempfile, 0 );
			while ( $line = fgetcsv( $tempfile, 0 , "\t" ) ) {
				array_push( $TABLE, $line );
			}
			fclose( $tempfile );
		} else {
			while ( $line = fgetcsv( $csv_file, 0 , "\t" ) ) {
				array_push( $TABLE, $line );
			}
		}
		fclose( $csv_file );

		// Get rid of the "byte order mark", if it's there - this is
		// a three-character string sometimes put at the beginning
		// of files to indicate its encoding.
		// Code copied from:
		// http://www.dotvoid.com/2010/04/detecting-utf-bom-byte-order-mark/
		$byteOrderMark = pack( "CCC", 0xef, 0xbb, 0xbf );
		if ( 0 == strncmp( $TABLE[0][0], $byteOrderMark, 3 ) ) {
			$TABLE[0][0] = substr( $TABLE[0][0], 3 );
			// If there were quotation marks around this value,
			// they didn't get removed, so remove them now.
			$TABLE[0][0] = trim( $TABLE[0][0], '"' );
		}

		return $this->writeToTemporaryTabSeparatedFile( $TABLE);
		# return $this->importFromArray( $table, $pages );

	}
	/**
	 * Write the table to a temporary file
	 * 
	 * This file gets later processed by AWK commands on the command line
	 * @global string $wgUploadDirectory global upload directory
	 * @global string $wgExcel2DecisionKeyTemplatesUploadSubDirectory subdirectory for this extension
	 * @param array $TABLE the table of CSV or spreadsheet
	 * 
	 * @return string a translated message of import status
	 */
	protected function writeToTemporaryTabSeparatedFile ( $TABLE ) {
		global $wgUploadDirectory, $wgExcel2DecisionKeyTemplatesUploadSubDirectory;
		if (!is_dir($wgUploadDirectory . $wgExcel2DecisionKeyTemplatesUploadSubDirectory)) {
			wfMkdirParents($wgUploadDirectory . $wgExcel2DecisionKeyTemplatesUploadSubDirectory);
		}
		$this->mBasenameTempfile="table2KeyTemplates_". wfTimestamp(TS_ISO_8601);
		$this->mTempTabfilePath= $wgUploadDirectory . $wgExcel2DecisionKeyTemplatesUploadSubDirectory. "/" .$this->mBasenameTempfile.".tab";
		
		$this_text ="";
		foreach ( $TABLE as $i_line => $LINE ) {
			foreach ( $LINE as $i_column => $value ) {
				$this_text.="$value\t";
			}
			$this_text.="\n";
		}
		$write_file_ok = $this->writeFile($this->mTempTabfilePath, $this_text);
		return $write_file_ok ? null : wfMessage('e2d_error_tempfile_not_writable', $this->mTempTabfilePath)->text();
	}
	/**
	 * Write content to a file and save it
	 *
	 * @param string $to_file complete file name AND path of a file
	 * @param mixed $content reference to content to write into that file
	 * @param string $mode optional  fopen mode, e.g. w = write (new), a = append (to old), default is "w"
	 *
	 * @return boolean
	 */
	protected function writeFile(
					$to_file, 
					$content, 
					$mode = "w") {

		if (is_dir(dirname($to_file))) {
			@$fe = fopen($to_file, $mode);
			@fwrite($fe, $content);
			@fflush($fe);
			@fclose($fe);
			//set not NULL $content 
			return true;
		} else {
			return false;
		}
	}//writeFile()

	protected function convertTmpfileByAWK() {
		if (file_exists($this->mTempTabfilePath)) {
			
		}
	}

	protected function getFiletype() {
		return wfMessage( 'e2d_filetype_tab' )->text();
	}
}
