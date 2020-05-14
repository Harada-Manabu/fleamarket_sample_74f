class PurchasesController < ApplicationController

  require "payjp"

  def index
    @good = Good.find_by(params[:id])
    @pictures = Picture.where(id: @good.pictures.ids)
  end

end
