class ConfirmationPagesController < ApplicationController
  def index
    card = Card.where(user_id: 1).first
    @commodities = Commodity.find(params[:id])
    if card.blank?
      redirect_to controller: "credit", action: "new"
    else
      Payjp.api_key = "sk_test_68a20abc86387e6c7cfc8b9c"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: 1).first
    @commodities = Commodity.find(params[:id])
    Payjp.api_key = "sk_test_68a20abc86387e6c7cfc8b9c"
    Payjp::Charge.create(
    :amount => @commodities.price, 
    :customer => card.customer_id, 
    :currency => 'jpy', 
  )
  @commodities_buyer = Commodity.find(params[:id])
  @commodities_buyer.update(sales_status_id: 2)
  redirect_to done_confirmation_pages_path(id: @commodities) 
  end

  def done
    @commodities = Commodity.find(params[:id])
  end
end
