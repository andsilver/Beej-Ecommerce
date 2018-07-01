# frozen_string_literal: true

module ApplicationHelper
  def avatar_url(user, size: 30)
    if user.avatar.attached? && user.avatar.respond_to?(:variant) # ActiveStorage is a bit buggy..
      url_for(user.avatar.variant(resize: "#{size}x#{size}"))
    else
      '/images/avatar.jpg'
    end
  end
end
