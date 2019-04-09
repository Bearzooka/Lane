# report.rb

module Lane
  class Report
    def initialize(path, separator = ',')
      # instance variables
      @path = path
      @separator = separator
    end

    def append_line(line)
      # method that appends a line to a report.
      File.write(@path, line, mode: 'a')
    end

    def write_header(header)
      File.write(@path, "#{header}\n", mode: 'w')
    end

    def clear
      File.write(@path, '', mode: 'w')
    end

    def delete
      File.delete(@path)
    end

    def append_data(data)
      # method that appends one piece of data and a separator
      File.write(@path, "#{data}#{@separator} ", mode: 'a')
    end

    def new_line
      # Deletes the last separator and then inserts a new line
      File.truncate(@path, File.size(@path) - 2)
      File.write(@path, "\n", mode: 'a')
    end

    def append_empty_columns(columns)
      # Inserts the passed number of empty columns for cases of missing info
      columns.times do
        File.write(@path, @separator.to_s, mode: 'a')
      end
    end
  end # Class Report
end # Module
