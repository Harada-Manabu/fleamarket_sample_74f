class PurchasesController < ApplicationController

  before_action :set_good, only: [:index, :pay]
  require "payjp"

  def index
    @picture = Picture.find_by(id: @good.pictures.ids)
    @deliveryAddress = DeliveryAddress.find_by(user_id: current_user.id)

    if current_user.credit_card.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      @card = CreditCard.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_id)

      @card_brand = @customer_card.brand
      case @card_brand
      when "Visa"
        @card_src = "visa-logo"
      when "MasterCard"
        @card_src = "mastercard-logo"
      when "JCB"
        @card_src = "jcb-logo"
      when "American Express"
        @card_src = "amex-logo"
      when "Diners Club"
        @card_src = "diners-logo"
      when "Discover"
        @card_src = "discover-logo"
      end

      @exp_month = @customer_card.exp_month.to_s
      @exp_year = @customer_card.exp_year.to_s.slice(2,3)
    end
  end

  def pay
    @card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']

    charge = Payjp::Charge.create(
      amount: @good.price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy'
    )
    
    redirect_to action: 'done'
  end

  def done
    @good_buyer = Good.find(params[:good_id])
    @good_buyer.update(buyer_id: current_user.id)
  end

  def set_good
    @good = Good.find(params[:good_id])
  end

end
