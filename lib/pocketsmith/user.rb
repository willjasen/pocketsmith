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
      new(retrieve("#{USER_URL}/#{id}"))
    end

    def self.me
      new(retrieve("#{ME_URL}"))
    end

    def self.accounts
      new(retrieve("#{USER_URL}/#{id}/accounts"))
    end

    def self.categories
      new(retrieve("#{USER_URL}/#{id}/categories"))
    end

    def self.retrieve(url)
      conn = Faraday.new("#{url}")
      conn.authorization("Key", ENV['api_key'])
      response = conn.get
      attributes = JSON.parse(response.body)
    end
  end
end
