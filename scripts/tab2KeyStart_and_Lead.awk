#!/bin/awk -f
# unix file to convert tab spaced text file to {{Key Start}} and {{Lead}}
# this awk script reads textline by textline and applies the following
# awk-functions and commands
# it prints out a <textarea class="template-output">

BEGIN {
  FS = "\t" # tabulator as FS (field separator)
  global_empty_line_passed_start_lead_template_scan=""
    # {{Lead | 2- }}
    #          2  → decisions_decision_code_part    "number"
    #           - → decisions_alternative_code_part "-"
    #               decisions_alternative_codes     "empty" or "number" or "number & -"
    # {{Lead | A- }}
    #          A  → decisions_decision_code_part    "A-Z"
    #           - → decisions_alternative_code_part "-"
    #               decisions_alternative_codes     "A-Z" or "A-Z & -"
  global_decisions_alternative_codes="-" # TODO documentation
  global_decisions_decision_code_part="number"
  global_decisions_alternative_code_part="-"

  global_this_alternative_index=1

  global_this_nested_alternative_index=1
  global_nested_decisions_alternative_codes="a-z"
  global_nested_decisions_decision_code_part="a-z"
  global_nested_decisions_alternative_code_part="-"

  global_add_decision_backlinks=1

  GLOBAL_DECISIONNUMBER_GOBACK2DECISIONNUMBER[0] = ""
  # TODO result_id_list: checklist_id isfs_id florahelvetica_id infoflora_id

  # TODO alternative_text → decision_alternative_text

  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["decision_number"]="1"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["decision_code"]="1"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["decision_alternative_number"]="1"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["decision_alternative_code"]="1"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["decision_heading"]="subheading"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["alternative_text"]="2" # DEPRECATED alternative_text use decision_alternative_text
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["decision_alternative_text"]="2"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["next_decision_number"]="3"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["next_decision_code"]="3"

  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["description"]="description"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["remarks"]="remarks"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["author_treatment_public_comment"]="remarks" # DEPRECATED: author_treatment_public_comment
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["taxon_treatment_public_comment"]="remarks" # DEPRECATED: taxon_treatment_public_comment
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["author_treatment_hidden_comment"]="taxon treatment hidden comment"

  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["result_link"]="result"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["result_text"]="result text"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["result_id"]="result id"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["scientific_name"]="scientific name"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["scientific_name_synonyms"]="scientific name synonyms"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["common_names"]="common names"

  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["drawing_detail"]="drawing detail"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_1"]="image a"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_2"]="image b"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_3"]="image c"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_4"]="image d"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_5"]="image e"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_1_width"]="image a width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_2_width"]="image b width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_3_width"]="image c width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_4_width"]="image d width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_5_width"]="image e width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_1_heigt"]="image a height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_2_heigt"]="image b height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_3_heigt"]="image c height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_4_heigt"]="image d height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_5_heigt"]="image e height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_width"]="primary images width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["primary_media_height"]="primary images height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_primary_media_1"]="label a"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_primary_media_2"]="label b"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_primary_media_3"]="label c"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_primary_media_4"]="label d"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_primary_media_5"]="label e"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_primary_media_1"]="caption a"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_primary_media_2"]="caption b"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_primary_media_3"]="caption c"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_primary_media_4"]="caption d"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_primary_media_5"]="caption e"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["large_primary_media_1_width"]="image j width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["large_primary_media_1_height"]="image j height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["large_primary_media_2_width"]="image k width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["large_primary_media_2_height"]="image k height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["large_primary_media_1"]="image j"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["large_primary_media_2"]="image k"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_large_primary_media_1"]="caption j"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_large_primary_media_2"]="caption k"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_large_primary_media_1"]="label j"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_large_primary_media_2"]="label k"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_1"]="image m"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_2"]="image n"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_3"]="image o"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_4"]="image p"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_5"]="image q"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_6"]="image r"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_1_width"]="image m width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_2_width"]="image n width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_3_width"]="image o width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_4_width"]="image p width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_5_width"]="image q width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_6_width"]="image r width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_1_height"]="image m height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_2_height"]="image n height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_3_height"]="image o height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_4_height"]="image p height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_5_height"]="image q height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_6_height"]="image r height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_width"]="extra images width"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_height"]="extra images height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["collapsed_media_captionlines"]="captionlines"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_collapsed_media_1"]="label m"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_collapsed_media_2"]="label n"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_collapsed_media_3"]="label o"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_collapsed_media_4"]="label p"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_collapsed_media_5"]="label q"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["label_collapsed_media_6"]="label r"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_collapsed_media_1"]="caption m"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_collapsed_media_2"]="caption n"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_collapsed_media_3"]="caption o"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_collapsed_media_4"]="caption p"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_collapsed_media_5"]="caption q"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["caption_collapsed_media_6"]="caption r"

  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["life_form"]="life form"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["organism_size"]="organism size"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["organism_size_min"] ="organism size formula min-from-to-max-unit"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["organism_size_from"]="organism size formula min-from-to-max-unit"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["organism_size_to"]  ="organism size formula min-from-to-max-unit"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["organism_size_max"] ="organism size formula min-from-to-max-unit"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["organism_size_unit"]="organism size formula min-from-to-max-unit"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["organism_size_comment"]="organism size comment"

  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["plant_height"]     ="plant height"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["plant_height_min"] ="plant height formula min-from-to-max-unit"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["plant_height_from"]="plant height formula min-from-to-max-unit"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["plant_height_to"]  ="plant height formula min-from-to-max-unit"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["plant_height_max"] ="plant height formula min-from-to-max-unit"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["plant_height_unit"]="plant height formula min-from-to-max-unit"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["plant_height_comment"]="plant height comment"

  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["flowering_period"]="flowering period"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["flowering_period_min"]="flowering period formula min-from-to-max"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["flowering_period_from"]="flowering period formula min-from-to-max"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["flowering_period_to"]="flowering period formula min-from-to-max"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["flowering_period_max"]="flowering period formula min-from-to-max"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["flowering_period_comment"] = "flowering period comment"

  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["altitudinal_zones"]="altitudinal zones"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["altitudinal_zone_min"] ="altitudinal zone formula min-from-to-max"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["altitudinal_zone_from"]="altitudinal zone formula min-from-to-max"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["altitudinal_zone_to"]  ="altitudinal zone formula min-from-to-max"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["altitudinal_zone_max"] ="altitudinal zone formula min-from-to-max"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["altitudinal_zone_comment"]="altitudinal zone comment"


  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["occurrence"]="occurrence"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["occurrence_status"]="occurrence status"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["occurrence_ecology_typo"]="occurrence ecology typo"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["occurrence_ecology_values"]="occurrence ecology values"

  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["floristic_regions"]="floristic regions"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["floristic_zones"]="floristic zones"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["floristic_zones_comment"]="floristic zones comment"

  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["next_nested_decision_number"]="3"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["nested_decision_number"]="1"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["nested_decision_alternative_number"]="1"

  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["presence_territory"]="presence territory"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["xenophyte"]="xenophyte"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["toxicity"]="toxicity"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["result_id_list"]="result id list"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM  ["checklist_id"]     ="result id list"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM  ["florahelvetica_id"]="result id list"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM  ["infoflora_id"]     ="result id list"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM  ["isfs_id"]          ="result id list"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["references"]="references"
  GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM["map_comment"]="map comment"# Template:Lead ignored
  
  GLOBAL_DEPRECATED_2_USE_OTHER["key_start:edited_by"] = "contributors"
  GLOBAL_DEPRECATED_2_USE_OTHER["key_start:decision_alternative_code"] = "decisions_alternative_codes"
  GLOBAL_DEPRECATED_2_USE_OTHER["key_start:nested_decision_alternative_code"] = "nested_decisions_alternative_codes"
  GLOBAL_DEPRECATED_2_USE_OTHER["lead:floristic_regions"] = "floristic_zones"
  GLOBAL_DEPRECATED_2_USE_OTHER["lead:alternative_text"] = "decision_alternative_text"
  GLOBAL_DEPRECATED_MESSAGES_HTML_LIST = ""

  print "<textarea class=\"template-output\" style=\"min-height:500px;overflow:scroll;\">"
}
function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s) { return rtrim(ltrim(s)); }

