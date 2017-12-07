require 'http'
require 'base64'
# require 'openssl'
# require 'json'

class ToknExchangeClient::GDAXClient
  def initialize(key, secret, passphrase)
    @api_key = key
    @secret = secret
    @passphrase = passphrase
    @base_path = "https://api.gdax.com/"
  end

  def signature(request_path='', body='', timestamp=nil, method='GET')
    body = body.to_json if body.is_a?(Hash)
    timestamp = Time.now.to_i if !timestamp

    what = "#{timestamp}#{method}#{request_path}#{body}";

    # create a sha256 hmac with the secret
    secret = Base64.decode64(@secret)
    hash  = OpenSSL::HMAC.digest('sha256', secret, what)
    Base64.strict_encode64(hash)
  end

  ###
  ### Accounts
  ###
  def list_accounts
    return unless @api_key
    resp = HTTP.get(@base_path + "accounts")
    return JSON.parse(resp)
  end

  ###
  ### Products
  ###
  def get_products
    return unless @api_key
    resp = HTTP.get(@base_path + "products")
    return JSON.parse(resp)
  end

  def get_product_order_book(product_id)
    return unless @api_key
    resp = HTTP.get(@base_path + "products/#{product_id}/book")
    return JSON.parse(resp)
  end

  def get_product_ticker(product_id)
    return unless @api_key
    resp = HTTP.get(@base_path + "products/#{product_id}/ticker")
    return JSON.parse(resp)
  end

  def get_product_trades(product_id)
    return unless @api_key
    resp = HTTP.get(@base_path + "products/#{product_id}/trades")
    return JSON.parse(resp)
  end

  def get_product_historic_rates(product_id)
    return unless @api_key
    resp = HTTP.get(@base_path + "products/#{product_id}/candles")
    return JSON.parse(resp)
  end

  def get_product_stats(product_id)
    return unless @api_key
    resp = HTTP.get(@base_path + "products/#{product_id}/stats")
    return JSON.parse(resp)
  end

  ###
  ### Currencies
  ###
  def get_currencies
    return unless @api_key
    resp = HTTP.get(@base_path + "currencies")
    return JSON.parse(resp)
  end

  ###
  ### Time
  ###
  def get_time
    return unless @api_key
    resp = HTTP.get(@base_path + "time")
    return JSON.parse(resp)
  end
end