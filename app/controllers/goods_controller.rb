class GoodsController < ApplicationController
  def index
  end

  def new
    @good = Good.new
    5.times{@good.pictures.new} 
    @parents = Category.where(ancestry: nil)
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
    @good = Good.find_by(params[:id])
    @pictures = Picture.where(id: @good.pictures.ids)
    @parents = Category.all.order("id ASC").limit(13)
  end
  def edit
    @good = Good.find(params[:id])
  end
  def update
    good = Good.find(params[:id])
    good.update(good_params)
  end
  def destroy
    good = Good.find(params[:id])
    good.destroy
  end


  private
  def good_params
    params.require(:good).permit(:goodsName, :explanation, :category_id, :brand, :goodsCondition, :deliveryFee, :prefecture_id, :deliveryDay, :price, pictures_attributes: [:goodsImage]).merge(user_id: current_user.id)
  end

end