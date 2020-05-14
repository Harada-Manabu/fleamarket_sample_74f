class PurchasesController < ApplicationController

  require "payjp"

  def index
    @good = Good.find_by(params[:id])
    @picture = Picture.find_by(id: @good.pictures.ids)
    @deliveryAddress = DeliveryAddress.find_by(user_id: current_user.id)
    @user = current_user

    if @user.credit_card.present?
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
    else
    end
  end

end