# convert values in result_id_list into HTML tag
function convert_result_id_list(string) {
  string = gensub(/(florahelvetica_id|florahelvetica):\s*([^,;]+)/, "<span class=\"show\" data-term=\"florahelvetica_id\" data-prefix=\"FH\">\\2</span>", "G", string )
  string = gensub(/(checklist_id|checklist):\s*([^,;]+)/, "<span class=\"hide\" data-term=\"checklist_id\" data-prefix=\"Checklist\">\\2</span>", "G", string )
  string = gensub(/(isfs_id|isfs):\s*([^,;]+)/, "<span class=\"hide\" data-term=\"isfs_id\" data-prefix=\"isfs\">\\2</span>", "G", string )
  string = gensub(/(infoflora_id|infoflora):\s*([^,;]+)/, "<span class=\"hide\" data-term=\"infoflora_id\" data-prefix=\"Infoflora\">\\2</span>", "G", string )
  # remove blanks and , and ;
  string = gensub(/(>)[ ,;]+(<)/, "\\1\\2", "G", string )
  return string
}

# parameters within {{Key Start}}
function printKeyStartParameter(key, value) {
  # TODO author_treatment_public_comment
  # TODO author_treatment_hidden_comment
  value=trim(value)
  key=trim(key)
    
  if ( ("key_start:" key) in GLOBAL_DEPRECATED_2_USE_OTHER) {
    GLOBAL_DEPRECATED_MESSAGES_HTML_LIST = GLOBAL_DEPRECATED_MESSAGES_HTML_LIST "<li>Meta: " key " -> " GLOBAL_DEPRECATED_2_USE_OTHER[("key_start:" key)] "</li>"
  }
  
  if (match(key, /^id$/)) { print "| id=" value }
  if (match(key, /^title$/)) { print "| title=" value }
  if (match(key, /^language$/)) { print "| language=" value }
  if (match(key, /^geoscope$/)) { print "| geoscope=" value }
  if (match(key, /^audience$/)) { print "| audience=" value }
  if (match(key, /^description$/)) { print "| description=" value }
  if (match(key, /^publicity$/)) { print "| publicity=" value }
  if (match(key, /^rating$/)) { print "| rating=" value }
  if (match(key, /^recommendation[ _]group$/)) { print "| recommendation group=" value }
  if (match(key, /^taxon[ _]name$/)) { print "| taxon name=" value }
  if (match(key, /^rank[ _]code$/)) { print "| taxon rank code=" value }
  if (match(key, /^taxon[ _]rank[ _]code$/)) { print "| taxon rank code=" value }
  if (match(key, /^common[ _]names$/)) { print "| common names=" value }
  if (match(key, /^source$/)) { print "| source=" value }
  if (match(key, /^collaboration[ _]limited[ _]to$/)) { print "| collaboration limited to=" value }
  if (match(key, /^status$/)) { print "| status=" value }
  if (match(key, /^creators$/)) { print "| creators=" value }
  if (match(key, /^initiated[ _]by$/)) { print "| initiated_by=" value }
  if (match(key, /^contributors$/)) { print "| contributors=" value }
  if (match(key, /^edited[ _]by$/)) { print "| contributors=" value } # DEPRECATED "edited by" use contributors
  if (match(key, /^general[ _]review[ _]by$/)) { print "| general review by=" value }
  if (match(key, /^nomreview[ _]by$/)) { print "| nomreview by=" value }
  if (match(key, /^expert[ _]review[ _]by$/)) { print "| expert review by=" value }
  if (match(key, /^parent[ _]taxon$/)) { print "| parent taxon=" value }
  if (match(key, /^parent[ _]key$/)) { print "| parent key=" value }
  if (match(key, /^parent[ _]key[ _]text$/)) { print "| parent key text=" value }
  if (match(key, /^category$/)) { print "| category=" value }
  if (match(key, /^add[ _]decision[ _]backlinks$/)) { global_add_decision_backlinks=value }
  if (match(key, /^icon$/)) { print "| icon=" value }
  if (match(key, /^author[ _]treatment[ _]public[ _]comment$/)) { print "| taxon treatment public comment=" value } # DEPRECATED author_treatment_public_comment
  if (match(key, /^author[ _]treatment[ _]hidden[ _]comment$/)) { print "| taxon treatment hidden comment=" value } # DEPRECATED author_treatment_hidden_comment
  if (match(key, /^taxon[ _]treatment[ _]public[ _]comment$/)) { print "| taxon treatment public comment=" value }
  if (match(key, /^taxon[ _]treatment[ _]hidden[ _]comment$/)) { print "| taxon treatment hidden comment=" value }
  # if (match(key, /^drawing[ _]detail$/)) { print "| drawing detail=" value }
  # setting of decision alternative code
  if (match(key, /^decision[ _]alternative[ _]code$/)) {# DEPRECATED decision_alternative_code use decisions_alternative_codes
    # one item: decisions_alternative_codes (a-z)
    global_decisions_decision_code_part="number"
    global_decisions_alternative_code_part=value
    global_decisions_alternative_codes="number & " value
  }
  if (match(key, /^decisions[ _]alternative[ _]codes$/)) {
    this_ampersand_index=match(value, /&/)
    if (this_ampersand_index > 1) {
      # two items: decisions_alternative_codes (a-z & x)
      global_decisions_decision_code_part=   trim(substr(value,1,this_ampersand_index - length("&")))
      global_decisions_alternative_code_part=trim(substr(value,this_ampersand_index + length("&")))
      global_decisions_alternative_codes=value
    } else {
      # one item: decisions_alternative_codes (a-z)
      global_decisions_decision_code_part=value
      # global_decisions_alternative_code_part=global_decisions_alternative_code_part
      global_decisions_alternative_codes=value
    }
  }
  # setting of nested decision alternative code
  if (match(key, /^nested[ _]decision[ _]alternative[ _]code$/)) {# DEPRECATED Key Meta nested_decision_alternative_code use nested_decisions_alternative_codes
    global_nested_decisions_alternative_codes=value
    switch (tolower(value)) {
      case "a-z":
        global_nested_decisions_decision_code_part=   substr(value, 1, length("a-z"))
        global_nested_decisions_alternative_code_part=substr(value, length("a-z"))
        if (length(global_nested_decisions_alternative_code_part) == 0) {
          global_nested_decisions_alternative_code_part="-"
        }
        break
      case "number":
        global_nested_decisions_decision_code_part=   substr(value, 1, length(value))
        global_nested_decisions_alternative_code_part=substr(value, length(value))
        if (length(global_nested_decisions_alternative_code_part) == 0) {
          global_nested_decisions_alternative_code_part="-"
        }
        break
      default:
        global_nested_decisions_decision_code_part=   substr(value, 1, length("a-z"))
        global_nested_decisions_alternative_code_part=substr(value, length("a-z"))
        if (length(global_nested_decisions_alternative_code_part) == 0) {
          global_nested_decisions_alternative_code_part="-"
        }
        break
    }
  }
  if (match(key, /^nested[ _]decisions[ _]alternative[ _]codes$/)) {
    global_nested_decisions_alternative_codes=value
    this_ampersand_index=match(value, /&/)
    if (this_ampersand_index > 1) {
      # two items: nested_decisions_alternative_codes (a-z & x)
      global_nested_decisions_decision_code_part=   trim(substr(value, 1, this_ampersand_index - length("&")))
      global_nested_decisions_alternative_code_part=trim(substr(value, this_ampersand_index + length("&")))
      # global_nested_decisions_alternative_codes=value
    } else {
      # one item: nested_decisions_alternative_codes (a-z)
      global_nested_decisions_decision_code_part=value
      # global_nested_decisions_alternative_code_part=global_nested_decisions_alternative_code_part
      # global_nested_decisions_alternative_codes=value
    }
  }
}# printKeyStartParameter

