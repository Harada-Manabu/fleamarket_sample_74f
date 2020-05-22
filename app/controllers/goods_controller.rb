class GoodsController < ApplicationController
  before_action :set_parents, only: [:new, :create, :show, :edit, :update]
  before_action :set_good, only: [:show, :edit, :update, :destroy]
  before_action :set_pictures, only: [:show, :edit, :update, :destroy]


  def index
  end

  def new
    @good = Good.new
    @good.pictures.new
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
    @user = User.find_by(params[:id])
    @category = Category.find_by(id: @good.category_id)
  end

  def edit
  end

  def update
    if @good.update(good_params)
      redirect_to good_path(@good.id)
    else
      render :edit
    end
  end

  def destroy
    @good.destroy
    redirect_to root_path
  end


  private
  def good_params
    params.require(:good).permit(
      :goodsName,
      :explanation,
      :category_id,
      :brand,
      :goodsCondition,
      :deliveryFee,
      :prefecture_id,
      :deliveryDay,
      :price,
      pictures_attributes: [:goodsImage, :_destroy, :id]).merge(user_id: current_user.id)
  end
  def set_parents
    @parents = Category.where(ancestry: nil)
  end
  def set_good
    @good = Good.find(params[:id])
  end
  def set_pictures
    @pictures = Picture.where(id: @good.pictures.ids)
  end
end