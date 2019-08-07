require 'net/http'

module ApiCaller

  # Telco transfer request processing
  module Telco
    # set telco api url
    # TODO: refactor, move this to app config/initializer
    if Rails.env.development? || Rails.env.test?
      TELCO_API_URL = "http://localhost:8080/"
    elsif Rails.env.production?
      TELCO_API_URL = ENV['TELCO_API_URL']
    end

    # returns status of process request as string: success||fail
    def self.process_transfer(msisdn)
      # TODO: determine environment, replace uri with environment variable
      res = Net::HTTP.get_response(URI(TELCO_API_URL+"?msisdn=#{msisdn}"))
      JSON.parse(res.response.body)["status"]
      # TODO: log response code and message
    end
  end

end
