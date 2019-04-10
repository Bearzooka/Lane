# frozen_string_literal: true

module Lane
  USAGE = "≈≈≈ Lane, a real world reporter for JSS. ≈≈≈

  Usage: lane --advanced_search | -a ID [-separator | -s char] [-output | -o output path]

  -a ID, --advanced_search ID:
    ID of the JSS advanced search to base the report on.

  -s char, --separator char:
    Character that will be used as separator on the output file. Defaults to ';'

  -o path, --output path:
     Path for the output of the processed report. Defaults to /Users/Shared/lane_report_YY-MM-DD.txt"


  CONFIG_ERROR = "≈≈≈ Lane, a real world reporter for JSS. ≈≈≈

  [ERROR] The configuration file is missing in /etc/lane.conf

  You can copy a sample file from the data folder inside the installation path of Lane and
  fill the JSS URL, User and Password. "
end