function decisionAlternativeCode(this_decision_num) {
  # global_this_alternative_index set in printLeadParameterFromLineInput()
  # if decision_code and decision_alternative_code
  this_decision_code =""
  this_returntext =""
  switch (global_decisions_decision_code_part) {
  case "number":
  case "Number":
  case "numbers":
  case "Numbers":
    this_decision_code=this_decision_num
    break
  case "a-z":
    this_decision_code=substr("abcdefgijklmnopqrstuvwxyz???????",this_decision_num, 1)
    break
  case "A-Z":
    this_decision_code=substr("ABCDEFGIJKLMNOPQRSTUVWXYZ???????",this_decision_num, 1)
    break
  default:
    this_decision_code=this_decision_num
    break
  }# switch decision_code_part

  switch (global_decisions_alternative_code_part) {
  case "'":
    if (global_this_alternative_index < 2) { this_returntext=this_decision_code }
    else { this_returntext= this_decision_code substr("'''''''''''''''",1, global_this_alternative_index - 1) }
    break
  case "’":
    if (global_this_alternative_index < 2) { this_returntext=this_decision_code }
    else { this_returntext= this_decision_code substr("’’’’’’’’’’’’’’’",1, global_this_alternative_index - 1) }
    break
  case "*":
    if (global_this_alternative_index < 2) { this_returntext=this_decision_code }
    else { this_returntext=this_decision_code substr("***************",1, global_this_alternative_index - 1) }
    break
  case "a-z":
    this_returntext=this_decision_code substr("abcdefgijklmnopqrstuvwxyz???????",global_this_alternative_index, 1)
    break
  case "A-Z":
    this_returntext=this_decision_code substr("ABCDEFGIJKLMNOPQRSTUVWXYZ???????",global_this_alternative_index, 1)
    break
  default:
    if (global_this_alternative_index < 2) { this_returntext=this_decision_code }
    else {
      if (length(global_decisions_alternative_code_part) == 1) {
        # allow passing of a single character
        this_returntext=this_decision_code global_decisions_alternative_code_part
      } else {
        this_returntext=this_decision_code "-"
      }
    }
    break
  }
  return this_returntext
}# decisionAlternativeCode

