USER_URL = "#{API_URL}/users"
ME_URL = "#{API_URL}/me"

module Pocketsmith
  class User
  
    attr_reader :id, :login, :name, :email, :avatar_url, :beta_user, :time_zone, :week_start_day, :base_currency_code, :always_show_base_currency, :using_multiple_currencies
  
    def initialize(attributes)
      @id = attributes["id"]
      @login = attributes["login"]
      @name = attributes["name"]
      @email = attributes["email"]
      @avatar_url = attributes["avatar_url"]
      @beta_user = attributes["beta_user"]
      @time_zone = attributes["time_zone"]
      @week_start_day = attributes["week_start_day"]
      @base_currency_code = attributes["base_currency_code"]
      @always_show_base_currency = attributes["always_show_base_currency"]
      @using_multiple_currencies = attributes["using_multiple_currencies"]
    end  

    def self.find(id)
      conn = Faraday.new("#{USER_URL}/#{id}")
      conn.authorization("Key", ENV["api_key"])
      response = conn.get
      attributes = JSON.parse(response.body)
      new(attributes)
    end

    def self.me
      conn = Faraday.new("#{ME_URL}")
      conn.authorization("Key", ENV["api_key"])
      response = conn.get  
      attributes = JSON.parse(response.body)
      new(attributes)
    end
  end
end
