#!/bin/awk -f
# unix file to convert tab spaced text file to {{Image Switch}}
# this awk script reads textline by textline and applies the following
# awk-functions and commands
BEGIN {
  FS = "\t" # tabulator as FS (field separator)
  # shell variables
  # shellvar_caption_lines
  # shellvar_caption_style
  # shellvar_image_framestyle
  # shellvar_image_width
  # shellvar_layout_format
  # shellvar_lead_lines
  # shellvar_rating
  # shellvar_recommendation_group
  # shellvar_pagename_addendum
  # shellvar_link_url
  # shellvar_style
  for (i = 0; i <= 255; i++) {# https://gist.github.com/moyashi/4063894
    GLOBAL_CHARACTER[sprintf("%c", i)] = i
  }
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["decision_alternative_text"]="lead %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["result_id"]="result id %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["result_link"]="result %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["result_text"]="result text %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["primary_media"]="image %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["scientific_name"]="scientific name %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_da"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_de"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_dk"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_el"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_en"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_es"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_et"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_fi"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_fr"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_it"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_lt"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_lv"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_nl"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_no"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_pl"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_pt"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_ru"]="common_names %alt_index%"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["common_names_sv"]="common_names %alt_index%"

  # universal parameters
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["decision_alternative_textlines"]="lead lines"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["creators"]="creators"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["contributors"]="contributors"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["decisionkey_id"]="id"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["decisionkey_format"]="layout format"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["decisionkey_style"]="style"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["decisionkey_rating"]="rating"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["decisionkey_recommendation_group"]="recommendation group"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["decisionkey_title"]="title"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["primary_media_width"]="image width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["primary_media_caption_lines"]="caption lines"
  GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM["primary_media_caption_style"]="caption style"
  
  GLOBAL_THIS_MAIN_IMAGESWITCHPARAM["primary_media_width"]=""
  GLOBAL_THIS_MAIN_IMAGESWITCHPARAM["primary_media_caption_lines"]=""
  GLOBAL_THIS_MAIN_IMAGESWITCHPARAM["primary_media_caption_style"]=""
  GLOBAL_THIS_MAIN_IMAGESWITCHPARAM["decision_alternative_textlines"]=""
  GLOBAL_THIS_MAIN_IMAGESWITCHPARAM["creators"]=""
  GLOBAL_THIS_MAIN_IMAGESWITCHPARAM["contributors"]=""
  GLOBAL_THIS_MAIN_IMAGESWITCHPARAM["decisionkey_id"]=""
  GLOBAL_THIS_MAIN_IMAGESWITCHPARAM["decisionkey_format"]=""
  GLOBAL_THIS_MAIN_IMAGESWITCHPARAM["decisionkey_style"]=""
  GLOBAL_THIS_MAIN_IMAGESWITCHPARAM["decisionkey_rating"]=""
  GLOBAL_THIS_MAIN_IMAGESWITCHPARAM["decisionkey_recommendation_group"]=""
  GLOBAL_THIS_MAIN_IMAGESWITCHPARAM["decisionkey_title"]=""
  
  global_decision_alternative_index=1
  global_parameter_columns_scanned=0
  global_scan_for_imageswitch_parameter=0
  global_this_line_has_common_names_parsed=0
  
  print "<div id=\"template_output_ui-accordion\"><!-- AWK output START -->"
}
function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s) { return rtrim(ltrim(s)); } 

# urlencode from https://gist.github.com/moyashi/4063894
function urlencode(str, c, len, res) {
    len = length(str)
    res = ""
    for (i = 1; i <= len; i++) {
      c = substr(str, i, 1);
      if (c ~ /[0-9A-Za-z]/) {
          res = res c
      } else {
          res = res "%" sprintf("%02X", GLOBAL_CHARACTER[c])
      }
    }
    return res
}

function globalStringSubstitution4TextShortCuts (string) {
  string=gensub(/<\+\/?->/, "±", "G", string)
  string=gensub(/<fm>/, "☿", "G", string)
  string=gensub(/<mf>/, "⚥", "G", string)
  string=gensub(/<m>/, "♂", "G", string)
  string=gensub(/<f>/, "♀", "G", string)
  string=gensub(/<=/, "≤", "G", string)
  string=gensub(/>=/, "≥", "G", string)
  string=gensub(/<([1-9])\/([1-9][0-9]?)>/, "<span class=\"frac nowrap\"><sup>\\1</sup>/<sub>\\2</sub></span>", "G", string)
  return string
}


