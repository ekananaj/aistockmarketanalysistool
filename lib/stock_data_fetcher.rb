require 'httparty'
require 'dotenv/load'
require 'csv'

class StockDataFetcher
  def initialize(api_key)
    @api_key = api_key
  end

  def fetch_stock_prices(symbol)
    response = HTTParty.get("https://api.marketstack.com/v1/eod?access_key=#{@api_key}&symbols=#{symbol}")
    data = response.parsed_response['data']
    
    CSV.open("data/#{symbol}_prices.csv", "w") do |csv|
      csv << ["date", "close"]
      data.each { |entry| csv << [entry['date'], entry['close']] }
    end
  end
end
