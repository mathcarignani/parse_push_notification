module ParsePushNotification

  class Push
    attr_accessor :parse_app_id, :parse_rest_api_key
    attr_accessor :alert, :device_type, :device_token, :sound, :payload

    def initialize(app_id, rest_api_key)
      self.parse_app_id = app_id
      self.parse_rest_api_key = rest_api_key
    end

    def send

      uri = URI.parse("https://api.parse.com/1/push")
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri)
      request["X-Parse-Application-Id"] = self.parse_app_id
      request["X-Parse-REST-API-Key"] = self.parse_rest_api_key
      request["Content-Type"] = "application/json"
      body = JSON.generate({
        data: { 
          alert: self.alert, 
          sound: "default"
          }
      })
      http.use_ssl = true
      response = http.request(request,body)

      puts "Sended!"
    end
  end
end