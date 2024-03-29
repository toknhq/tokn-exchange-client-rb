Gem::Specification.new do |s|
  s.name        = 'tokn_exchange_client'
  s.version     = '0.0.2'
  s.date        = '2017-12-06'
  s.summary     = "Tokn Crypto Exchanges Client"
  s.description = "Tokn Crypto Exchanges Client"
  s.authors     = ["Eric Campbell"]
  s.email       = 'eric@tokn.io'
  s.files       = ["lib/tokn_exchange_client.rb", "lib/tokn_exchange_client/gdax_client.rb"]
  s.add_runtime_dependency 'http'
end