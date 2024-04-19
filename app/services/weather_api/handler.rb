module WeatherApi
  class Handler < Client
    def initialize(params)
      @params = params
    end

    def self.call(*args)
      new(*args).call
    end

    def call
      response = get_forecast(params) # params = { date: '2024-04-25' }
      forecast = response.dig('forecast', 'forecastday')&.first&.dig('day')

      forecast ? { max_temp: forecast['maxtemp_c'], min_temp: forecast['mintemp_c'] } : nil
    end

    private

    attr_reader :params
    # attr_reader # get
    # attr_writer # set
    # attr_accessor # get/set
  end
end


# WeatherApi::Handler.new(params).call
# WeatherApi::Handler.call(params)
