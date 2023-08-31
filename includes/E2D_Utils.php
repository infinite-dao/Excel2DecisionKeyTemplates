<?php

/**
 * Utility functions for the Excel2Decision Key Templates extension.
 *
 * @author Andreas Plank, Yaron Koren
 */
class E2DUtils  {

	static function printImportingMessage() {
		return "\t" . Xml::element( 'p', null, wfMessage( 'e2d_convert_converting' )->text() ) . "\n";
	}

	static function printFileSelector( $fileType ) {
		$text = "\n\t" . Xml::element( 'p', null, wfMessage( 'e2d_convert_selectfile', $fileType )->text() ) . "\n";
		$text .= <<<END
	<p><input type="file" name="file_name" size="25" /></p>

END;
		$text .= "\t" . '<hr style="margin: 10px 0 10px 0" />' . "\n";
		return $text;
	}

	static function printTemplateSetConvertTo() {
		$text = "\t" . Xml::element( 'p', null, wfMessage( 'e2d_convert_convert_to_templateset' )->text() ) . "\n";
		$text.= "\n\t<div id=\"template_ui-tab\">" .
		 "\n\t<ul>" .
			"\n\t\t<li><a href=\"#template_ui-tab-1\">"  . wfMessage( 'e2d_convert_convert_to_key_start' )->text() . "</a></li>" 
			. "\n\t\t<li><a href=\"#template_ui-tab-2\">" . wfMessage( 'e2d_convert_convert_to_image_switch' )->text() . "</a></li>" 
			. "\n\t</ul>"
			.	"\n\t<div id=\"template_ui-tab-1\">"
			. "\n\t"
				. Xml::openElement('label', array("style"=>"display: inline-block;")) 
				. Xml::element('b', array("style"=>"vertical-align: text-bottom;"), ucfirst(wfMessage( 'e2d_convert_to_this_template' )->text())  .":")
				. Xml::element('input', array( 'type' => 'radio', 'name' => 'templateset', 'value' => 'key_start_and_lead', 'checked' => 'checked' ) ) 
				. Xml::closeElement('label')
			. "\n\t</div><div id=\"template_ui-tab-2\">" 
			. "\n\t" 
				. Xml::openElement('label', array("style"=>"display: inline-block;"))
				. Xml::element('b', array("style"=>"vertical-align: text-bottom;"), ucfirst(wfMessage( 'e2d_convert_to_this_template' )->text())  .":")
				. Xml::element( 'input', array( 'type' => 'radio', 'name' => 'templateset', 'value' => 'imageswitch' ) ) 
				. Xml::closeElement('label')
			. "<br/>\n\t" 
				#	shellvar_link_url
				. wfMessage( 'e2d_convert_imageswitch_link_url_label' )->text() . " "
				. Xml::openElement('select', array('name' => 'imageswitch_link_url')) 
				. implode( "\n", array(
						Xml::option(
							wfMessage( 'e2d_convert_imageswitch_link_url_this_wiki_text' )->plain(), 
							wfMessage('e2d_convert_imageswitch_link_url_this_wiki_script-url-edit')->plain()
						),
						Xml::option(
							wfMessage( 'e2d_convert_imageswitch_link_url_offene_naturfueher_article-url' )->plain(), 
							wfMessage( 'e2d_convert_imageswitch_link_url_offene_naturfueher_script-url-edit' )->plain()
						),
						Xml::option(
							wfMessage( 'e2d_convert_imageswitch_link_url_bayernflora_article-url' )->plain(), 
							wfMessage( 'e2d_convert_imageswitch_link_url_bayernflora_script-url-edit' )->plain()
						),
						Xml::option(
							wfMessage( 'e2d_convert_imageswitch_link_url_species_article-url' )->plain(), 
							wfMessage( 'e2d_convert_imageswitch_link_url_species_script-url-edit' )->plain()
						)
					)
				)
			. Xml::closeElement('select')
			. Xml::openElement('fieldset')
			. Xml::element('legend', null, wfMessage( 'e2d_convert_fieldset-legend_apply-globlly')->text() ) 
				# add for awk imagesitch shellvar_pagename_addendum
		   . Xml::element( 'input', array(
				 'type' => 'text', 'name' => 'imageswitch_pagename_addendum', 'size' => '50', 
				 'placeholder' => wfMessage( 'e2d_convert_imageswitch_pagename_addendum_placeholder' )->plain() ) 
			 ) . " " . wfMessage( 'e2d_convert_imageswitch_pagename_addendum_label' )->text() 
			. "<br/>\n\t" 
				# add for awk imagesitch shellvar_layout_format
				. Xml::openElement('select', array('name' => 'imageswitch_layout_format')) 
				. implode( "\n", array(
						Xml::option('', ''),
						Xml::option(wfMessage( 'e2d_convert_imageswitch_layout_format_option_default_text' )->text(), 'result link top result text bottom'),
						Xml::option(wfMessage( 'e2d_convert_imageswitch_layout_format_option_non-default_text' )->text(), 'result link bottom result text top')
					)
				)
			. Xml::closeElement('select'). " " . wfMessage( 'e2d_convert_imageswitch_layout_format_label' )->text()
			. "<br/>\n\t" 
				# add for awk imagesitch shellvar_style
		   . Xml::element( 'input', array(
				 'type' => 'text', 'name' => 'imageswitch_style', 'size' => '50', 
				 'placeholder' => wfMessage( 'e2d_convert_imageswitch_style_placeholder' )->plain() ) 
			 ) . " " . wfMessage( 'e2d_convert_imageswitch_style_label' )->text() 
			. "<br/>\n\t" 
				# add for awk imagesitch shellvar_caption_style
		   . Xml::element( 'input', array(
				 'type' => 'text', 'name' => 'imageswitch_caption_style', 'size' => '50', 
				 'placeholder' => wfMessage( 'e2d_convert_imageswitch_caption_style_placeholder' )->plain() ) 
			 ) . " " . wfMessage( 'e2d_convert_imageswitch_caption_style_label' )->text() 
			. "<br/>\n\t" 
				# add for awk imagesitch shellvar_image_width
		   . Xml::element( 'input', array(
				 'type' => 'text', 'name' => 'imageswitch_image_width', 'size' => '50', 
				 'placeholder' => wfMessage( 'e2d_convert_imageswitch_image_width_placeholder' )->plain() ) 
			 ) . " " . wfMessage( 'e2d_convert_imageswitch_image_width_label' )->text() 
			. "<br/>\n\t" 
				# add for awk imagesitch shellvar_caption_lines
		   . Xml::listDropDown('imageswitch_caption_lines', "2\n3\n4\n5\n6\n7\n8\n9\n10") # no value is "other" !!
			 . " " . wfMessage( 'e2d_convert_imageswitch_caption_lines_label' )->text() 
			. "\n\t" 
				# add for awk imagesitch shellvar_lead_lines
		   . Xml::listDropDown('imageswitch_lead_lines', "3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15") # no value is "other" !!
			 . " " . wfMessage( 'e2d_convert_imageswitch_lead_lines_label' )->text() 
			. "<br/>\n\t" 
				# add for awk imagesitch shellvar_rating
		   . Xml::listDropDown('imageswitch_rating', "1\n2\n3\n4\n5") # no value is "other" !!
			 . " " . wfMessage( 'e2d_convert_imageswitch_rating_label' )->text() 
			. "<br/>\n\t" 
				# add for awk imagesitch shellvar_recommendation_group
		   . Xml::element( 'input', array(
				 'type' => 'text', 'name' => 'imageswitch_recommendation_group', 'size' => '50', 
				 'placeholder' => wfMessage( 'e2d_convert_imageswitch_recommendation_group_placeholder' )->plain() ) 
			 ) . " " . wfMessage( 'e2d_convert_imageswitch_recommendation_group_label' )->text() 
			. "\n\t" 
			. Xml::closeElement('fieldset')
			."</div>"
		."</div>";

		# $text .= "\t" .  '<hr style="margin: 10px 0 10px 0" />' . "\n";
		return $text;
	}

	static function printSubmitButton($valueWfMessage='e2d_convert-submit', $name='convert_file') {
		$formSubmitText = Xml::element( 'input',
			array(
				'type' => 'submit',
				'name' => $name,
				'value' => wfMessage( $valueWfMessage )->text()
			)
		);
		return "\t" . Xml::tags( 'p', null, $formSubmitText ) . "\n";
	}
	
}
