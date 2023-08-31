# Help:Convert spreadsheet data into decision key templates



<div id="mw-content-text" class="mw-content-ltr" lang="en" dir="ltr">



  
Data from a spreadsheet (e.g. LibreOffice, Excel) that are in the format
as an identification key matrix can be converted to decision key
templates. Those key templates that can be converted presently are:

{{[Key
Start](https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Key_Start "Vorlage:Key Start")}}
with
{{[Lead](https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead "Vorlage:Lead")}},
file examples:

-   <span class="download"><a
    href="https://species-id.net/o/media/d/df/Bestimmungsmatrix_Calamagrostis_wiki.infoflora.ch_%28Minimalbeispiel%29.ods"
    class="external text" target="_blank">Bestimmungsmatrix
    <em>Calamagrostis</em> (Minimalbeispiel).ods</a></span> (normal
    identification, a German version)
-   <span class="download"><a
    href="https://species-id.net/o/media/1/1e/Bestimmungsmatrix_Calamagrostis_wiki.infoflora.ch_%28Komplexbeispiel%29.ods"
    class="external text" target="_blank">Bestimmungsmatrix
    <em>Calamagrostis</em> (Komplexbeispiel).ods</a></span> (normal
    identification more complex, a German version)
-   <span class="download"><a
    href="https://species-id.net/o/media/7/7f/Bestimmungsmatrix_eingeschachtelt_%28nested%29_Calamagrostis_wiki.infoflora.ch_%28Minimalbeispiel%29.ods"
    class="external text" target="_blank">Bestimmungsmatrix eingeschachtelt
    <em>Calamagrostis</em> (Minimalbeispiel).ods</a> (special case for
    subspecies)</span>

{{[ImageSwitch](https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:ImageSwitch "Vorlage:ImageSwitch")}}

-   <span class="download"><a
    href="https://species-id.net/o/media/e/e7/Testfall_Minimalbeispiel_Excel2DecisionKeyTemplates_%28Beachexplorer_20141101_Tabelle_gesamt_8b%29.xls"
    class="external text" target="_blank">Testcase minimal example
    Excel2DecisionKeyTemplates (Beachexplorer 20141101)</a></span>
    (still in development)

For the converting process to work, it is necessary that the spreadsheet
fulfils some structural criteria according to the details discussed
below. If the data structure of the converting file is correct, than it
can be converted on the following special pages:

