# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :rememberable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_many :cart_items
  has_many :orders
  has_one_attached :avatar

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  monetize :wallet_balance_cents

  def avatar_url
    '/images/avatar.jpg'
    # 'https://s.gravatar.com/avatar/d042f207f1d733e7c513acd188e80336?s=160'
  end

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
      u.email = auth.info.email
      u.password = Devise.friendly_token[0, 20]
      u.name = auth.info.name # assuming the user model has a name
    end
    user.set_avatar(auth)

    user
  end

  def set_avatar(auth)
    return if avatar.attached?
    require 'open-uri'
    uri = URI.parse(auth.info.image)
    file = uri.open
    avatar.attach(io: file, filename: 'avatar.jpg')
  rescue StandardError
    # Simply don't break
  end
end
