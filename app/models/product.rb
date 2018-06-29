# frozen_string_literal: true

class Product
  attr_reader :title, :image_url

  def initialize(params)
    @title = params.fetch(:title)
    @image_url = params.fetch(:image_url)
  end
end