-   [Special:Convert spreadsheet file to key
    templates](https://wiki.infoflora.ch/swissflorawiki/de/Spezial:Datei_(Tabellenblatt)_in_Schl%C3%BCsselvorlagen_konvertieren "Spezial:Datei (Tabellenblatt) in Schlüsselvorlagen konvertieren")
-   [Special:Convert tab-separated file to key
    templates](https://wiki.infoflora.ch/swissflorawiki/de/Spezial:Datei_(Tab-getrennt)_in_Schl%C3%BCsselvorlagen_konvertieren "Spezial:Datei (Tab-getrennt) in Schlüsselvorlagen konvertieren")

  

<div id="toc" class="toc">


## Inhaltsverzeichnis


-   [<span class="tocnumber">1</span> <span class="toctext">Structure of
    a File for {{Key Start}} with
    {{Lead}}</span>](#Structure_of_a_File_for_.7B.7BKey_Start.7D.7D_with_.7B.7BLead.7D.7D)
    -   [<span class="tocnumber">1.1</span> <span class="toctext">Brief
        Example</span>](#Brief_Example)
    -   [<span class="tocnumber">1.2</span> <span class="toctext">Meta
        data for Identification Key in
        Detail</span>](#Meta_data_for_Identification_Key_in_Detail)
    -   [<span class="tocnumber">1.3</span> <span
        class="toctext">Columns of the Decision Key Matrix in
        Detail</span>](#Columns_of_the_Decision_Key_Matrix_in_Detail)
        -   [<span class="tocnumber">1.3.1</span> <span
            class="toctext">Modes of the
            Decision</span>](#Modes_of_the_Decision)
        -   [<span class="tocnumber">1.3.2</span> <span
            class="toctext">Columns of
            Determination</span>](#Columns_of_Determination)
        -   [<span class="tocnumber">1.3.3</span> <span
            class="toctext">Special
            Organism-Properties</span>](#Special_Organism-Properties)
        -   [<span class="tocnumber">1.3.4</span> <span
            class="toctext">Hidden
            Parameters</span>](#Hidden_Parameters)
-   [<span class="tocnumber">2</span> <span class="toctext">Structure of
    a file for
    {{ImageSwitch}}</span>](#Structure_of_a_file_for_.7B.7BImageSwitch.7D.7D)
    -   [<span class="tocnumber">2.1</span> <span class="toctext">Column
        parameters for {{ImageSwitch}} in
        Detail</span>](#Column_parameters_for_.7B.7BImageSwitch.7D.7D_in_Detail)
-   [<span class="tocnumber">3</span> <span class="toctext">Shortcut
    Writing and Emphasis
    (Typography)</span>](#Shortcut_Writing_and_Emphasis_.28Typography.29)
-   [<span class="tocnumber">4</span> <span class="toctext">Problems
    During
    Import</span>](#Problems_During_Import)
    -   [<span class="tocnumber">4.1</span> <span
        class="toctext">Couplet_ID_missing!</span>](#Couplet_ID_missing.21)

</div>

  

## <span id="Structure_of_a_File_for_.7B.7BKey_Start.7D.7D_with_.7B.7BLead.7D.7D" class="mw-headline">Structure of a File for {{[Key Start](https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Key_Start "Vorlage:Key Start")}} with {{[Lead](https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead "Vorlage:Lead")}}</span>

In general the data structure must look like:


<table class="wikitable vertical-align-top" style="border:0px none;">
<tbody><tr>
<td> meta_data_parameter </td>
<td> value </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
<td rowspan="3" > <small>The meta data are for the whole key.</small> </td></tr>
<tr>
<td> meta_data_parameter </td>
<td> value </td>
<td> </td>
<td> </td>
<td> </td>
<td>
</td></tr>
<tr>
<td> meta_data_parameter </td>
<td> value </td>
<td> </td>
<td> </td>
<td> </td>
<td>
</td></tr>
<tr>
<td> &lt;blank line&gt; </td>
<td>  &lt;blank line&gt; </td>
<td>  &lt;blank line&gt; </td>
<td>  &lt;blank line&gt; </td>
<td>  &lt;blank line&gt; </td>
<td>  &lt;blank line&gt;  </td>
<td> <small>The blank line marks the key area at the beginning</small> </td></tr>
<tr>
<td> column_parameter </td>
<td>  column_parameter </td>
<td>  column_parameter </td>
<td> column_parameter </td>
<td>  column_parameter </td>
<td>  column_parameter </td>
<td style="border:0px none;background-color:white;font-size:smaller;"> Every column labels a specific property for the identification matrix/the key decisions
</td></tr>
<tr>
<td> value </td>
<td> value </td>
<td> value </td>
<td>  </td>
<td>   </td>
<td> </td>
<td rowspan="4" style="border:0px none;background-color:white;font-size:smaller;"> Decision key data follow row by row. One row is a decision alternative in a decision. All values for the decision alternative <i>must be kept in that line</i>.
</td></tr>
<tr>
<td> value </td>
<td> value </td>
<td> value </td>
<td>  </td>
<td>   </td>
<td>
</td></tr>
<tr>
<td> value </td>
<td> value </td>
<td>  </td>
<td> value </td>
<td> value  </td>
<td>
</td></tr>
<tr>
<td> value </td>
<td> value </td>
<td>  </td>
<td> value </td>
<td> value  </td>
<td>
</td></tr></tbody></table>

### <span id="Brief_Example" class="mw-headline">Brief Example</span>

In this brief example, the decision key alternatives are created by the
index numbers of
[`decision_number`](#Parameter_decision_number)
and `decision_alternative_number`. And also in the meta data part it was
specified, that all decision alternatives shall have a star symbol
(`decision_alternative_code` with `number & *` as value), so the
decision alternatives become automatically e.g. “2”, “2\*”, “2\*\*”,
“2\*\*\*”. The example comes from [Datei:Bestimmungsmatrix Calamagrostis
wiki.infoflora.ch
(Minimalbeispiel).ods](https://wiki.infoflora.ch/swissflorawiki/de/Datei:Bestimmungsmatrix_Calamagrostis_wiki.infoflora.ch_(Minimalbeispiel).ods "Datei:Bestimmungsmatrix Calamagrostis wiki.infoflora.ch (Minimalbeispiel).ods").

<div
style="overflow:scroll;height:300px;padding:1em;border:2px gray inset;">

| col01                       | col02                       | col03                                                    | col04                | col05                                                                                   | col06                 | col07        | col08                                             | col09                                    | col10             | col11           | col12                 | col13               | col14                           |
|-----------------------------|-----------------------------|----------------------------------------------------------|----------------------|-----------------------------------------------------------------------------------------|-----------------------|--------------|---------------------------------------------------|------------------------------------------|-------------------|-----------------|-----------------------|---------------------|---------------------------------|
| title                       | ''Calamagrostis''           |                                                          |                      |                                                                                         |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| creators                    | Stefan Eggenberg            |                                                          |                      |                                                                                         |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| geoscope                    | Swiss                       |                                                          |                      |                                                                                         |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| taxon_name                  | Calamagrostis               |                                                          |                      |                                                                                         |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| common_names                | small reed, reed grass      |                                                          |                      |                                                                                         |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| taxon_rank_code             | gen                         |                                                          |                      |                                                                                         |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| category                    | Flora                       |                                                          |                      |                                                                                         |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| decisions_alternative_codes | number & \*                 |                                                          |                      |                                                                                         |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
|                             |                             |                                                          |                      |                                                                                         |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| decision_number             | decision_alternative_number | decision_alternative_text                                | next_decision_number | primary_media_1                                                                         | label_primary_media_1 | infoflora_id | scientific_name                                   | description                              | plant_height_from | plant_height_to | flowering_period_from | flowering_period_to | floristic_zones                 |
| 1                           | 1                           | Awn stands out of the spikelet distinctively (Fig. 1a).  | 2                    | File:Glume detail of Calamagrostis varia (Schrad.) Host (×7), Dryades TSB17713.jpg      | 1a                    |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| 1                           | 2                           | Awn not or barely standing out of the spikelet (Fig 1b). | 3                    | File:Glume detail of Calamagrostis villosa (Chaix) J.F.Gmel. (×5), Dryades TSB17718.jpg | 1b                    |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| 2                           | 1                           | Leaf monochrome: on both sides faint blue-green…         |                      |                                                                                         |                       | 2967         | Calamagrostis varia (Schrad.) Host                | Plant blue-green, stolons form herds     | 60                | 120             | 7                     | 8                   | European                        |
| 2                           | 2                           | Leaf bicolored: on the upper side, somet…                |                      |                                                                                         |                       | 2968         | Calamagrostis arundinacea (L.) Roth               | Plant blue- to fresh-green, tuft-like, … | 60                | 150             | 7                     | 8                   | Eurosiberian                    |
| 3                           | 1                           | Leaf distinctively glossy on the underside. The …        | 4                    |                                                                                         |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| 3                           | 2                           | Leaf non-glossy on both sides. Lemma 3- or               | 5                    |                                                                                         |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| 4                           | 1                           | Leaves limp. Awn is definite visib…                      |                      |                                                                                         |                       | 2971         | Calamagrostis villosa (Chaix) J. F. Gmel.         | Plant fresh- to dark-green. Leaves …     | 60                | 150             | 7                     | 8                   | middle- and south-European      |
| 4                           | 2                           | Leaves stiff upright. Awn short, unrema…                 |                      |                                                                                         |                       | 2970         | Calamagrostis canescens (F. H. Wigg.) Roth        | Plant blue-green, stalk stiff upright …  | 60                | 150             | 6                     | 7                   | Eurosiberian                    |
| 5                           | 1                           | Ligule of upper leaves of the stalk only…                |                      |                                                                                         |                       | 2969         | Calamagrostis stricta (Timm) Koeler               | Plant dark-green, forming tufts, stalk…  | 30                | 100             | 7                     | 8                   | Holarctic                       |
| 5                           | 2                           | Ligule of upper leaves of the stalk 4 to 1…              | 6                    |                                                                                         |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| 6                           | 1                           | Hairs at the base lemma nearly as long…                  |                      | File:Example.jpg                                                                        |                       | 6334         | Calamagrostis phragmitoides Hartm.                | Plant gray-green, forming tufts, stalks… | 80                | 200             | 6                     | 8                   | North-European to West-Siberian |
| 6                           | 2                           | Hairs at the base lemma definitely…                      |                      | File:Example.jpg                                                                        |                       |              |                                                   |                                          |                   |                 |                       |                     |                                 |
| 7                           | 1                           | Plant fresh-green. Both grass glumes …                   |                      |                                                                                         |                       | 2972         | Calamagrostis epigejos (L.) Roth                  | Is forming herds by long runners, …      | 60                | 150             | 7                     | 8                   | Euroasian                       |
| 7                           | 2                           | Plant blue-green. Upper grass glume only 7…              |                      |                                                                                         |                       | 2973         | Calamagrostis pseudophragmites (Haller f.) Koeler | Is forming herds by long runners, …      | 50                | 150             | 7                     | 8                   | Euroasian                       |

</div>

### <span id="Meta_data_for_Identification_Key_in_Detail" class="mw-headline">Meta data for Identification Key in Detail</span>

First of all the meta data for the whole key have to be specified in the
spreadsheet. The *first* data cell denotes the parameter.

**Mandatory parameters are bold**, *recommended parameters are italic*
and optional parameters are normal, <span
style="text-decoration: dotted underline;">dotted underline</span>
corresponds to the default use case.

<table class="wikitable vertical-align-top">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr class="header">
<th>meta_data_parameter</th>
<th>Example Value</th>
<th>{{<a
href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Key_Start"
title="Vorlage:Key Start">Key Start</a>}}<br />
Template Parameter</th>
<th>Comment</th>
</tr>

<tr class="odd">
<td>id</td>
<td>campanula1</td>
<td>(analogue)</td>
<td>Key ID. Only needed, if multiple keys are on one page.</td>
</tr>
<tr class="even">
<td><em>title</em></td>
<td>&lt;i&gt;Campaula&lt;/i&gt;</td>
<td>(analogue)</td>
<td>Title of the key itself (not of the page title!)</td>
</tr>
<tr class="odd">
<td>language</td>
<td>de</td>
<td>(analogue)</td>
<td>ISO language code</td>
</tr>
<tr class="even">
<td><em>geoscope</em></td>
<td>Germany</td>
<td>(analogue)</td>
<td>geological scope (semantic data: <a
href="https://wiki.infoflora.ch/swissflorawiki/de/Attribut:Dcterms:spatial"
title="Attribut:Dcterms:spatial">Attribut:dcterms:spatial</a>)</td>
</tr>
<tr class="odd">
<td>audience</td>
<td>pupils</td>
<td>(analogue)</td>
<td>The target audience (semantic data: <a
href="https://wiki.infoflora.ch/swissflorawiki/de/Attribut:Dcterms:audience"
title="Attribut:Dcterms:audience">Attribut:dcterms:audience</a>)</td>
</tr>
<tr class="even">
<td>description</td>
<td></td>
<td>(analogue)</td>
<td>Free text, that has some more information supplementary to the title
(semantic data: <a
href="https://wiki.infoflora.ch/swissflorawiki/de/Attribut:Dc:description"
title="Attribut:Dc:description">Attribut:dc:description</a>)</td>
</tr>
<tr class="odd">
<td>taxon_treatment_public_comment</td>
<td></td>
<td>taxon treatment public comment</td>
<td>Comment</td>
</tr>
<tr class="even">
<td>publicity</td>
<td>Deutscher Jugendbund für Naturbeobachtung (German Youth Association
for Observation of Nature)</td>
<td>(analogue)</td>
<td>Own publicity or internet page of the author</td>
</tr>
<tr class="odd">
<td>rating</td>
<td>4</td>
<td>(analogue)</td>
<td>1 … 5: 0 = missing, 1 = worst rating, 5 = best rating (semantic
data: <a
href="https://wiki.infoflora.ch/swissflorawiki/de/Attribut:Xmp:Rating"
title="Attribut:Xmp:Rating">Attribut:xmp:Rating</a>)</td>
</tr>
<tr class="even">
<td>recommendation_group</td>
<td>”plant identification (advanced)”<br />
or<br />
“request for contribution!”</td>
<td>recommendation group</td>
<td>a class term for recommendation (<a
href="https://wiki.infoflora.ch/swissflorawiki/de/Attribut:Recommendation_group"
title="Attribut:Recommendation group">Attribut:recommendation
group</a>)</td>
</tr>
<tr class="odd">
<td><em>taxon_name</em></td>
<td>Campaula</td>
<td>taxon name</td>
<td>taxon name of the group, the genus</td>
</tr>
<tr class="even">
<td><em>common_names</em></td>
<td>bellflower</td>
<td>common names</td>
<td>common names (can be a comma , separated list)</td>
</tr>
<tr class="odd">
<td>taxon_rank_code</td>
<td>sp</td>
<td>taxon rank code</td>
<td>Taxonomic rank as code: gen, fam, subfam, sp</td>
</tr>
<tr class="even">
<td>source</td>
<td>Key modified after Schubert &amp; Vent (1982)</td>
<td>(analogue)</td>
<td>related published source(s), used literature data</td>
</tr>
<tr class="odd">
<td>collaboration_limited_to</td>
<td></td>
<td>collaboration limited to</td>
<td>limit collaboration to a list of authors (can be a comma , separated
list). If empty then it is considered to be an <em>open
collaboration</em></td>
</tr>
<tr class="even">
<td>status</td>
<td></td>
<td>(analogue)</td>
<td>state of editing</td>
</tr>
<tr class="odd">
<td><strong>creators</strong></td>
<td></td>
<td>(analogue)</td>
<td>author(s) (semantic data: <a
href="https://wiki.infoflora.ch/swissflorawiki/de/Attribut:Dc:creator"
title="Attribut:Dc:creator">Attribut:dc:creator</a>)</td>
</tr>
<tr class="even">
<td>initiated_by</td>
<td></td>
<td>initiated by</td>
<td>initiators, that do not want to be cited</td>
</tr>
<tr class="odd">
<td><em>contributors</em></td>
<td></td>
<td>(analogue)</td>
<td>contributors, can be a comma-separated list (semantic data: <a
href="https://wiki.infoflora.ch/swissflorawiki/de/Attribut:Dc:contributor"
title="Attribut:Dc:contributor">Attribut:dc:contributor</a>)</td>
</tr>
<tr class="even">
<td>general_review_by</td>
<td></td>
<td>general review by</td>
<td>general review done by someone</td>
</tr>
<tr class="odd">
<td>nomreview_by</td>
<td></td>
<td>nomreview by</td>
<td>nomenclature review done by someone</td>
</tr>
<tr class="even">
<td>expert_review_by</td>
<td></td>
<td>expert review by</td>
<td>(taxonomical) review by someone</td>
</tr>
<tr class="odd">
<td><em>parent_taxon</em></td>
<td></td>
<td>parent taxon</td>
<td>the taxon that is a parent taxon to this key</td>
</tr>
<tr class="even">
<td>parent_key</td>
<td></td>
<td>parent key</td>
<td>the parent key page</td>
</tr>
<tr class="odd">
<td>parent_key_text</td>
<td></td>
<td>parent key text</td>
<td>another display text other than of “parent key”</td>
</tr>
<tr class="even">
<td><em>category</em></td>
<td>Flora</td>
<td>(analogue)</td>
<td>Flora or Fauna (, list). A category for this key.</td>
</tr>
<tr class="odd">
<td>icon</td>
<td>File:My_great_icon.jpg</td>
<td>(analogue)</td>
<td>icon name (will be sized to 40x40px)</td>
</tr>
<tr class="even">
<td><em>decisions_alternative_codes</em> <span
id="globaler_Parameter_decisions_alternative_codes"
style="visibility:hidden"></span><br />
(<del>decision_alternative_code</del>)</td>
<td><span style="text-decoration: dotted underline;">number</span><br />
<span style="text-decoration: dotted underline;">number &amp;
-</span><br />
number &amp; '<br />
number &amp; ’<br />
number &amp; *<br />
a-z<br />
a-z &amp; -<br />
a-z &amp; '<br />
a-z &amp; ’<br />
a-z &amp; *<br />
or<br />
A-Z<br />
A-Z &amp; -<br />
A-Z &amp; '<br />
A-Z &amp; ’<br />
A-Z &amp; *<br />
</td>
<td>-</td>
<td>(default: number &amp; -) Switch for all decision alternatives: how
to display the decision alternatives of the whole key. It becomes for
instance “2, 2*, 2**”. If this parameter is not set at all, the standard
display is the decision number followed by an em-dash, the Wiki code “2,
2-, 2-” becomes in the key “2, —, — ”.<br />
Alternatively, the author of the key <em>must</em> input this
information by himself correctly into the decision columns
<code>decision_code</code> and
<code>decision_alternative_code</code>.<br />
number and number &amp; -results in 1, —, —, 2, —, —<br />
number &amp; ' results in 1, 1', 1''<br />
number &amp; ’ results in 1, 1’, 1’’<br />
number &amp; * results in 1, 1*, 1**<br />
analogue for a-z (lower case letter) or A-Z (upper case letters)</td>
</tr>
<tr class="odd">
<td>nested_decisions_alternative_codes <span
id="globaler_Parameter_nested_decisions_alternative_codes"
style="visibility:hidden"></span></td>
<td><span style="text-decoration: dotted underline;">a-z</span><br />
<span style="text-decoration: dotted underline;">a-z &amp;
-</span><br />
a-z &amp; '<br />
a-z &amp; ’<br />
a-z &amp; *<br />
A-Z<br />
A-Z &amp; -<br />
A-Z &amp; '<br />
A-Z &amp; ’<br />
A-Z &amp; *<br />
number<br />
number &amp; -<br />
number &amp; '<br />
number &amp; ’<br />
or<br />
number &amp; *<br />
</td>
<td>-</td>
<td>(default: a-z &amp; -) Switch for the nested mode within a
decision_alternative (corresponds in to {{<a
href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>}}: nested, parentlead), e.g. for the
determination of sub-species after a decision alternative. If this is
not set at all, the standard output is an alphabetical code following an
“—” (emdash). For instance if the last decision alternative of the Wiki
output was “2*” and a sub-species is further described in the key in the
nested mode, then the output will be “a, —, —” (first decision
alternative) then “b, —” (second decision alternative) then “c, —, —”
(third decision alternative) etc.. Other possible layout variants
are:<br />
a-z or a-z &amp; - results in a, —, —<br />
a-z &amp; ' results in a, a', a''<br />
a-z &amp; ’ results in a, a’, a’’<br />
a-z &amp; * results in a, a*, a**<br />
analogue for A-Z (upper case) and number (in numbers)</td>
</tr>
<tr class="even">
<td><em>add_decision_backlinks</em></td>
<td><span style="text-decoration: dotted underline;">1</span></td>
<td>-</td>
<td>(default: 1) Switch for showing backward links to the previous
decision. This parameter is only for the converting process. A normal
backward link to a decision number “2” is created in the template by
{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|5 (2)=…}}.</td>
</tr>
<tr class="odd">
<td><strong>&lt;blank cell&gt;</strong></td>
<td><strong>&lt;blank cell&gt;</strong></td>
<td>-</td>
<td>actually a whole blank line marks the ending of all meta data and
the beginning of the decision key data</td>
</tr>
</tbody>
</table>

### <span id="Columns_of_the_Decision_Key_Matrix_in_Detail" class="mw-headline">Columns of the Decision Key Matrix in Detail</span>

#### <span id="Modes_of_the_Decision" class="mw-headline">Modes of the Decision</span>

After the meta data, and a following closing blank line, the area of the
decision key matrix begins. This decision key matrix starts with a line
of decision key columns and continues by the decision alternatives row
by row. Each of these alternatives is located in *one* spreadsheet line.
Custom columns can be labelled in the spreadsheet too, these interfere
not during conversion and are being ignored. There are two modes in
determination, the normal mode—decision and decision alternative—and the
nested mode—also decision and decision alternatives, but nested *into*
one previous decision alternative. To make it clear, now a comparison of
the two modes in the determination process:

<table class="vertical-align-top">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="header">
<th>Normal Mode of Determination</th>
<th><em>Nested</em> Mode of Determination</th>
</tr>

<tr class="odd">
<td style="width: 350px"><pre><code>decision
├ decision_alternative
├ decision_alternative
└ decision_alternative
decision
├ decision_alternative
├ decision_alternative
└ decision_alternative</code></pre>
<p>There are only decisions with their decision alternatives.</p></td>
<td style="width: 350px"><pre><code>decision
├ decision_alternative
├ decision_alternative
│ ├ nested_decision              
│ │ ├ nested_decision_alternative
│ │ ├ nested_decision_alternative
│ │ └ nested_decision_alternative
│ └ nested_decision              
│   ├ nested_decision_alternative
│   ├ nested_decision_alternative
│   └ nested_decision_alternative
└ decision_alternative
decision
├ decision_alternative
├ decision_alternative
└ decision_alternative</code></pre>
<p>Into a “normal” decision alternative there are nested additional
decisions, for instance to differentiate sub-species. The nested
determination shall come to an end point of the determination (of
sub-species), whereas the other “normal” decisions or decision
alternatives can be continued.</p></td>
</tr>
</tbody>
</table>

#### <span id="Columns_of_Determination" class="mw-headline">Columns of Determination</span>

Columns of determination that can be used in the conversion process, are
detailed as follows, columns of determination that are **mandatory are
in bold** and optional columns are in normal font. To avoid
complications during conversion *delete empty columns of determination
that are completely empty*. However, custom named columns that are not
columns of determination should not interfere during conversion.

<table class="wikitable sortable vertical-align-top jquery-tablesorter">
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Column Header<br />
for Determination Matrix</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Type</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Example Value</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Template Parameter<br />
(Correspondence)</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Comment</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>decision_number</strong><span id="Parameter_decision_number"
style="visibility:hidden"></span></td>
<td>ID decision</td>
<td>2</td>
<td>{{Lead | 2 | … }}</td>
<td><em>Only a number</em>. Index-number of a decision (e.g. 2) that
spans multiple decision alternatives (index-number is the “2” in 2<span
class="comment-gray">a</span>, 2<span class="comment-gray">b</span>,
2<span class="comment-gray">c</span> or 2 in 2<span
class="comment-gray">—</span>, 2<span class="comment-gray">—</span> or 2
in 2<span class="comment-gray">*</span>, 2<span
class="comment-gray">**</span>)</td>
</tr>
<tr class="even">
<td><strong>decision_alternative_number</strong></td>
<td>ID decision alternative</td>
<td>1</td>
<td></td>
<td><em>Only a number</em>. Index-number within a decision (<a
href="#Parameter_decision_number"><code>decision_number</code></a>),
in a way it specifies the order of alternatives (<a
href="#Parameter_alternative_text"><code>decision_alternative_text</code></a>)
on a number basis.</td>
</tr>
<tr class="odd">
<td>next_decision_number</td>
<td>ID decision</td>
<td>5</td>
<td></td>
<td><em>Only a number</em>. The next index number of the decision. Has
no correspondence in {{<a
href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>}}.</td>
</tr>
<tr class="even">
<td>decision_code</td>
<td>ID decision</td>
<td>2<br />
or<br />
A<br />
or<br />
II</td>
<td>{{Lead | A | … }}</td>
<td><em>Number or letter</em>. Actual display of a decision. If
specified, then the author himself must manage the correct values; this
overrides <a
href="#Parameter_decision_number"><code>decision_number</code></a>.</td>
</tr>
<tr class="odd">
<td>next_decision_code</td>
<td>‎ID decision</td>
<td>5 or B or IV</td>
<td>{{Lead | 1 | Text | <strong>5</strong> }}</td>
<td><em>Number or letters</em>. Actual display of the next decision,
points to the next <code>decision_code</code>. It is not recommended to
use this parameter, because the author himself has to manage the correct
values; this overrides <a
href="#Parameter_decision_number"><code>decision_number</code></a>.
Alternative: fill only columns <code>decision_number</code> and
<code>next_decision_number</code> and if needed, alter the layout via
switch <a
href="#globaler_Parameter_decisions_alternative_codes"><code>decisions_alternative_codes</code></a>
in thee meta data section.</td>
</tr>
<tr class="even">
<td>decision_alternative_code</td>
<td>ID decisionsalternative</td>
<td>a<br />
or<br />
'<br />
or<br />
*</td>
<td>{{Lead | 2<em><strong>a</strong></em> | … }}</td>
<td><em>Character or letter</em>. It is not recommended practice to use
this parameter, because the <em>author himself</em> must manage the
correct values, this overrides <a
href="#Parameter_decision_number"><code>decision_number</code></a>.
Alternative: fill only columns <code>decision_number</code> and
<code>next_decision_number</code> and if needed, alter the layout via
switch <a
href="#globaler_Parameter_decisions_alternative_codes"><code>decisions_alternative_codes</code></a>
in thee meta data section.</td>
</tr>
<tr class="odd">
<td>nested_decision_number</td>
<td>ID nested</td>
<td>0<br />
or<br />
1<br />
or<br />
3</td>
<td></td>
<td><em>Only a number (starts with 0)</em>. Index-number of the decision
for thee nested mode. For explanation: a decision comprises of multiple
decision alternatives. The nested mode (nested/parentlead in the
template) continues within a single “normal” decision alternative. At
thee line where thee nested mode has to start, the index <em>has to
be</em> 0. In the following lines just increment thee index. Multiple
decision alternatives that shall belong to the same decision must have
thee same index number.</td>
</tr>
<tr class="even">
<td>nested_decision_alternative_number</td>
<td>ID nested</td>
<td>1</td>
<td>{{Lead | nested=a | … }}<br />
{{Lead | parentlead=2* | a | … }}</td>
<td><em>Only a number</em>. Index-number of the decision alternative in
the nested mode. To elaborate on this: a decision alternative is part of
a decision. The nested mode (in the template: nested/parentlead) is
continued within a single “normal” decision alternative. (After
conversion it will become a letter, you can modify this by the global
key-property <a
href="#globaler_Parameter_nested_decisions_alternative_codes"><code>nested_decisions_alternative_codes</code></a>)</td>
</tr>
<tr class="odd">
<td>next_nested_decision_number</td>
<td>ID nested</td>
<td>2</td>
<td>{{Lead | parentlead=2* | … | b}}</td>
<td><em>Only a number</em>. The next index number of a nested decision.
After conversion it will become a letter, you can modify this by the
global key-property <a
href="#globaler_Parameter_nested_decisions_alternative_codes"><code>nested_decisions_alternative_codes</code></a>.</td>
</tr>
<tr class="even">
<td><strong>decision_alternative_text</strong><span
id="Parameter_alternative_text" style="visibility:hidden"></span></td>
<td>text of identification</td>
<td></td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a> | …| text of identification,
question}}</td>
<td><em>free text</em>. The very text of identification or the
question.</td>
</tr>
<tr class="odd">
<td>remarks</td>
<td>additional info (general)</td>
<td></td>
<td>{{Lead | … | remarks= }}</td>
<td><em>Free text</em>. Remarks (used for taxon treatment public
comment) including historical information or human uses; tips on how to
recall characters more easily etc.</td>
</tr>
<tr class="even">
<td>occurrence</td>
<td>additional info (general)</td>
<td></td>
<td>{{Lead | … | occurrence= }}</td>
<td><em>Free text</em>. Text related to occurrence, geography, habitat
if other parameters can not describe sufficiently.</td>
</tr>
<tr class="odd">
<td>description</td>
<td>additional info (general)</td>
<td></td>
<td>{{Lead | … | description= }}</td>
<td><em>Free text</em>. Additional description, if other parameters
describe not sufficiently.</td>
</tr>
<tr class="even">
<td>references</td>
<td>additional info (general)</td>
<td>Aeschimann D. (2003); Duvoisin, J. (2015)</td>
<td><code>references</code></td>
<td>Literature references</td>
</tr>
<tr class="odd">
<td>result_link</td>
<td>result</td>
<td>The sedges in Brandenburg (Max Müller)</td>
<td>{{Lead | … | result= }}</td>
<td>Different page link or external URL (http://…). Overrides display
from <code>scientific_name</code></td>
</tr>
<tr class="even">
<td>result_text</td>
<td>result</td>
<td></td>
<td>{{Lead | … | result text= }}</td>
<td>overrides display text of result_link as well as the display from
<code>scientific_name</code></td>
</tr>
<tr class="odd">
<td>result_id</td>
<td>result</td>
<td></td>
<td>{{Lead | … | result id= }}</td>
<td>Point of result. An important identifier for the author. When a
species page follows. Arbitrary ID, proposal: a prefix directly followed
by an ID, e.g. BExID:123942. There can be only <em>one</em> ID.</td>
</tr>
<tr class="even">
<td>checklist_id</td>
<td>result</td>
<td></td>
<td>{{Lead | … | result id list= }}</td>
<td>Point of result. An important identifier for the author is added to
<code>result id list</code>, converted to a &lt;span&gt;-tag, presently
a <a
href="#stummer_Parameter">hidden
parameter</a>.</td>
</tr>
<tr class="odd">
<td>florahelvetica_id</td>
<td>result</td>
<td></td>
<td>{{Lead | … | result id list= }}</td>
<td>Point of result. An important identifier for the author is added to
<code>result id list</code>, converted to a &lt;span&gt;-tag: <code
style="color:gray">&lt;span class="show" data-term="florahelvetica_id" data-prefix="FH"&gt;2013479&lt;/span&gt;</code>
gets displayed as “FH 2013479” via CSS-layout-rules (<a
href="https://wiki.infoflora.ch/swissflorawiki/de/MediaWiki:Common.css"
title="MediaWiki:Common.css">MediaWiki:Common.css</a>).</td>
</tr>
<tr class="even">
<td>infoflora_id</td>
<td>result</td>
<td></td>
<td>{{Lead | … | result id list= }}</td>
<td>Point of result. An important identifier for the author is added to
<code>result id list</code>, converted to a &lt;span&gt;-tag, presently
a <a
href="#stummer_Parameter">hidden
parameter</a>.</td>
</tr>
<tr class="odd">
<td>isfs_id</td>
<td>result</td>
<td></td>
<td>{{Lead | … | result id list= }}</td>
<td>Point of result. An important identifier for the author is added to
<code>result id list</code>, converted to a &lt;span&gt;-tag, presently
a <a
href="#stummer_Parameter">hidden
parameter</a>.</td>
</tr>
<tr class="even">
<td>scientific_name</td>
<td>result</td>
<td></td>
<td>{{Lead | scientific name= | … }}</td>
<td>Point of result. When a species page follows.</td>
</tr>
<tr class="odd">
<td>scientific_name_synonyms</td>
<td>result</td>
<td></td>
<td>{{Lead | … | synonyms= }}</td>
<td>Point of result (list with ; semicolon)</td>
</tr>
<tr class="even">
<td>common_names</td>
<td>result</td>
<td></td>
<td>{{Lead | common names= | … }}</td>
<td>Point of result (list with , comma)</td>
</tr>
<tr class="odd">
<td>decision_heading</td>
<td>result</td>
<td>Ascomycota</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a> | …|subheading= Ascomycota}}</td>
<td><em>Free text</em>. A sub heading, to mark a section</td>
</tr>
<tr class="even">
<td>primary_media_1<br />
…<br />
primary_media_5</td>
<td>media</td>
<td>File:Example.jpg</td>
<td><code>image a</code><br />
…<br />
<code>image e</code></td>
<td>Marginal image (always visible) up to 5</td>
</tr>
<tr class="odd">
<td>caption_primary_media_1<br />
…<br />
caption_primary_media_5</td>
<td>media</td>
<td></td>
<td><code>caption a</code><br />
…<br />
<code>caption e</code></td>
<td>image caption</td>
</tr>
<tr class="even">
<td>label_primary_media_1<br />
…<br />
label_primary_media_5</td>
<td>media</td>
<td>3a</td>
<td><code>label a</code><br />
…<br />
<code>label e</code></td>
<td>label of a figure (needed only for text reference)</td>
</tr>
<tr class="odd">
<td>primary_media_width<br />
primary_media_height</td>
<td>media</td>
<td>100</td>
<td><code>primary images width</code><br />
<code>primary images height</code></td>
<td>Width, height of all marginal images (default: 80, 80 as height,
width)</td>
</tr>
<tr class="even">
<td>primary_media_1_width<br />
…<br />
primary_media_5_width<br />
<br />
primary_media_1_height<br />
…<br />
primary_media_5_height</td>
<td>media</td>
<td>100</td>
<td><code>image a width</code><br />
…<br />
<code>image e width</code><br />
<br />
<code>image a height</code><br />
…<br />
<code>image e height</code></td>
<td>Width, height of individual marginal images (default: 80, 80 as
height, width)</td>
</tr>
<tr class="odd">
<td>large_primary_media_1<br />
…<br />
large_primary_media_2</td>
<td>media</td>
<td>File:Example.jpg</td>
<td><code>image j</code><br />
…<br />
<code>image k</code></td>
<td>large image (always visible) up to 2</td>
</tr>
<tr class="even">
<td>caption_large_primary_media_1<br />
…<br />
caption_large_primary_media_2</td>
<td>media</td>
<td></td>
<td><code>caption j</code><br />
…<br />
<code>caption k</code></td>
<td>image caption</td>
</tr>
<tr class="odd">
<td>label_large_primary_media_1<br />
…<br />
label_large_primary_media_2</td>
<td>media</td>
<td>5b</td>
<td><code>label j</code><br />
…<br />
<code>label k</code></td>
<td>label of a figure (needed only for text reference)</td>
</tr>
<tr class="even">
<td>large_primary_media_1_width<br />
large_primary_media_1_height<br />
<br />
large_primary_media_2_width<br />
large_primary_media_2_height</td>
<td>media</td>
<td>300</td>
<td><code>image j width</code><br />
<code>image j height</code><br />
<br />
<code>image k height</code><br />
<code>image k height</code></td>
<td>Width, height of individual large images (default: 400, 600 as
height, width)</td>
</tr>
<tr class="odd">
<td>collapsed_media_1<br />
…<br />
collapsed_media_6</td>
<td>media</td>
<td>File:Example.jpg</td>
<td><code>image m</code><br />
…<br />
<code>image r</code></td>
<td>large image (always visible) up to 6</td>
</tr>
<tr class="even">
<td>caption_collapsed_media_1<br />
…<br />
caption_collapsed_media_6</td>
<td>media</td>
<td></td>
<td><code>caption m</code><br />
…<br />
<code>caption r</code></td>
<td>image caption</td>
</tr>
<tr class="odd">
<td>label_collapsed_media_1<br />
…<br />
label_collapsed_media_6</td>
<td>media</td>
<td>5a</td>
<td><code>label m</code><br />
…<br />
<code>label r</code></td>
<td>label of a figure (needed only for text reference)</td>
</tr>
<tr class="even">
<td>collapsed_media_width<br />
collapsed_media_height</td>
<td>media</td>
<td>150</td>
<td><code>extra images width</code><br />
<code>extra images height</code></td>
<td>Width, height of all hidden images (default: 200)</td>
</tr>
<tr class="odd">
<td>collapsed_media_1_width<br />
…<br />
collapsed_media_5_width<br />
<br />
collapsed_media_1_height<br />
…<br />
collapsed_media_5_height</td>
<td>media</td>
<td>150</td>
<td><code>image m width</code><br />
…<br />
<code>image r width</code><br />
<br />
<code>image m height</code><br />
…<br />
<code>image r height</code></td>
<td>Width, height of induvidual hidden images (default: 200)</td>
</tr>
<tr class="even">
<td>collapsed_media_captionlines</td>
<td>media</td>
<td>6</td>
<td><code>captionlines</code></td>
<td>Integer. Approximate number of caption lines (default: 3)</td>
</tr>
</tbody>
</table>

  

#### <span id="Special_Organism-Properties" class="mw-headline">Special Organism-Properties</span>

<table class="wikitable sortable vertical-align-top jquery-tablesorter">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Column Header</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Example Value</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Template Parameter<br />
(Correspondence)</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Comment</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>plant_height</td>
<td>10-30 cm<br />
or<br />
10-30(-50) cm<br />
(1.2-)2.5-3.0(5.1) m</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|plant height=string}}</td>
<td>Special size: height(s) of plant growth. Avoid using this and use
instead the height of plant growth that is split up (in
plant_height_min, …from, …to, …max)
<ul>
<li>only numbers, minus and curved brackets () <em>including the
unit</em>. Minimum/Maximum in brackets before (5-) or behind (-50)</li>
</ul></td>
</tr>
<tr class="even">
<td>plant_height_min</td>
<td>5</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|plant height formula
min-from-to-max-unit=formula}}</td>
<td>Special size: minimum limit of the growth height of the plant. For
size input being split up, replaces and overrides plant_height. This is
translated into a formula. The formula is for instance as follows:
“NA/20/50/120/cm” and means “min/from/to/max/unit”. Empty values will be
translated into NA (NA=not available).</td>
</tr>
<tr class="odd">
<td>plant_height_from</td>
<td>7</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|plant height formula
min-from-to-max-unit=formula}}</td>
<td>Special size: lower limit of the growth height of the plant. For
size input being split up, replaces and overrides plant_height. This is
translated into a formula. The formula is for instance as follows:
“NA/20/50/120/cm” and means “min/from/to/max/unit”. Empty values will be
translated into NA (NA=not available).</td>
</tr>
<tr class="even">
<td>plant_height_to</td>
<td>9</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|plant height formula
min-from-to-max-unit=formula}}</td>
<td>Special size: upper limit of the plant growth height. For size input
being split up, replaces and overrides plant_height. This is translated
into a formula. The formula is for instance as follows:
“NA/20/50/120/cm” and means “min/from/to/max/unit”. Empty values will be
translated into NA (NA=not available).</td>
</tr>
<tr class="odd">
<td>plant_height_max</td>
<td>14</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|plant height formula
min-from-to-max-unit=formula}}</td>
<td>Special size: maximum limit of the growth height of the plant. For
size input being split up, replaces and overrides plant_height. This is
translated into a formula. The formula is for instance as follows:
“NA/20/50/120/cm” and means “min/from/to/max/unit”. Empty values will be
translated into NA (NA=not available).</td>
</tr>
<tr class="even">
<td>plant_height_unit</td>
<td>mm<br />
or<br />
m</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|plant height formula
min-from-to-max-unit=…}}</td>
<td><em>Default: cm</em>. This is translated into a formula. The formula
is for instance as follows: “NA/20/50/120/cm” and means
“min/from/to/max/unit”.</td>
</tr>
<tr class="odd">
<td>plant_height_comment</td>
<td></td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|plant height comment=…}}</td>
<td>Comment to plant hight</td>
</tr>
<tr class="even">
<td>organism_size</td>
<td>10-30 cm<br />
or<br />
10-30(-50) cm<br />
(1.2-)2.5-3.0(5.1) m</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|organism size=string}}</td>
<td>General size, if no other precise derivation is possible, whether
height, length or width is meant. Because this parameter should include
the complete sizes <em>including the unit</em>, but is difficult to
parse technically, it is recommended to avoid this parameter but use the
sizes split up (into organism_size_min, …from, …to, …max). If it is
known that this size describes e.g. height at flowering time, then don‘t
use this parameter but prefer the special height size plant_height or
even better split up the data into plant_height_min, plant_height_from,
plant_height_to etc..
<ul>
<li>only numbers, minus and curved brackets <em>including the unit</em>.
Minimum/maximum in brackets before (5-) or behind (-50)</li>
</ul></td>
</tr>
<tr class="odd">
<td>organism_size_min</td>
<td>5</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|organism size formula
min-from-to-max-unit=formula}}</td>
<td>General size. Minimum limit of the organism size, replaces and
overrides organism_size. This is translated into a formula. The formula
is for instance as follows: “NA/20/50/120/cm” and means
“min/from/to/max/unit”. Empty values will be translated into NA (NA=not
available).</td>
</tr>
<tr class="even">
<td>organism_size_from</td>
<td>7</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|organism size formula
min-from-to-max-unit=formula}}</td>
<td>General size. Lower limit of the organism size, replaces and
overrides organism_size. This is translated into a formula. The formula
is for instance as follows: “NA/20/50/120/cm” and means
“min/from/to/max/unit”. Empty values will be translated into NA (NA=not
available).</td>
</tr>
<tr class="odd">
<td>organism_size_to</td>
<td>9</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|organism size formula
min-from-to-max-unit=formula}}</td>
<td>General size. Upper limit of the organism size, replaces and
overrides organism_size. This is translated into a formula. The formula
is for instance as follows: “NA/20/50/120/cm” and means
“min/from/to/max/unit”. Empty values will be translated into NA (NA=not
available).</td>
</tr>
<tr class="even">
<td>organism_size_max</td>
<td>14</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|organism size formula
min-from-to-max-unit=formula}}</td>
<td>General size. Maximum limit of the organism size, replaces and
overrides organism_size. This is translated into a formula. The formula
is for instance as follows: “NA/20/50/120/cm” and means
“min/from/to/max/unit”. Empty values will be translated into NA (NA=not
available).</td>
</tr>
<tr class="odd">
<td>organism_size_unit</td>
<td>mm<br />
or<br />
m</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|organism size formula
min-from-to-max-unit=formula}}</td>
<td><em>Default: cm</em>. Use it if another then the default unit is
needed. This is translated into a formula. The formula is for instance
as follows: “NA/20/50/120/cm” and means “min/from/to/max/unit”. Empty
values will be translated into NA (NA=not available).</td>
</tr>
<tr class="even">
<td>organism_size_comment</td>
<td></td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|organism size comment=…}}</td>
<td>Comment to organism size</td>
</tr>
<tr class="odd">
<td>life_form</td>
<td></td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|life form=…}}</td>
<td>life form after FI or Nyffeler<sup><a
href="#cite_note-1">[1]</a></sup></td>
</tr>
<tr class="even">
<td>flowering_period</td>
<td>1-2<br />
or<br />
II-IV</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|flowering period=string}}</td>
<td>Flowering period in months.</td>
</tr>
<tr class="odd">
<td>flowering_period_min</td>
<td>1<br />
or<br />
II</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|flowering period formula
min-from-to-max=formula}}</td>
<td>earliest time of the flowering period as month. This is translated
into a formula. The formula is for instance as follows: “2/4/5/NA” and
means “min/from/to/max”. Empty values will be translated into NA (NA=not
available).</td>
</tr>
<tr class="even">
<td>flowering_period_from</td>
<td>1<br />
or<br />
II</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|flowering period formula
min-from-to-max=formula}}</td>
<td>“flowering period from” as month. This is translated into a formula.
The formula is for instance as follows: “2/4/5/NA” and means
“min/from/to/max”. Empty values will be translated into NA (NA=not
available).</td>
</tr>
<tr class="odd">
<td>flowering_period_to</td>
<td>1<br />
or<br />
II</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|flowering period formula
min-from-to-max=formula}}</td>
<td>“flowering period to” as month. This is translated into a formula.
The formula is for instance as follows: “2/4/5/NA” and means
“min/from/to/max”. Empty values will be translated into NA (NA=not
available).</td>
</tr>
<tr class="even">
<td>flowering_period_max</td>
<td>1<br />
or<br />
II</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|flowering period formula
min-from-to-max=formula}}</td>
<td>most latest time of the flowering period as month. This is
translated into a formula. The formula is for instance as follows:
“2/4/5/NA” and means “min/from/to/max”. Empty values will be translated
into NA (NA=not available).</td>
</tr>
<tr class="odd">
<td>altitudinal_zones</td>
<td>coll-mont<br />
or<br />
coll.-mont. (-subalp.)</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|altitudinal zones=string}}</td>
<td>string of the whole range of altitudinal zones usually given by
“(min–)from–to(–max)”</td>
</tr>
<tr class="even">
<td>altitudinal_zone_min</td>
<td>coll</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|altitudinal zone formula
min-from-to-max=formula}}</td>
<td>Lowest altitudinal zone. This is translated into a formula. The
formula is for instance as follows: “NA/colline/montane/NA” and means
“min/from/to/max”. Empty values will be translated into NA (NA=not
available).</td>
</tr>
<tr class="odd">
<td>altitudinal_zone_from</td>
<td>coll</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|altitudinal zone formula
min-from-to-max=formula}}</td>
<td>Lower limit of the altitudinal zones. This is translated into a
formula. The formula is for instance as follows: “NA/colline/montane/NA”
and means “min/from/to/max”. Empty values will be translated into NA
(NA=not available).</td>
</tr>
<tr class="even">
<td>altitudinal_zone_to</td>
<td>coll</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|altitudinal zone formula
min-from-to-max=formula}}</td>
<td>Upper limit of the altitudinal zones. This is translated into a
formula. The formula is for instance as follows: “NA/colline/montane/NA”
and means “min/from/to/max”. Empty values will be translated into NA
(NA=not available).</td>
</tr>
<tr class="odd">
<td>altitudinal_zone_max</td>
<td>coll</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|altitudinal zone formula
min-from-to-max=formula}}</td>
<td>Highest altitudinal zone. This is translated into a formula. The
formula is for instance as follows: “NA/colline/montane/NA” and means
“min/from/to/max”. Empty values will be translated into NA (NA=not
available).</td>
</tr>
<tr class="even">
<td>altitudinal_zone_comment</td>
<td></td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|altitudinal zone comment=}}</td>
<td>Comment</td>
</tr>
<tr class="odd">
<td>occurrence_status</td>
<td>indigenous</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|occurrence status=string}}</td>
<td>natural state, if indigenous, naturalised etc.</td>
</tr>
<tr class="even">
<td>occurrence_ecology_typo</td>
<td>Sisymbrion, Alysso-Sedion, Caucalidion</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|occurrence ecology typo=string}}</td>
<td>plant sociology</td>
</tr>
<tr class="odd">
<td>occurrence_ecology_values</td>
<td>U.1+43-444.k-t. 2n=28</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|occurrence ecology values=string}}</td>
<td>basis is FI/FH and reviewed by AGY, ecological indication values
after <a
href="https://wiki.infoflora.ch/swissflorawiki/de/Landolt_et_al._2010"
title="Landolt et al. 2010"><span>Landolt et al. (2010)</span></a></td>
</tr>
<tr class="even">
<td>presence_territory</td>
<td>CH: X</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|presence territory=string}}</td>
<td>Occurrence in the territory. Parameter not set: present;
X: missing; ?: questionable</td>
</tr>
<tr class="odd">
<td>floristic_zones</td>
<td>Eurosiberian</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|floristic zones=string}}</td>
<td></td>
</tr>
<tr class="even">
<td>floristic_zones_comments</td>
<td>also Alps</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|floristic zones comments=string}}</td>
<td></td>
</tr>
<tr class="odd">
<td>xenophyte</td>
<td></td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|xenophyte=string}}</td>
<td></td>
</tr>
<tr class="even">
<td>toxicity</td>
<td>+</td>
<td>{{<a href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead"
title="Vorlage:Lead">Lead</a>|toxicity=string}}</td>
<td>Toxicity class of a taxon after Flora Helvetica (+,++,+++)</td>
</tr>
</tbody>
</table>