function saveHeaderColumns2Array() {
  for(col_i = 1; col_i <= NF; col_i++) { 
    if (trim($col_i) in GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM) {
      # print trim($col_i)
      GLOBAL_COLINDEX_2_USED_COLNAME[col_i]=trim($col_i)
      GLOBAL_USED_COLNAME_2_COLINDEX[trim($col_i)]=col_i
    }
  }
}

#########################################
# convert line to parameter of {{ImageSwitch}}
#########################################

function saveMainImageSwitchParameters2GlobalsFromInputLine() {
  for (column_prameter  in GLOBAL_THIS_MAIN_IMAGESWITCHPARAM) {
    if (column_prameter in  GLOBAL_USED_COLNAME_2_COLINDEX) {
      if ($GLOBAL_USED_COLNAME_2_COLINDEX[column_prameter] != "") {
        GLOBAL_THIS_MAIN_IMAGESWITCHPARAM[column_prameter]=$GLOBAL_USED_COLNAME_2_COLINDEX[column_prameter]
      } else {
        GLOBAL_THIS_MAIN_IMAGESWITCHPARAM[column_prameter]=""
      }
    }
  }
}

function returnCommonNamesFromInputLine(alt_index) {
  append_only_values_to_this_template_parameter=0
  this_returntext=""
  this_language_code=""
  for (column_prameter  in GLOBAL_USED_COLNAME_2_COLINDEX) {
    if (match(column_prameter, /^common_names/)) {
      this_language_code=column_prameter
      sub(/^common_names_/, "", this_language_code)
      if ($GLOBAL_USED_COLNAME_2_COLINDEX[column_prameter] != "") {
        if (append_only_values_to_this_template_parameter == 0) {
          this_returntext = "\n| common names " alt_index "=" "@" this_language_code ":" $GLOBAL_USED_COLNAME_2_COLINDEX[column_prameter]
          append_only_values_to_this_template_parameter=1
        } else {
          this_returntext = this_returntext " @" this_language_code ":" $GLOBAL_USED_COLNAME_2_COLINDEX[column_prameter]
        }
      }
    }
  }
  if (global_this_line_has_common_names_parsed == 0) {
    return this_returntext
  }
}

function returnMainImageSwitchParametersFromGlobals() {
  this_returntext=""
  for (column_prameter  in GLOBAL_THIS_MAIN_IMAGESWITCHPARAM) {
    if (GLOBAL_THIS_MAIN_IMAGESWITCHPARAM[column_prameter] != "") {
      this_returntext = this_returntext "\n| " GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM[column_prameter] "=" GLOBAL_THIS_MAIN_IMAGESWITCHPARAM[column_prameter]
    }
    GLOBAL_THIS_MAIN_IMAGESWITCHPARAM[column_prameter] = ""
  }
  
  if (shellvar_lead_lines)           { this_returntext = this_returntext "\n| lead lines=" shellvar_lead_lines }
  if (shellvar_caption_lines)        { this_returntext = this_returntext "\n| caption lines=" shellvar_caption_lines }
  if (shellvar_caption_style)        { this_returntext = this_returntext "\n| caption style=" shellvar_caption_style }
  if (shellvar_image_framestyle)     { this_returntext = this_returntext "\n| image framestyle=" shellvar_image_framestyle }
  if (shellvar_image_width)          { this_returntext = this_returntext "\n| image width=" shellvar_image_width }
  if (shellvar_layout_format)        { this_returntext = this_returntext "\n| layout format=" shellvar_layout_format }
  if (shellvar_style)                { this_returntext = this_returntext "\n| style=" shellvar_style }
  if (shellvar_rating)               { this_returntext = this_returntext "\n| rating=" shellvar_rating }
  if (shellvar_recommendation_group) { this_returntext = this_returntext "\n| recommendation group=" shellvar_recommendation_group }
  
  return this_returntext
}

########################################
# url: http://offene-naturfuehrer.de/w/index.php?title=%s&action=edit
#      %s is substituted by the title
function returnWikiUrl(url, page) {
  sub(/ /, "_", page)
  sub(/=%s/, "=" urlencode(page), url)
  return url  
}

