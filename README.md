# Lane

Lane is a **real-world** reporter for JSS. Its goal is to give simple and easily automatic access to the information on the Apple Management platform. 

## Installation

Install it yourself as:

    $ gem install Lane
    
## Configuration

Once installed, the configuration will be taken from the file `/etc/lane.conf` in which you will be able to specify the URL of your JSS instance, the user and the password.

An example of this file can be found in your Gem installation PATH /Lane/data/lane.conf

Pound signs and blank spaces are ignored, and values do not need to be quoted. 

## Usage

Once installed and configured, run it as following:

`lane --advanced_search | -a ID [-separator | -s char] [-output | -o output path]`

  -a ID, --advanced_search ID:
    ID of the JSS advanced search to base the report on.

  -s char, --separator char:
    Character that will be used as separator on the output file. Defaults to ';'

  -o path, --output path:
     Path for the output of the processed report. Defaults to /Users/Shared/lane_report_YY-MM-DD.txt"
     
 **Lane** will fetch all the results of the advanced search with the ID specified as the -a parameter and parse them into columns, with the column titles pulled from the search, separated with the selected character and store in the defined output path. 

## Dependencies

**Lane** connects to the JSS using the [Ruby-JSS library from Pixar Animation Studios](https://github.com/PixarAnimationStudios/ruby-jss).