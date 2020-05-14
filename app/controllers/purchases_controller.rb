class PurchasesController < ApplicationController

  require "payjp"

  def index
    @good = Good.find_by(params[:id])
    @picture = Picture.find_by(id: @good.pictures.ids)
    @deliveryAddress = DeliveryAddress.find_by(user_id: current_user.id)
  end

end
