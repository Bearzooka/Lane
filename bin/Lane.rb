#!/usr/bin/ruby

require_relative '../lib/lane/foundation'
require 'getoptlong'

# The CLI options for GetoptLong
OPTS = GetoptLong.new(
  ['--advanced_search', '-a', GetoptLong::REQUIRED_ARGUMENT],
  ['--separator', '-s', GetoptLong::REQUIRED_ARGUMENT],
  ['--output', '-o', GetoptLong::OPTIONAL_ARGUMENT]
)

report_id = nil
separator = nil
output = nil

OPTS.each do |opt, arg|
  case opt
  when '--advanced_search'
    if arg == ''
      puts Lane::USAGE
      exit 1
    else
      report_id = arg
    end

  when '--separator'
    if arg == ''
      separator = ';'
    else
      separator = arg
    end

  when '--output'
    if arg == ''
      output = "/Users/Shared/lane_report_#{Time.now.strftime('%Y-%m-%d')}.txt"
    else
      output = arg
    end

  end # case
end # opts.each

unless report_id
  puts Lane::USAGE
  exit 1
end

# Assigning a default path and separator for the report if no parameter was passed.
output ? output : output = "/Users/Shared/new_report_#{Time.now.strftime('%Y-%m-%d')}.txt"
separator ? separator : separator = ';'

begin
  Lane.connect_to_jss
  source = JSS::AdvancedComputerSearch.fetch(id: report_id.to_i).search_results

  puts "Got #{source.count} results"

  my_report = Lane::Report.new(output, separator)

  my_report.clear

  header_line = ''

  source[0].each_key do |key_name|
    header_line = "#{header_line}#{key_name.to_s.tr('_', ' ')}#{separator}"
  end

  # Removing a separator at the end of the line
  header_line = header_line[0...-1]

  my_report.write_header(header_line)

  source.each do |item|
    item.each { |value| my_report.append_data(value[1]) }
    my_report.new_line
  end

  puts "Report successfully created at #{output}"

end
