# frozen_string_literal: true

module ApplicationHelper
  def avatar_url(user, size: 30)
    if user.avatar.attached? && user.avatar.respond_to?(:variant) # ActiveStorage is a bit buggy..
      url_for(user.avatar.variant(resize: "#{size}x#{size}"))
    else
      '/images/avatar.jpg'
    end
  end

  def order_status_image_path(status)
    images = {
     reviewing: 'reviewing', #missing image
     reviewed: 'reviewed',
     confirmed: 'confirmed',
     received_usa_hub: 'arrived-us',
     paid: 'paid',
     out_for_delivery: 'out-for-delivery',
     delivered: 'delivered', #missing image
     on_hold: 'on-hold',
     returned: 'returned',
     cancelled: 'cancel'
    }
    '/images/icons/order_status/' + images.fetch(status.to_sym) + '.png'
  end

  def number_to_currency_with_conversion(number)
    return unless number
    (number_to_currency(number) + "(JOD #{number * 0.73})").html_safe
  end
end
