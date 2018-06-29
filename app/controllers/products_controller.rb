# frozen_string_literal: true

class ProductsController < ApplicationController
  def fetch
    url = params[:url]
    raise ActiveRecord::RecordNotFound unless url
    begin
      @product = ProductFetcher.fetch(url: url)
    rescue ProductFetcher::NotFound
      raise ActiveRecord::RecordNotFound
    end

    render json: @product
  end
end
