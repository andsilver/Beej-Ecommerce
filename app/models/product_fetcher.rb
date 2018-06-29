# frozen_string_literal: true

class ProductFetcher
  class NotFound < StandardError; end
  def self.fetch(url:)
    request_url = base_url + URI.encode_www_form(url: url)
    begin
      response = HTTParty.get(request_url)
      body = response.body
      result = JSON.parse(body)
      data = result.fetch('data')
      puts data.inspect
      name = data.fetch('title')
      image_url = data.fetch('mainImage')
      product = Product.new(name: name, image_url: image_url)
    rescue StandardError
      raise NotFound
    end
    product
  end

  def self.base_url
    'https://www.edfa3ly.co/internal/api/web/page/item/info?'
  end
end
