class GoodsController < ApplicationController
  before_action :set_parents, only: [:new, :create, :edit, :update, :show]
  before_action :login_check, only: [:new, :create, :edit, :update, :destroy]

  def index
    @goods = Good.order('id DESC').limit(3)
    @goods1 = Good.order('id DESC').limit(3).offset(3)
    @goods2 = Good.order('id DESC').limit(3).offset(6)
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

  def categoryChildren  
    @categoryChildren = Category.find(params[:selectedCategory]).children 
  end

  def categoryGrandChildren
    @categoryGrandChildren = Category.find(params[:selectedCategory]).children
  end


  def show
    @good = Good.find_by(params[:id])
    @user = User.find_by(params[:id])
    @pictures = Picture.where(id: @good.pictures.ids)
    @category = Category.find_by(id: @good.category_id)  
  end

  def edit
    @good = Good.find(params[:id])
  end
  
  def update
    good = Good.find(params[:id])
    good.update(good_params)
    redirect_to good_path(good.id)
    # 下記：この後updateアクション作成時に活用修正予定です。
    # @good = Good.find(params[:id])
    # if @good.save
    #   redirect_to good_path
    #   # redirect_to root_path
    # else
    #   render :edit
    # end
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

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def login_check
    redirect_to root_path unless user_signed_in?
  end
end