#### <span id="Hidden_Parameters" class="mw-headline">Hidden Parameters<span id="stummer_Parameter" style="visibility:hidden"></span></span>

These parameters can be inserted into the data table, they get converted
to Wiki code, but they are not evaluated. Mostly these are parameters
that needs to be exported again.

<table class="wikitable sortable vertical-align-top jquery-tablesorter">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Parameter<br />
Column Head</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Type</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Template Parameter<br />
(Correspondence)</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Comment</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>taxon_treatment_hidden_comment</td>
<td>meta data</td>
<td>taxon treatment hidden comment</td>
<td>hidden comment</td>
</tr>
<tr class="even">
<td>taxon_treatment_hidden_comment</td>
<td>attribute of decision</td>
<td>taxon treatment hidden comment</td>
<td>hidden comment</td>
</tr>
<tr class="odd">
<td>drawing_detail</td>
<td>attribute of decision</td>
<td>drawing detail</td>
<td>whether detail drawing is necessary (yes: “D”)</td>
</tr>
<tr class="even">
<td>map_comment</td>
<td>attribute of decision</td>
<td>map comment</td>
<td>comment for the map</td>
</tr>
<tr class="odd">
<td>checklist_id</td>
<td>attribute of decision</td>
<td>result id list</td>
<td>checklist ID. Converted to <code
style="color:gray;">&lt;span class="hide" data-term="checklist_id" data-prefix="Checklist"&gt;2013479&lt;/span&gt;</code>.
Hidden by CSS-layout-rules (<a
href="https://wiki.infoflora.ch/swissflorawiki/de/MediaWiki:Common.css"
title="MediaWiki:Common.css">MediaWiki:Common.css</a>).</td>
</tr>
<tr class="even">
<td>infoflora_id</td>
<td>attribute of decision</td>
<td>result id list</td>
<td>infoflora ID. Converted to <code
style="color:gray;">&lt;span class="hide" data-term="infoflora_id" data-prefix="Infoflora"&gt;2013479&lt;/span&gt;</code>.
Hidden by CSS-layout-rules (<a
href="https://wiki.infoflora.ch/swissflorawiki/de/MediaWiki:Common.css"
title="MediaWiki:Common.css">MediaWiki:Common.css</a>).</td>
</tr>
<tr class="odd">
<td>isfs_id</td>
<td>attribute of decision</td>
<td>result id list</td>
<td>isfs ID. Converted to <code
style="color:gray;">&lt;span class="hide" data-term="isfs_id" data-prefix="ISFS"&gt;2013479&lt;/span&gt;</code>.
Hidden by CSS-layout-rules (<a
href="https://wiki.infoflora.ch/swissflorawiki/de/MediaWiki:Common.css"
title="MediaWiki:Common.css">MediaWiki:Common.css</a>).</td>
</tr>
</tbody>
</table>

  

