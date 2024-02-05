class AirportService
  def self.airports
    get_url("/v1/airports")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.api-ninjas.com") do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.airportkey[:key]
    end
  end
end
