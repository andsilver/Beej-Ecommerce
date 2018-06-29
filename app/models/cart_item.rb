# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :user
  %i[quantity title description image_url].each do |f|
    validates f, presence: true
  end

  validates :quantity, numericality: { greater_than: 0 }
end