## <span id="Structure_of_a_file_for_.7B.7BImageSwitch.7D.7D" class="mw-headline">Structure of a file for {{[ImageSwitch](https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:ImageSwitch "Vorlage:ImageSwitch")}}</span>

The identification with
{{[ImageSwitch](https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:ImageSwitch "Vorlage:ImageSwitch")}}
or the “Bildweiche” is based on pictures, all being “shown at the same
time”, usually only on one page. On another page, the key can be
continued. To convert multiple
{{[ImageSwitch](https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:ImageSwitch "Vorlage:ImageSwitch")}}
at once, blocks of it can be provided in the identification matrix. Each
Block begins with the page name, as a “heading” so to speak.

The following example spread sheet is to illustrate (taken from
<a href="http://offene-naturfuehrer.de/web/Start_BeachExplorer"
class="external text" target="_blank">beach Explorer</a>):

1.  the first table heading indicates the user-defined column headings
    (ignored by the converter)
2.  the second line of the column headings indicates the [“standardized
    column
    parameters”](#Parameter_ImageSwitch_im_Detail),
    which can be used for a conversion.

<div
style="height:800px;overflow:scroll;border: 2px inset gray;padding:1ex;font-size:smaller;">

<table class="wikitable vertical-align-top" style="width:100%;">
<colgroup>
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
</colgroup>
<tbody>
<tr class="header">
<th>German name</th>
<th>English name</th>
<th>Dutch name</th>
<th>Danish name</th>
<th>Scientific name</th>
<th></th>
<th></th>
<th>IDcomplete</th>
<th>Character description (above)</th>
<th>Image name</th>
<th>Result text (sub-key or species)</th>
<th>Link destination<br />
(species/sect. next level)</th>
<th>Creator</th>
</tr>
<tr class="odd">
<th><code>common_names_de</code></th>
<th><code>common_names_en</code></th>
<th><code>common_names_nl</code></th>
<th><code>common_names_da</code></th>
<th><code>scientific_name</code></th>
<th><code>decision_number</code></th>
<th><code>decision_alternative_number</code></th>
<th><code>result_id</code></th>
<th><code>decision_alternative_text</code></th>
<th><code>primary_media</code></th>
<th><code>result_text</code></th>
<th><code>result_link</code></th>
<th><code>creators</code></th>
</tr>

<tr class="odd">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td>0</td>
<td></td>
<td></td>
<td></td>
<td>Start BeachExplorer</td>
<td></td>
<td>Rainer Borcherding</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td>1</td>
<td>BExID:9900010</td>
<td>With hairs and feathers, moreover whales</td>
<td>File:BEQ1A V Robbe Moewe KT.jpg</td>
<td>four-legged animals, birds, whales</td>
<td>quadruped &amp; birds &amp; whales</td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td>2</td>
<td>BExID:9900020</td>
<td>with fins, scales, branchial clefts</td>
<td>File:BEQ2A F Fische.jpg</td>
<td>fishes</td>
<td>fishes</td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td>3</td>
<td>BExID:9900030</td>
<td>With lime shells and -shields</td>
<td>File:BEQ3A S Schalen.jpg</td>
<td>shellfishes</td>
<td>shellfishes</td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td>4</td>
<td>BExID:9900040</td>
<td>skin soft, body shape very diverse</td>
<td>File:BEQ4A W Weiche Tiere.jpg</td>
<td>soft-skinned animals</td>
<td>soft-skinned animals</td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td>5</td>
<td>BExID:9900050</td>
<td>branched, firmly grown, plant-like</td>
<td>File:BEQ5A G Gewaechse Knubbel.jpg</td>
<td>growths, crust, lumps</td>
<td>growths, crust, lumps</td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td>6</td>
<td>BExID:9900060</td>
<td>holes, tubes, all kinds of traces</td>
<td>File:BEQ6A L Loecher Roehren.jpg</td>
<td>holes and tubes</td>
<td>holes and tubes</td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td>7</td>
<td>BExID:9900070</td>
<td>with chitinous carapace, mostly land animals</td>
<td>File:BEQ7A I Kaeferspülsaum.jpg</td>
<td>insects and arthropods</td>
<td>insects and arthropods</td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td>8</td>
<td>BExID:9800080</td>
<td>plastic, wood, stones, bones</td>
<td>File:BEQ8A M HolzSteinMüll.jpg</td>
<td>wast, wood and stones</td>
<td>wast, wood and stones</td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td>9</td>
<td>BExID:9800090</td>
<td>peculiarities &amp; riddles</td>
<td>File:BEQ9A D Dinger.jpg</td>
<td>eggs, blobs &amp; puzzle things</td>
<td>eggs, blobs &amp; puzzle things</td>
<td></td>
</tr>
<tr class="odd">
<td>…</td>
<td>…</td>
<td>…</td>
<td>…</td>
<td>…</td>
<td>…</td>
<td>…</td>
<td>…</td>
<td>…</td>
<td>…</td>
<td>…</td>
<td>…</td>
<td>…</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>3</td>
<td>0</td>
<td></td>
<td></td>
<td></td>
<td>pinnipeds, seals</td>
<td></td>
<td>Rainer Borcherding</td>
</tr>
<tr class="odd">
<td>Seehund</td>
<td>Harbour seal</td>
<td>Gewone zeehond</td>
<td>Spættet sæl</td>
<td>Phoca vitulina</td>
<td>3</td>
<td>1</td>
<td>BExID:1370841</td>
<td>Up to 1.6 m, muzzle short, molars three-pointed</td>
<td>File:BEQ1E VR Seehund.jpg</td>
<td>Harbor seal</td>
<td>Harbor seal</td>
<td></td>
</tr>
<tr class="even">
<td>Kegelrobbe</td>
<td>Grey seal</td>
<td>Grijze zeehond</td>
<td>Gråsæl</td>
<td>Halichoerus grypus</td>
<td>3</td>
<td>2</td>
<td>BExID:1370801</td>
<td>Up to 2.3 m, muzzle short, molars single pointed</td>
<td>File:BEQ1E VR Kegelrobbe.jpg</td>
<td>Grey seal</td>
<td>Grey seal</td>
<td></td>
</tr>
<tr class="odd">
<td>Ringelrobbe</td>
<td>Ringed Seal</td>
<td>Ringelrob</td>
<td>Ringsæl</td>
<td>Phoca hispida</td>
<td>3</td>
<td>3</td>
<td>BExID:1370831</td>
<td>Up to 1.6 m, muzzle very short, belly unspotted, otherwise
rings</td>
<td>File:BEQ1E VR Ringelrobbe.jpg</td>
<td>Ringed seal</td>
<td>Ringed seal</td>
<td></td>
</tr>
<tr class="even">
<td>Sattelrobbe</td>
<td>Harp seal</td>
<td>Zadelrob</td>
<td>Grønlandssæl</td>
<td>Pagophilus groenlandicus</td>
<td>3</td>
<td>4</td>
<td>BExID:1370821</td>
<td>Up to 1.9 m, muzzle long and flat, black back saddle</td>
<td>File:BEQ1E VR Sattelrobbe.jpg</td>
<td>Harp seal</td>
<td>Harp seal</td>
<td></td>
</tr>
<tr class="odd">
<td>Klappmütze</td>
<td>Hooded seal</td>
<td>Klapmuts</td>
<td>Klapmyds</td>
<td>Cystophora cristata</td>
<td>3</td>
<td>5</td>
<td>BExID:1370781</td>
<td>Up to 2.6 m, conspicuous black on light spotted</td>
<td>File:BEQ1E VR Klappmuetze.jpg</td>
<td>Hooded seal</td>
<td>Hooded seal</td>
<td></td>
</tr>
<tr class="even">
<td>Bartrobbe</td>
<td>Bearded seal</td>
<td>Baardrob</td>
<td>Remmesæl</td>
<td>Erignathus barbatus</td>
<td>3</td>
<td>6</td>
<td>BExID:1370791</td>
<td>Up to 2.5 m, small head, long whiskers, hardly patterned</td>
<td>File:BEQ1E VR Bartrobbe.jpg</td>
<td>Bearded seal</td>
<td>Bearded seal</td>
<td></td>
</tr>
<tr class="odd">
<td>Walross</td>
<td>Walrus</td>
<td>Walrus</td>
<td>Hvalros</td>
<td>Odobenus rosmarus</td>
<td>3</td>
<td>7</td>
<td>BExID:1370771</td>
<td>front legs with joint, very clumsy and fat</td>
<td>File:BEQ1B VR Walross sonnend.jpg</td>
<td>Walrus</td>
<td>Walrus</td>
<td></td>
</tr>
</tbody>
</table>

</div>

  

### <span id="Column_parameters_for_.7B.7BImageSwitch.7D.7D_in_Detail" class="mw-headline">Column parameters for {{[ImageSwitch](https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:ImageSwitch "Vorlage:ImageSwitch")}} in Detail<span id="Parameter_ImageSwitch_im_Detail" style="visibility:hidden"></span></span>

As follows the possible parameters are explained in detail.

<table class="wikitable sortable vertical-align-top jquery-tablesorter">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Type</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Column Parameter</th>
<th class="headerSort" style="width: 300px" tabindex="0"
role="columnheader button"
title="Aufsteigend sortieren">Description</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">{{<a
href="https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:ImageSwitch"
title="Vorlage:ImageSwitch">ImageSwitch</a>}} Correspondence</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>identification</td>
<td>decision_alternative_text</td>
<td>Text of a decision alternative (the whole ImageSwitch corresponds
quasi to a “decision” having up to 30 decision alternatives)</td>
<td><code>lead 1</code> … <code>lead 30</code></td>
</tr>
<tr class="even">
<td>identification</td>
<td>decision_alternative_textlines</td>
<td>the number of text lines of an alternative (can be specified
globally for conversion)</td>
<td><code>lead lines</code></td>
</tr>
<tr class="odd">
<td>identification</td>
<td>decision_number</td>
<td>Index-number. If multiple keys, the index of the key (=decision).
Eery key is associated to a decision_number, but for the alternatives
(=decision_alternative_number) it has in itself variant indices.</td>
<td></td>
</tr>
<tr class="even">
<td>identification</td>
<td>decision_alternative_number</td>
<td>Index number of the alternatives within the key (within the
decision_number, of the decision)</td>
<td>1 … 30 in <code>lead 1</code> … <code>lead 30</code></td>
</tr>
<tr class="odd">
<td>contribution</td>
<td>creators</td>
<td>Author or list of authors (interpreted as author of the key)</td>
<td><code>creators</code></td>
</tr>
<tr class="even">
<td>contribution</td>
<td>contributors</td>
<td>contributor or list of contributors (interpreted as contributors of
the key)</td>
<td><code>contributors</code></td>
</tr>
<tr class="odd">
<td>ID</td>
<td>decisionkey_id</td>
<td>id of the key on the wiki page itself (only to be specified if there
are several keys on one page)</td>
<td><code>id</code></td>
</tr>
<tr class="even">
<td>classification</td>
<td>decisionkey_rating</td>
<td>rating in numerical form (1=the lowest, ... 5=the highest; can be
specified globally for all when converting)</td>
<td><code>rating</code></td>
</tr>
<tr class="odd">
<td>classification</td>
<td>decisionkey_recommendation_group</td>
<td>recommendation class for the key, e.g. “Plant identification
(beginner)” and so forth (can be specified globally for all when
converting)</td>
<td><code>recommendation group</code></td>
</tr>
<tr class="even">
<td>media</td>
<td>primary_media_width</td>
<td>width of image (can be specified globally for all when
converting)</td>
<td><code>image width</code></td>
</tr>
<tr class="odd">
<td>media</td>
<td>primary_media</td>
<td>full file name of the media file, as
<strong>“File:filename.jpg”</strong></td>
<td><code>image 1</code> … <code>image 30</code></td>
</tr>
<tr class="even">
<td>layout, media</td>
<td>primary_media_caption_lines</td>
<td>the approximate number of caption lines of an image (globally
specifiable for all when converting)</td>
<td><code>caption lines</code></td>
</tr>
<tr class="odd">
<td>layout, media</td>
<td>primary_media_caption_style</td>
<td>CSS style of image caption (globally specifiable for all when
converting)</td>
<td><code>caption style</code></td>
</tr>
<tr class="even">
<td>layout, key</td>
<td>decisionkey_style</td>
<td>CSS style of the whole key (globally specifiable for all when
converting)</td>
<td><code>style</code></td>
</tr>
<tr class="odd">
<td>layout, key</td>
<td>decisionkey_format</td>
<td>2 formats are available: “result link top result text bottom” or
“result link bottom result text top” (globally specifiable for all when
converting)</td>
<td><code>layout format</code></td>
</tr>
<tr class="even">
<td>result</td>
<td>reuslt_text</td>
<td>display text of the result</td>
<td><code>result text 1</code> … <code>result text 30</code></td>
</tr>
<tr class="odd">
<td>result</td>
<td>result_link</td>
<td>the result’s link target (page or URL)</td>
<td><code>result 1</code> … <code>result 30</code></td>
</tr>
<tr class="even">
<td>ID</td>
<td>result_id</td>
<td>is a result ID that the author wants to include in the key data. The
result ID should have a prefix to make the ID unique. Note: a result ID
is useful if a species page will follow.</td>
<td><code>result id 1</code> … <code>result id 30</code></td>
</tr>
<tr class="odd">
<td>result</td>
<td>common_names_da<br />
common_names_de<br />
common_names_dk<br />
common_names_el<br />
common_names_en<br />
common_names_es<br />
common_names_et<br />
common_names_fi<br />
common_names_fr<br />
common_names_it<br />
common_names_lt<br />
common_names_lv<br />
common_names_nl<br />
common_names_no<br />
common_names_pl<br />
common_names_pt<br />
common_names_ru<br />
common_names_sv</td>
<td>List of common names for each language one column (…_da: Danish,
…_de:German etc.; prefix “@de:” is added)</td>
<td><code>common names 1</code> … <code>common names 30</code></td>
</tr>
<tr class="even">
<td>result</td>
<td>scientific_name</td>
<td>scientific name</td>
<td><code>scientific name 1</code> …
<code>scientific name 30</code></td>
</tr>
<tr class="odd">
<td>heading</td>
<td>decisionkey_title</td>
<td>heading of the key</td>
<td><code>title</code></td>
</tr>
</tbody>
</table>

