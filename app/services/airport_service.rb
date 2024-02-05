class AirportService
  def airports
    get_url("/v1/airports")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.api-ninjas.com") do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.airportkey[:key]
    end
  end
end
