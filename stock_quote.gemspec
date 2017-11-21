# -*- encoding: utf-8 -*-
# stub: stock_quote 1.5.2 ruby lib

Gem::Specification.new do |s|
  s.name = "stock_quote".freeze
  s.version = "1.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ty Rauber".freeze]
  s.date = "2017-11-16"
  s.description = "Retrieve up to 100 stock quotes per query with the following variables - symbol, pretty_symbol, symbol_lookup_url, company, exchange, exchange_timezone, exchange_utc_offset, exchange_closing, divisor, currency, last, high, low, volume, avg_volume, market_cap, open, y_close, change, perc_change, delay, trade_timestamp, trade_date_utc, trade_time_utc, current_date_utc, current_time_utc, symbol_url, chart_url, disclaimer_url, ecn_url, isld_last, isld_trade_date_utc, isld_trade_time_utc, brut_last, brut_trade_date_utc, brut_trade_time_utc and daylight_savings - per stock.".freeze
  s.email = ["tyrauber@mac.com".freeze]
  s.files = [".gitignore".freeze, "Gemfile".freeze, "LICENSE".freeze, "README.md".freeze, "Rakefile".freeze, "lib/stock_quote.rb".freeze, "lib/stock_quote/stock.rb".freeze, "lib/stock_quote/version.rb".freeze, "spec/spec_helper.rb".freeze, "spec/stock_quote_spec.rb".freeze, "spec/support/vcr.rb".freeze, "stock_quote.gemspec".freeze]
  s.homepage = "https://github.com/tyrauber/stock_quote".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "stock_quote".freeze
  s.rubygems_version = "2.6.13".freeze
  s.summary = "A ruby gem that retrieves real-time stock quotes from google.".freeze
  s.test_files = ["spec/spec_helper.rb".freeze, "spec/stock_quote_spec.rb".freeze, "spec/support/vcr.rb".freeze]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_development_dependency(%q<vcr>.freeze, ["~> 3.0.1"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 1.24.6"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.40"])
      s.add_development_dependency(%q<byebug>.freeze, ["~> 9.0.5"])
      s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.0.2"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_dependency(%q<vcr>.freeze, ["~> 3.0.1"])
      s.add_dependency(%q<webmock>.freeze, ["~> 1.24.6"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.40"])
      s.add_dependency(%q<byebug>.freeze, ["~> 9.0.5"])
      s.add_dependency(%q<rest-client>.freeze, ["~> 2.0.2"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_dependency(%q<vcr>.freeze, ["~> 3.0.1"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.24.6"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.40"])
    s.add_dependency(%q<byebug>.freeze, ["~> 9.0.5"])
    s.add_dependency(%q<rest-client>.freeze, ["~> 2.0.2"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
  end
end
