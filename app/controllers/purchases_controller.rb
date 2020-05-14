class PurchasesController < ApplicationController

  require "payjp"

  def index
    @good = Good.find_by(params[:id])
    @picture = Picture.find_by(id: @good.pictures.ids)
  end

end