# @requires: this_nested_decision_num must start with 0 !!
function nestedDecisionAlternativeCode(this_nested_decision_num) {
  # echo line | awk '{print substr("abcdefgijklmnopqrstuvwxyz", 0, 1)}' → a
  # echo line | awk '{print substr("abcdefgijklmnopqrstuvwxyz", 1, 1)}' → a
  # echo line | awk '{print substr("abcdefgijklmnopqrstuvwxyz", 2, 1)}' → b
  this_nested_decision_code = ""
  this_returntext = ""
  # decision code part
  switch (global_nested_decisions_decision_code_part) {# TODO global_nested_decision_alternative_code
  case "number":
  case "Number":
  case "numbers":
  case "Numbers":
    # this_nested_decision_num must start with 0 !!
    if ( this_nested_decision_num == 0)
      { this_nested_decision_code = 1 }
    else
      { this_nested_decision_code = this_nested_decision_num }
    break
  case "a-z":
    this_nested_decision_code = substr("abcdefgijklmnopqrstuvwxyz???????",this_nested_decision_num, 1)
    break
  case "A-Z":
    this_nested_decision_code = substr("ABCDEFGIJKLMNOPQRSTUVWXYZ???????",this_nested_decision_num, 1)
    break
  default: # defaults to a-z
    this_nested_decision_code = substr("abcdefgijklmnopqrstuvwxyz???????",this_nested_decision_num, 1)
    break
  }
  # alternative code parts
  if (length(global_nested_decisions_alternative_code_part) == 1) {# alternative code part= multiple characters
    switch (global_nested_decisions_alternative_code_part) {
      case "*":
      case "'":
      case "’":
      case "-": # minus
      case "–": # endash
      case "—": # emdash
        if (global_this_nested_alternative_index > 1) {
          # OLD: this_returntext=this_nested_decision_code substr("***************",1, global_this_nested_alternative_index - 1)
          # (1) repeat n blanks, (2) replace them, (3) concatenate
          this_nested_decision_alternative_code=sprintf("%*s", global_this_nested_alternative_index - 1,"");
          # (2) replace blanks with global_nested_decisions_alternative_code_part
          gsub(/ /, global_nested_decisions_alternative_code_part, this_nested_decision_alternative_code )
          # (3) concatenate
          this_returntext = this_nested_decision_code this_nested_decision_alternative_code
        } else {
          this_returntext = this_nested_decision_code
        }
        break
      default:
        if (global_this_nested_alternative_index > 1) {
          this_returntext = this_nested_decision_code "-"
        } else {
          this_returntext = this_nested_decision_code
        }
        break
    }
  } else {# alternative code part= multiple characters
    if (global_this_nested_alternative_index > 1) {
      this_returntext = this_nested_decision_code "-"
    } else {
      this_returntext = this_nested_decision_code
    }
  }
  return this_returntext
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
#########################################
# convert line to parameter of {{Lead}}
#########################################
function printLeadParameterFromLineInput (string) {
  if (! match(string, /^[ \t]*$/)) {
    global_this_alternative_index=$GLOBAL_USED_COLNAME_2_COLINDEX["decision_alternative_number"]
    print "{{Lead"
    # $col_i is the actual value of the cell: but the dollar ($) and the numeric index contained in col_i combined get
    # substituted to the cell value as $1 $2 $3 etc.
    this_flowering_period_formula="NA/NA/NA/NA";this_must_convert_flowering_period_formula =""
    this_altitudinal_zone_formula="NA/NA/NA/NA";this_must_convert_altitudinal_zone_formula =""
    this_plant_height_formula="NA/NA/NA/NA/cm";this_must_convert_plant_height_formula =""
    this_organism_size_formula="NA/NA/NA/NA/cm";this_must_convert_organism_size_formula =""
    this_result_id_list=""

    for(col_i = 1; col_i <= NF; col_i++) {
      # print col_i
      # print
      if ((col_i in GLOBAL_COLINDEX_2_USED_COLNAME) && ($col_i != "") ) {
        switch (GLOBAL_COLINDEX_2_USED_COLNAME[col_i]) {
          case "next_decision_number":
            if ( "next_decision_code" in  GLOBAL_USED_COLNAME_2_COLINDEX ) {
              print "| 3=" $GLOBAL_USED_COLNAME_2_COLINDEX["next_decision_code"]
            } else {
              print "|", GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM[GLOBAL_COLINDEX_2_USED_COLNAME[col_i]] "=" globalStringSubstitution4TextShortCuts($col_i)
            }
            break
          case "decision_number":
            if ("next_decision_number" in GLOBAL_USED_COLNAME_2_COLINDEX) {
              if ($GLOBAL_USED_COLNAME_2_COLINDEX["next_decision_number"] != "" ) {
                # print $GLOBAL_USED_COLNAME_2_COLINDEX["next_decision_number"] "←" $col_i
                GLOBAL_DECISIONNUMBER_GOBACK2DECISIONNUMBER [$GLOBAL_USED_COLNAME_2_COLINDEX["next_decision_number"]] = $col_i
              }
            }
            if ( ( "decision_alternative_code" in  GLOBAL_USED_COLNAME_2_COLINDEX ) && 
                 ( "decision_code" in  GLOBAL_USED_COLNAME_2_COLINDEX ) ) {
              print "| 1=" $GLOBAL_USED_COLNAME_2_COLINDEX["decision_code"] $GLOBAL_USED_COLNAME_2_COLINDEX["decision_alternative_code"]
            } else {
              if ( "nested_decision_number" in  GLOBAL_USED_COLNAME_2_COLINDEX ) {
                if ($GLOBAL_USED_COLNAME_2_COLINDEX["nested_decision_number"] != "") {
                  global_this_nested_alternative_index=$GLOBAL_USED_COLNAME_2_COLINDEX["nested_decision_alternative_number"]
                  if ($GLOBAL_USED_COLNAME_2_COLINDEX["nested_decision_number"] == 0) {
                    print "| 1=" decisionAlternativeCode($GLOBAL_USED_COLNAME_2_COLINDEX["decision_number"])
                    print "| nested=" nestedDecisionAlternativeCode($GLOBAL_USED_COLNAME_2_COLINDEX["nested_decision_number"])
                  } else {
                    print "| 1=" nestedDecisionAlternativeCode($GLOBAL_USED_COLNAME_2_COLINDEX["nested_decision_number"])
                    print "| parentlead=" decisionAlternativeCode($GLOBAL_USED_COLNAME_2_COLINDEX["decision_number"])
                    if ("next_nested_decision_number" in GLOBAL_USED_COLNAME_2_COLINDEX) {
                      if ($GLOBAL_USED_COLNAME_2_COLINDEX["next_nested_decision_number"] != "" ) {
                        global_this_nested_alternative_index=1
                        print "| 3=" nestedDecisionAlternativeCode($GLOBAL_USED_COLNAME_2_COLINDEX["next_nested_decision_number"])
                      }
                    }
                  }
                  break;
                } else {
                  # print "| 1 (nested)=" decisionAlternativeCode($col_i)
                  if ($col_i in GLOBAL_DECISIONNUMBER_GOBACK2DECISIONNUMBER && global_this_alternative_index < 2 && global_add_decision_backlinks == 1) {
                    print "| 1=" decisionAlternativeCode($col_i) " (" GLOBAL_DECISIONNUMBER_GOBACK2DECISIONNUMBER [$col_i] ")"
                  } else {
                    print "| 1=" decisionAlternativeCode($col_i)
                  }
                }
              } else {
                # print "| 1 (no nested)=" decisionAlternativeCode($col_i)
                if ($col_i in GLOBAL_DECISIONNUMBER_GOBACK2DECISIONNUMBER && global_this_alternative_index < 2 && global_add_decision_backlinks == 1) {
                  print "| 1=" decisionAlternativeCode($col_i) " (" GLOBAL_DECISIONNUMBER_GOBACK2DECISIONNUMBER [$col_i] ")"
                } else {
                  print "| 1=" decisionAlternativeCode($col_i)
                }
              }
            }
            break
          case "decision_alternative_number":
          case "decision_alternative_code":
          case "decision_code":
            break
          case "nested_decision_number":
          case "nested_decision_alternative_number":
          case "next_nested_decision_number":
            break
          case "flowering_period_min":
            this_flowering_period_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, $col_i "/\\2/\\3/\\4", 1, this_flowering_period_formula)
            this_must_convert_flowering_period_formula=1
            break
          case "flowering_period_from":
            this_flowering_period_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, "\\1/" $col_i "/\\3/\\4", 1, this_flowering_period_formula)
            this_must_convert_flowering_period_formula=1
            break
          case "flowering_period_to":
            this_flowering_period_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, "\\1/\\2/" $col_i "/\\4", 1, this_flowering_period_formula)
            this_must_convert_flowering_period_formula=1
            break
          case "flowering_period_max":
            this_flowering_period_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, "\\1/\\2/\\3/" $col_i, 1, this_flowering_period_formula)
            this_must_convert_flowering_period_formula=1
            break
          case "altitudinal_zone_min":
            this_altitudinal_zone_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, $col_i "/\\2/\\3/\\4", 1, this_altitudinal_zone_formula)
            this_must_convert_altitudinal_zone_formula=1
            break
          case "altitudinal_zone_from":
            this_altitudinal_zone_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, "\\1/" $col_i "/\\3/\\4", 1, this_altitudinal_zone_formula)
            this_must_convert_altitudinal_zone_formula=1
            break
          case "altitudinal_zone_to":
            this_altitudinal_zone_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, "\\1/\\2/" $col_i "/\\4", 1, this_altitudinal_zone_formula)
            this_must_convert_altitudinal_zone_formula=1
            break
          case "altitudinal_zone_max":
            this_altitudinal_zone_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, "\\1/\\2/\\3/" $col_i, 1, this_altitudinal_zone_formula)
            this_must_convert_altitudinal_zone_formula=1
            break
          case "plant_height_min":
            this_replace_regex=($col_i "/\\2/\\3/\\4/\\5")
            this_plant_height_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, this_replace_regex, "g", this_plant_height_formula)
            this_must_convert_plant_height_formula=1
            break
          case "plant_height_from":
            this_replace_regex=("\\1/" $col_i "/\\3/\\4/\\5")
            this_plant_height_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, this_replace_regex, "g", this_plant_height_formula)
            this_must_convert_plant_height_formula=1
            break
          case "plant_height_to":
            this_replace_regex=("\\1/\\2/" $col_i "/\\4/\\5")
            this_plant_height_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, this_replace_regex, "g", this_plant_height_formula)
            this_must_convert_plant_height_formula=1
            break
          case "plant_height_max":
            this_replace_regex=("\\1/\\2/\\3/" $col_i "/\\5")
            this_plant_height_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, this_replace_regex, "g", this_plant_height_formula)
            this_must_convert_plant_height_formula=1
            break
          case "plant_height_unit":
            this_replace_regex=("\\1/\\2/\\3/\\4/" $col_i)
            this_plant_height_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, this_replace_regex, "g", this_plant_height_formula)
            this_must_convert_plant_height_formula=1
            break
          case "organism_size_min":
            this_organism_size_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, $col_i "/\\2/\\3/\\4/\\5", 1, this_organism_size_formula)
            this_must_convert_organism_size_formula=1
            break
          case "organism_size_from":
            this_organism_size_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, "\\1/" $col_i "/\\3/\\4/\\5", 1, this_organism_size_formula)
            this_must_convert_organism_size_formula=1
            break
          case "organism_size_to":
            this_organism_size_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, "\\1/\\2/" $col_i "/\\4/\\5", 1, this_organism_size_formula)
            this_must_convert_organism_size_formula=1
            break
          case "organism_size_max":
            this_organism_size_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, "\\1/\\2/\\3/" $col_i "/\\5", 1, this_organism_size_formula)
            this_must_convert_organism_size_formula=1
            break
          case "organism_size_unit":
            this_organism_size_formula=gensub(/^([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)\/([^/]+)$/, "\\1/\\2/\\3/\\4/" $col_i, 1, this_organism_size_formula)
            this_must_convert_organism_size_formula=1
            break
          case "result_id_list":
            this_result_id_list = convert_result_id_list($col_i)
            break
          case "checklist_id":
            this_result_id_list = this_result_id_list "<span class=\"hide\" data-term=\"" GLOBAL_COLINDEX_2_USED_COLNAME[col_i] "\" data-prefix=\"checklist\">" $col_i "</span>"
            break
          case "florahelvetica_id":
            this_result_id_list = this_result_id_list "<span class=\"show\" data-term=\"" GLOBAL_COLINDEX_2_USED_COLNAME[col_i] "\" data-prefix=\"FH\">" $col_i "</span>"
            break
          case "isfs_id":
            this_result_id_list = this_result_id_list "<span class=\"hide\" data-term=\"" GLOBAL_COLINDEX_2_USED_COLNAME[col_i] "\" data-prefix=\"isfs\">" $col_i "</span>"
            break
          case "infoflora_id":
            this_result_id_list = this_result_id_list "<span class=\"hide\" data-term=\"" GLOBAL_COLINDEX_2_USED_COLNAME[col_i] "\" data-prefix=\"infoflora\">" $col_i "</span>"
            break
          default:
            # |parameter=value
            print "|", GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM[GLOBAL_COLINDEX_2_USED_COLNAME[col_i]] "=" globalStringSubstitution4TextShortCuts($col_i)
        }# cases
      }# column values
      # print "DEBUG: case " GLOBAL_COLINDEX_2_USED_COLNAME[col_i]
      # print "DEBUG: | plant height formula min-from-to-max-unit =" this_plant_height_formula
      if (col_i == NF) { # eventually print formula
        if (length(this_must_convert_flowering_period_formula))
          { print "| flowering period formula min-from-to-max=" this_flowering_period_formula }
        else { this_must_convert_flowering_period_formula = "" }
        
        if (length(this_must_convert_altitudinal_zone_formula))
          { print "| altitudinal zone formula min-from-to-max=" this_altitudinal_zone_formula }
        else { this_must_convert_altitudinal_zone_formula = "" }
        
        if (length(this_must_convert_plant_height_formula))
          { print "| plant height formula min-from-to-max-unit=" this_plant_height_formula }
        else { this_must_convert_plant_height_formula = "" }
        
        if (length(this_must_convert_organism_size_formula))
          { print "| organism height formula min-from-to-max-unit=" this_organism_size_formula }
        else { this_must_convert_organism_size_formula = "" }
        
        if (length(this_result_id_list))
          { print "| result id list=" this_result_id_list }
      }
    }# foor loop
    print "}}"
  }
}

