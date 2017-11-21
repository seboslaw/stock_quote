require 'rubygems'
require 'rest-client'
require 'json'
require 'csv'

module StockQuote

  # => SecQuote::Stock
  # Queries GoogleFinance for current and historical pricing.

  class IexStock    
    TYPES = %w(quote news chart)
    QUOTE_FIELDS = %w(symbol companyName primaryExchange sector calculationPrice open openTime close closeTime latestPrice latestSource latestTime latestUpdate latestVolume iexRealtimePrice iexRealtimeSize iexLastUpdated delayedPrice delayedPriceTime previousClose change changePercent iexMarketPercent iexVolume avgTotalVolume iexBidPrice iexBidSize iexAskPrice iexAskSize marketCap peRatio week52High week52Low ytdChange)

    # FIELDS = %w(symbol exchange id t e name f_reuters_url f_recent_quarter_date f_annlyal_date f_ttm_date financials kr_recent_quarter_date kr_annual_date kr_ttm_date c l cp ccol op hi lo vo avvo hi52 lo52 mc pe fwpe beta eps dy ldiv shares instown eo sid sname iid iname related summary management moreresources events)

   QUOTE_FIELDS.each do |k|
      __send__(:attr_accessor, k.to_sym)
    end

    attr_accessor :response_code, :history, :chart_data


    def initialize(data={})
      @chart_data = []
      
      return if data == nil

      if data["quote"]
        data["quote"].each {|k,v|
          self.instance_variable_set("@#{k}".to_sym, v)
        }
      end

      if data["chart"]
        data["chart"].each {|element|
          chart = StockQuote::Chart.new(element)
          @chart_data << chart
        }
      end
      @response_code = 200
    end

    def self.quote(symbols, types=["quote", "news", "chart"], range="1m")
      url = "https://api.iextrading.com/1.0/stock/market/batch"
      params = {}
      results = []
      params.merge!(symbols:  symbols.join(","))
      params.merge!(types: types.join(","))
      params.merge!(range: range)
      u = "#{url}?#{URI.encode_www_form(params)}"
      RestClient::Request.execute(:url => u, :method => :get, :verify_ssl => false) do |response|
        json = JSON.parse(response.body.gsub(/\n/, ""))
        for symbol in symbols
          stock = IexStock.new(json[symbol.upcase])
          if stock.symbol == symbol 
            results << stock 
          end
        end
      end
      return results
    end
    
    def self.json_quote(symbol, start_date=nil, end_date=nil, format=nil)
      self.quote(symbol, start_date, end_date, 'json')
    end
    
    def self.history(symbol, start_date=nil, end_date=nil, format=nil)
      self.history(symbol, start_date, end_date, format)
    end
    
    def self.json_history(symbol, start_date=nil, end_date=nil, format=nil)
      self.history(symbol, start_date, end_date, 'json')
    end
  end
end
