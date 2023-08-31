# Wiki Extension — Excel2DecisionKeyTemplates

A MediaWiki extension to parse Excel spreadsheets into Wiki templates developed by Offene Naturführer and https://www.infoflora.ch

## What does it do?

Excel2DecisionKeyTemplates is an extension to MediaWiki that,
converts data from either a spreadsheeet or a tab separated file.
The structure of those files is specific. 

In case of a conversion to `{{Key Start}}` and `{{Lead}}` metadata are given first, e.g:
* creators (tab) my name, your name
* title (tab) the key title
* etc.
* followed by a blank line
* followed by a specific column headers (e.g. `decision_number`, `alternative_text`, `next_decicion_number` etc.)
* followed by the actual data

Those data are converted to the needed template structure and the converted text
can be copied to any page manually. This manual approach was choosen, because 
key templates are likly only a part of a page.

Notes on installing Data Transfer can be found in the file INSTALL.

## Table Conversion by Hand and Linux Command Line

If you have no MediaWiki available you can convert the table data on the command line, say:

1. convert your excel sheet to text file: the output separator has to be “tabulator” or “\t” (it must be the tab character anyhow) save it locally
2. use the locally saved text-tab file to convert it by `gawk` (install `gawk` by your linux software manager)
3. under Linux/Unix you can try then translating the tab-delimited source file into a wiki code file using the following command:

```bash
cd Excel2DecisionKeyTemplates 

# with long options
gawk --assign='shellvar_wgLanguageCode=de-formal' \
  --file='./scripts/tab2KeyStart_and_Lead.awk' \
    'table_source_file_in_tab-separated_text-format.tab' \
  > 'table_output_Wiki_text.txt'

# with short option
gawk -v 'shellvar_wgLanguageCode=de-formal' \
  -f './scripts/tab2KeyStart_and_Lead.awk' \
    'table_source_file_in_tab-separated_text-format.tab' \
  > 'table_output_Wiki_text.txt'
```

## Credits 

Excel2DecisionKeyTemplates was adopted from extension Data Transfer written by 
Yaron Koren and the spreadsheet import functionality was written by Stephan Gambke.

The spreadsheet import functionality makes use of the PHPExcel
library, if it is available.

## Contact

Comments, questions, suggestions and bug reports can be
reported to https://github.com/infinite-dao/Excel2DecisionKeyTemplates/issues