function saveHeaderColumns2Array() {
  for(col_i = 1; col_i <= NF; col_i++) {
    if (trim($col_i) in GLOBAL_AVAILABLE_COLUMNNAME_2_LEADPARAM) {
      # print trim($col_i)
      GLOBAL_COLINDEX_2_USED_COLNAME[col_i]=trim($col_i)
      GLOBAL_USED_COLNAME_2_COLINDEX[trim($col_i)]=col_i
      if ( ("lead:" trim($col_i)) in GLOBAL_DEPRECATED_2_USE_OTHER) {
        switch(shellvar_wgLanguageCode) {
          case "de-formal":
          case "de":
            GLOBAL_DEPRECATED_MESSAGES_HTML_LIST = GLOBAL_DEPRECATED_MESSAGES_HTML_LIST "<li>Spalte: " trim($col_i) " -> " GLOBAL_DEPRECATED_2_USE_OTHER[("lead:" trim($col_i))] "</li>"
          break
          case "en":
            GLOBAL_DEPRECATED_MESSAGES_HTML_LIST = GLOBAL_DEPRECATED_MESSAGES_HTML_LIST "<li>Column: " trim($col_i) " -> " GLOBAL_DEPRECATED_2_USE_OTHER[("lead:" trim($col_i))] "</li>"
          break
          case "fr":
            GLOBAL_DEPRECATED_MESSAGES_HTML_LIST = GLOBAL_DEPRECATED_MESSAGES_HTML_LIST "<li>Colonne: " trim($col_i) " -> " GLOBAL_DEPRECATED_2_USE_OTHER[("lead:" trim($col_i))] "</li>"
          break
          default:
            GLOBAL_DEPRECATED_MESSAGES_HTML_LIST = GLOBAL_DEPRECATED_MESSAGES_HTML_LIST "<li>Column, Spalte, colonne: " trim($col_i) " -> " GLOBAL_DEPRECATED_2_USE_OTHER[("lead:" trim($col_i))] "</li>"
            break
        }
      }
    }
  }
}

