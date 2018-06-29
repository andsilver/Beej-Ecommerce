# frozen_string_literal: true

class Product
  attr_reader :name, :image_url

  def initialize(params)
    @name = params.fetch(:name)
    @image_url = params.fetch(:image_url)
  end
end
