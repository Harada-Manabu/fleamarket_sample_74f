class GoodsController < ApplicationController
  before_action :set_parents, only: [:new, :create, :edit, :update]

  def index
  end

  def new
    @good = Good.new
    5.times{@good.pictures.new} 
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      redirect_to root_path
    else
      redirect_to new_good_path
    end
  end


  def show
    @good = Good.find_by(params[:id])
    @user = User.find_by(params[:id])
    @pictures = Picture.where(id: @good.pictures.ids)
    @category = Category.find_by(id: @good.category_id)
  
    # @parents = Category.all.order("id ASC").limit(13)
  end
  def edit
    @good = Good.find(params[:id])
  end
  def update
    good = Good.find(params[:id])
    good.update(good_params)
    redirect_to good_path(good.id)
  end
  def destroy
    good = Good.find(params[:id])
    good.destroy
    redirect_to root_path
  end


  private
  def good_params
    params.require(:good).permit(:goodsName, :explanation, :category_id, :brand, :goodsCondition, :deliveryFee, :prefecture_id, :deliveryDay, :price, pictures_attributes: [:goodsImage]).merge(user_id: current_user.id)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end