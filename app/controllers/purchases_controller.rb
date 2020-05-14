class PurchasesController < ApplicationController

  def index
    @good = Good.find_by(params[:id])
  end

end
