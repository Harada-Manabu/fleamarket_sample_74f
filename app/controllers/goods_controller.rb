class GoodsController < ApplicationController
  def index
  end

  def new
    @good = Good.new
    2.times{@good.pictures.new}
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  end

  private

  def good_params
    params.require(:good).permit(:goodsName, :explanation, :category_id, :brand, :goodsCondition, :deliveryFee, :prefecture, :deliveryDay, :price, pictures_attributes: [:goodsImage]).merge(user_id: current_user.id)
  end
end