# scan for empty line
$0 ~ /^[\t]*$/ {
  global_empty_line_passed_start_lead_template_scan="Yes"
  print "}}"; # final {{Key Start}}
}

{
  if (global_empty_line_passed_start_lead_template_scan==""){
    if (NR == 1) { print "{{Key Start" }
    printKeyStartParameter($1, $2)
  } else {
    if (match($0, /(alternative_text|decision_alternative_text)/)){
      # translate to {{Key Start}} decisions will follow next line
      saveHeaderColumns2Array()
    } else {
      # translate to {{Lead}}
       printLeadParameterFromLineInput($0)
    }
  }
}
END {
  print "{{Key End}}"
  print "</textarea>"
  if (GLOBAL_DEPRECATED_MESSAGES_HTML_LIST) {
    switch(shellvar_wgLanguageCode) {
      case "de-formal":
      case "de":
        print "<div style='border:1px solid #fbeed5;background-color:#fcf8e3;padding:5px;'><span style='font-size:larger'>&#x26a0; Folgende Parameter sind veraltet und werden nicht mehr unterstützt. Bitte ändern Sie die Tabelle: &#x26a0;</span>"
      break
      case "en":
        print "<div style='border:1px solid #fbeed5;background-color:#fcf8e3;padding:5px;'><span style='font-size:larger'>&#x26a0; Deprecated parameters as follow will no longer be supported. Please alter the spread sheet data: &#x26a0;</span>"
      break
      case "fr":
        print "<div style='border:1px solid #fbeed5;background-color:#fcf8e3;padding:5px;'><span style='font-size:larger'>&#x26a0; Paramètres désapprouvées comme suivi ne sont plus supporter. S'il vous plaît modifier la feuille de calcul: &#x26a0;</span>"
      break
      default:
        print "<div style='border:1px solid #fbeed5;background-color:#fcf8e3;padding:5px;'><span style='font-size:larger'>&#x26a0; Deprecated parameters as follow will no longer be supported. Please alter the spread sheet data: &#x26a0;</span>"
        break
    }

    print "<ul>" GLOBAL_DEPRECATED_MESSAGES_HTML_LIST "</ul>"
    print "</div>"
  }
}