## <span id="Shortcut_Writing_and_Emphasis_.28Typography.29" class="mw-headline">Shortcut Writing and Emphasis (Typography)</span>

For emphasis of typography (italic, bold) it is recommended to use
HTML-tags:

-   **\<b\>bold\</b\>**
-   *\<i\>italic\</i\>*

The following writing shortcuts can be used, they become formatted or
translated accordingly

<table
class="sortable booktabledotted vertical-align-top jquery-tablesorter">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Writing Shortcut</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Converted</th>
<th class="headerSort" tabindex="0" role="columnheader button"
title="Aufsteigend sortieren">Comment</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>&lt;+-&gt;<br />
&lt;+/-&gt;</td>
<td>±</td>
<td></td>
</tr>
<tr class="even">
<td>&lt;2/3&gt;</td>
<td><sup>2</sup>/<sub>3</sub></td>
<td>All fractions up to X/10 will be translated, not as single character
(to avoid character loss into ASCII conversion), but as
<sup>superscript</sup>/<sub>subscript</sub></td>
</tr>
<tr class="odd">
<td>&lt;=</td>
<td>≤</td>
<td></td>
</tr>
<tr class="even">
<td>&gt;=</td>
<td>≥</td>
<td></td>
</tr>
<tr class="odd">
<td>&lt;m&gt;</td>
<td>♂</td>
<td></td>
</tr>
<tr class="even">
<td>&lt;f&gt;</td>
<td>♀</td>
<td></td>
</tr>
<tr class="odd">
<td>&lt;mf&gt;</td>
<td>⚥</td>
<td></td>
</tr>
<tr class="even">
<td>&lt;fm&gt;</td>
<td>☿</td>
<td></td>
</tr>
</tbody>
</table>

