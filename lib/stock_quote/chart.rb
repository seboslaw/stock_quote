require 'json'

module StockQuote

  class Chart
    CHART_FIELDS = %w(date open high low close volume unadjustedVolume change changePercent vwap label changeOverTime)

    CHART_FIELDS.each do |k|
      __send__(:attr_accessor, k.to_sym)
    end

    def initialize(data={})
      data.each {|k,v|
        self.instance_variable_set("@#{k}".to_sym, v)
      }
    end
  end
end