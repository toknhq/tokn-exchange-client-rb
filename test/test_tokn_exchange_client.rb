require 'minitest/autorun'
require 'tokn_exchange_client'

class ToknExchangeClientGDAXTest < Minitest::Test
  def api_key
    "asdf123"
  end

  def api_secret
    ""
  end

  def api_passphrase
    ""
  end

  def client
    @c ||= ToknExchangeClient::GDAXClient.new(self.api_key, self.api_secret, self.api_passphrase)
  end

  def test_api_key_init
    # assert_equal(self.api_key, self.client.send(:api_key))
  end

  def test_get_products
    products = self.client.get_products
    assert(products.class == Array)
    assert(products.length >= 1)
  end

  def test_get_product_order_book
    order_book = self.client.get_product_order_book("BTC-USD")
    assert(order_book.class == Hash)
    assert(order_book["sequence"] != nil)
    assert(order_book["bids"] != nil)
    assert(order_book["asks"] != nil)

    order_book = self.client.get_product_order_book("ETH-USD")
    assert(order_book.class == Hash)
    assert(order_book["sequence"] != nil)
    assert(order_book["bids"] != nil)
    assert(order_book["asks"] != nil)

    order_book = self.client.get_product_order_book("LTC-USD")
    assert(order_book.class == Hash)
    assert(order_book["sequence"] != nil)
    assert(order_book["bids"] != nil)
    assert(order_book["asks"] != nil)
  end

  def test_get_product_ticker
    ticker = self.client.get_product_ticker("BTC-USD")
    assert(ticker.class == Hash)
    assert(ticker["trade_id"] != nil)
    assert(ticker["price"] != nil)
    assert(ticker["size"] != nil)
    assert(ticker["bid"] != nil)
    assert(ticker["ask"] != nil)
    assert(ticker["volume"] != nil)
    assert(ticker["time"] != nil)
  end

  def test_get_product_trades
    trades = self.client.get_product_trades("BTC-USD")
    assert(trades.class == Array)
    assert(trades.length > 0)
  end

  def test_get_product_historic_rates
    rates = self.client.get_product_historic_rates("BTC-USD")
    assert(rates.class == Array)
    assert(rates.length > 0)
  end

  def test_get_product_stats
    stats = self.client.get_product_stats("BTC-USD")
    assert(stats.class == Hash)
    assert(stats["open"] != nil)
    assert(stats["high"] != nil) 
    assert(stats["low"] != nil)
    assert(stats["volume"] != nil)
    assert(stats["last"] != nil)
    assert(stats["volume_30day"] != nil)
  end
  
  def test_get_currencies
    currencies = self.client.get_currencies
    assert(currencies.class == Array)
    assert(currencies.length > 0)
  end

  def test_get_time
    time = self.client.get_time
    assert(time.class == Hash)
    assert(time["iso"] != nil)
    assert(time["epoch"] != nil)
  end
end