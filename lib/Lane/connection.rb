require 'ruby-jss'
require_relative 'config'

module Lane


  def self.connect_to_jss
    # JSS Connection info

    begin
      JSS.api.connect user: Lane.config.jamf_user,
                      pw: Lane.config.jamf_password,
                      server: Lane.config.jamf_server,
                      verify_cert: false

      puts "Connected to the JSS."
    rescue
      puts "Could not connect to JSS. Please check the configuration."
      # abort
    end
  end

end # Lane