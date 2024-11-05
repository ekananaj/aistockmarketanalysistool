require_relative 'lib/stock_data_fetcher'
require_relative 'lib/stock_sentiment_analyzer'
require 'yaml'

config = YAML.load_file('config/config.yml')
news_api_key = config['news_api_key']
stocks_api_key = config['stocks_api_key']

puts "Enter the stock symbol you want to analyze:"
stock_symbol = gets.chomp

# Fetch stock prices
stock_fetcher = StockDataFetcher.new(stocks_api_key)
stock_fetcher.fetch_stock_prices(stock_symbol)

# Analyze sentiment from recent articles
sentiment_analyzer = StockSentimentAnalyzer.new(news_api_key)
sentiment_scores = sentiment_analyzer.analyze_articles(stock_symbol)

# Display results
puts "\nSentiment scores for recent articles:"
sentiment_scores.each { |entry| puts "Date: #{entry[:date]}, Score: #{entry[:score]}" }
