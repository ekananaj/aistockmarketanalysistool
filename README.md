# AI Sentiment-Driven Stock Market Analysis Tool

This Ruby project analyzes recent public sentiment about selected stocks by fetching and scoring news articles or social media posts. The sentiment analysis is then correlated with stock price data, providing a unique perspective on the relationship between public opinion and market behavior.

## Features
- Fetches historical stock price data
- Analyzes recent news articles for sentiment
- Displays sentiment scores and allows for correlation with stock prices

## Tech Stack
- **Language**: Ruby
- **APIs**: MarketStack API for stock prices, News API for article data
- **Sentiment Analysis**: Sentimental gem for text analysis

## Setup Instructions
1. Clone this repository.
2. Run `bundle install` to install dependencies.
3. Add your API keys to `config/config.yml`.
4. Run `ruby main.rb` and follow the prompts to enter a stock symbol.

## Future Improvements
- Data visualization of sentiment vs. stock prices
- Real-time sentiment updates and alerts
- Advanced bias detection to improve sentiment accuracy
