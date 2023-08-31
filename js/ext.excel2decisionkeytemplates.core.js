/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$( function () {
  if ($('#template_ui-tab').length) {
    mw.loader.using( 'jquery.ui.tabs' ).done( function () {    
      $('#template_ui-tab').tabs(); } 
    );    
  }
  if ($('#template_output_ui-accordion').length) {
    mw.loader.using( 'jquery.ui.accordion' ).done( function () {    
      $('#template_output_ui-accordion').accordion({
        heightStyle: "content",
        icons: false // some layout problems MW 1.23.8
      }); 
    }); 
  }
});