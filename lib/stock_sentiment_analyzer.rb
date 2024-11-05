require 'httparty'
require_relative 'sentiment_analyzer'

class StockSentimentAnalyzer
  def initialize(api_key)
    @api_key = api_key
    @sentiment_analyzer = SentimentAnalyzer.new
  end

  def fetch_recent_articles(stock_symbol)
    url = "https://newsapi.org/v2/everything?q=#{stock_symbol}&apiKey=#{@api_key}"
    response = HTTParty.get(url)
    response.parsed_response['articles']
  end

  def analyze_articles(stock_symbol)
    articles = fetch_recent_articles(stock_symbol)
    sentiment_scores = []

    articles.each do |article|
      text = article['title'] + ' ' + article['description']
      result = @sentiment_analyzer.analyze_text(text)
      sentiment_scores << { date: article['publishedAt'], score: result[:score] }
    end

    sentiment_scores
  end
end
