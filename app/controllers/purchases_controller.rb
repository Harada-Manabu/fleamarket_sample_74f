class PurchasesController < ApplicationController

  before_action :login_check
  before_action :own_goods
  before_action :set_good, only: [:index, :pay]
  require "payjp"

  def index
    @picture = Picture.find_by(id: @good.pictures.ids)
    @deliveryAddress = DeliveryAddress.find_by(user_id: current_user.id)

    if current_user.credit_card.present?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      @card = CreditCard.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_id)

      @card_brand = @customer_card.brand
      case @card_brand
      when "Visa"
        @card_src = "visa-logo.gif"
      when "MasterCard"
        @card_src = "mastercard-logo.gif"
      when "JCB"
        @card_src = "jcb-logo.gif"
      when "American Express"
        @card_src = "amex-logo.gif"
      when "Diners Club"
        @card_src = "diners-logo.gif"
      when "Discover"
        @card_src = "discover-logo.gif"
      end

      @exp_month = @customer_card.exp_month.to_s
      @exp_year = @customer_card.exp_year.to_s.slice(2,3)
    end
  end

  def pay
    unless
      @good.user_id == current_user.id
        @card = CreditCard.find_by(user_id: current_user.id)
        Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]

        charge = Payjp::Charge.create(
          amount: @good.price,
          customer: Payjp::Customer.retrieve(@card.customer_id),
          currency: 'jpy'
        )
        redirect_to action: 'done'
    end
  end

  def done
    @good = Good.find(params[:good_id])
    @good.update(buyer_id: current_user.id)
  end

  def login_check
    redirect_to root_path unless user_signed_in?
  end

  def own_goods
    @good = Good.find(params[:good_id])
    if
      @good.user_id == current_user.id
      redirect_to root_path
    end
  end


  def set_good
    @good = Good.find(params[:good_id])
  end

end
