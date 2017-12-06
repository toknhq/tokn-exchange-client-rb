class ToknExchangeClient::KrakenClient
  def initialize(api_key)
    @api_key = api_key
  end

  def hi
    puts(@api_key)
  end
end