class GoodsController < ApplicationController

  before_action :set_parents, only: [:new, :create, :show, :edit, :update]
  before_action :set_good, only: [:show, :edit, :update, :destroy]
  before_action :set_pictures, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new, :create, :edit, :update, :destroy]
  before_action :seller_check, only: [:edit, :update, :destroy]


  def index
    @goods = Good.order('id DESC').limit(3)
    @goods1 = Good.order('id DESC').limit(3).offset(3)
    @goods2 = Good.order('id DESC').limit(3).offset(6)
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
    @user = @good.user
    @grandChild = @good.category
    @child = @grandChild.parent
    @parent = @child.parent
  end

  def edit
    grandchild_category = @good.category
    child_category = grandchild_category.parent
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent
    end
    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end
    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
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
    @good = Good.find_by(id: params[:id])
  end
  def set_pictures
    @pictures = Picture.where(id: @good.pictures.ids)
  end
  def login_check
    redirect_to root_path unless user_signed_in?
  end
  def seller_check
    redirect_to root_path unless user_signed_in? && current_user.id == @good.user_id
  end

end