## <span id="Problems_During_Import" class="mw-headline">Problems During Import</span>

### <span id="Couplet_ID_missing.21" class="mw-headline">Couplet_ID_missing!</span>

Possible solutions, for the {{[Key
Start](https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Key_Start "Vorlage:Key Start")}}
with
{{[Lead](https://wiki.infoflora.ch/swissflorawiki/de/Vorlage:Lead "Vorlage:Lead")}}:

-   do the columns
    [`decision_number`](#Parameter_decision_number)
    and `decision_alternative_number` have continued index numbers, even
    in the nested mode of determination?
-   is the
    [`decision_alternative_text`](#Parameter_alternative_text)
    intended to be a kind of (sub)section in between, then use instead
    `decision_heading`.

------------------------------------------------------------------------

**Remarks:**

1.  <span id="cite_note-1"><span class="mw-cite-backlink">[<span
    class="cite-accessibility-label">Hochspringen
    </span>↑](#cite_ref-1)</span>
    <span class="reference-text">any literature sources?</span></span>

</div>

<div class="printfooter">

Von „<a href="https://wiki.infoflora.ch/swissflorawiki/d/index.php?title=Hilfe:Konvertieren_von_Tabellenblatt-Daten_in_Schl%C3%BCsselvorlagen/en&amp;oldid=10246"
dir="ltr">https://wiki.infoflora.ch/swissflorawiki/d/index.php?title=Hilfe:Konvertieren_von_Tabellenblatt-Daten_in_Schlüsselvorlagen/en&amp;oldid=10246</a>“

</div>
