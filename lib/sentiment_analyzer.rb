require 'sentimental'

class SentimentAnalyzer
  def initialize
    Sentimental.load_defaults
    @analyzer = Sentimental.new
  end

  def analyze_text(text)
    score = @analyzer.score(text)
    { sentiment: @analyzer.sentiment(text), score: score }
  end
end