########################################
# scan line by line
########################################
{
  if (global_parameter_columns_scanned == 1) {
    if (global_scan_for_imageswitch_parameter==1) {
      if ($GLOBAL_USED_COLNAME_2_COLINDEX["result_text"] != "" && $GLOBAL_USED_COLNAME_2_COLINDEX["primary_media"] != "") {
        # print "global_decision_alternative_index:", global_decision_alternative_index
        # print "global_scan_for_imageswitch_parameter:", global_scan_for_imageswitch_parameter
        if (global_decision_alternative_index == 1 ) {
          print "<textarea class=\"template-output\" style=\"min-height:500px;overflow:scroll;\">"
          print "{{ImageSwitch" returnMainImageSwitchParametersFromGlobals()
        }
        for(col_i = 1; col_i <= NF; col_i++) {
          if ((col_i in GLOBAL_COLINDEX_2_USED_COLNAME) && ($col_i != "") ) {
            this_template_parameter = GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM[GLOBAL_COLINDEX_2_USED_COLNAME[col_i]]
            sub(/%alt_index%/, global_decision_alternative_index, this_template_parameter)
            switch (GLOBAL_COLINDEX_2_USED_COLNAME[col_i]) {
              case "decision_alternative_text":
              case "primary_media":
              case "result_id":
              case "result_text":
              case "scientific_name":
                print "|", this_template_parameter "=" globalStringSubstitution4TextShortCuts($col_i)
              break
              case "common_names_da":
              case "common_names_de":
              case "common_names_dk":
              case "common_names_el":
              case "common_names_en":
              case "common_names_es":
              case "common_names_et":
              case "common_names_fi":
              case "common_names_fr":
              case "common_names_it":
              case "common_names_lt":
              case "common_names_lv":
              case "common_names_nl":
              case "common_names_no":
              case "common_names_pl":
              case "common_names_pt":
              case "common_names_ru":
              case "common_names_sv":
                if ( global_this_line_has_common_names_parsed == 0 ) { 
                  print returnCommonNamesFromInputLine(global_decision_alternative_index)
                  global_this_line_has_common_names_parsed = 1
                }
              break
              case "result_link":
                this_template_parameter = GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM[GLOBAL_COLINDEX_2_USED_COLNAME[col_i]]
                sub(/%alt_index%/, global_decision_alternative_index, this_template_parameter)
                if (shellvar_pagename_addendum) {
                  print "|", this_template_parameter "=" $col_i " " shellvar_pagename_addendum
                } else {
                  print "|", this_template_parameter "=" $col_i
                }
              break
              default:
                break
                # |parameter=value
                # print "|", GLOBAL_AVAILABLE_COLUMNNAME_2_IMAGESWITCHPARAM[GLOBAL_COLINDEX_2_USED_COLNAME[col_i]] "=" globalStringSubstitution4TextShortCuts($col_i)
            }
          }
        }# foor loop
        print ""
        global_decision_alternative_index = global_decision_alternative_index + 1
      } else {
        print "}}" # close ImageSwitch
        print "</textarea>" # close accordion container
        print "</div>" # close accordion container
        global_scan_for_imageswitch_parameter=0
        global_decision_alternative_index=1
        global_this_line_has_common_names_parsed=0
      }
    }

    if ($GLOBAL_USED_COLNAME_2_COLINDEX["result_text"] != "" && $GLOBAL_USED_COLNAME_2_COLINDEX["result_link"] == "" && $GLOBAL_USED_COLNAME_2_COLINDEX["primary_media"] == "") {
      if (shellvar_pagename_addendum) {
        print "<h3>" $GLOBAL_USED_COLNAME_2_COLINDEX["result_text"] " " shellvar_pagename_addendum "</h3><!-- page name -->"
      } else {
        print "<h3>" $GLOBAL_USED_COLNAME_2_COLINDEX["result_text"] "</h3><!-- page name -->"
      }
      print "<div>" # start accordion container
      if (shellvar_pagename_addendum) {
        print "<a href=\"" returnWikiUrl(shellvar_link_url, $GLOBAL_USED_COLNAME_2_COLINDEX["result_text"] " " shellvar_pagename_addendum) "\" class=\"external\" target=\"_blank\">" $GLOBAL_USED_COLNAME_2_COLINDEX["result_text"] " " shellvar_pagename_addendum "</a>" # start accordion container
      } else {
        print "<a href=\"" returnWikiUrl(shellvar_link_url, $GLOBAL_USED_COLNAME_2_COLINDEX["result_text"]) "\" class=\"external\" target=\"_blank\">" $GLOBAL_USED_COLNAME_2_COLINDEX["result_text"] "</a>" # start accordion container
      }
      
      global_scan_for_imageswitch_parameter=1
      saveMainImageSwitchParameters2GlobalsFromInputLine()
    }
    
  }
  if (match($0, /primary[ _]media/)){
    saveHeaderColumns2Array()
    global_parameter_columns_scanned=1
  }
}

END {
  if (global_decision_alternative_index > 1) {# if last line of spreadsheet is a decision key matrix line
      print "}}" # close ImageSwitch
      print "</textarea>" # close accordion container
      print "</div>" # close accordion container    
  }
  print "</div><!-- AWK output END -->" # close global accordion container
}


