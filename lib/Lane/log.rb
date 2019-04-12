
module Lane

  class Log

    DEFAULT_FILE = Pathname.new '/var/log/lane.log'

    # date and line format
    DATE_FORMAT = '%Y-%m-%d %H:%M:%S'

    def initialize
      unless DEFAULT_FILE.file? && DEFAULT_FILE.writable?
        File.write(DEFAULT_FILE, "≈≈≈ Lane, the real life JSS reporter ≈≈≈\n", mode: 'a')
      end
    end

    def write(message)
      File.write(DEFAULT_FILE, "#{Time.now.strftime(DATE_FORMAT)} - #{message}\n", mode: 'a')
    end

    def putsandlog(message)
      puts message
      write message
    end

  end # Class Log

end # MOdule
