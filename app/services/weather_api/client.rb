module WeatherApi
  class Client
    BASE_URL = 'https://weatherapi-com.p.rapidapi.com'
    LANTITUDE = 53.9
    LONGITUDE = 27.5

    def get_forecast(params)
      get("/forecast.json?q=#{LANTITUDE}%2C#{LONGITUDE}&dt=#{params[:date]}")
    end

    private

    def get(path, params = {}, headers = {})
      request(:get, path, params, headers)
    end

    def request(method, path, params = {}, headers = {})
      headers = base_headers.merge(headers)
      response = HTTParty.send(method, "#{BASE_URL}#{path}", { params: params, headers: headers })

      begin
        JSON.parse(response.body)
      rescue JSON::ParserError
        nil
      end
    end

    def base_headers
      {
        'X-RapidAPI-Key': '7410e80dc2msh3f7e11f21a8e771p1a18e1jsna18a165e4599',
        'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
      }
    end
  end
end
