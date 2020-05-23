class CreditController < ApplicationController
  require "payjp"
  protect_from_forgery
  before_action :set_card

  def new
    # card = Card.where(user_id: 1)
    redirect_to action: "show" if @set_card

  end

  def pay
    Payjp.api_key =ENV["PAYJP_ACCESS_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token']
      )
      @card = Card.new(user_id: 1, customer_id: customer.id,card_id:customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action:"pay"
      end
    end
  end

  def delete 
    # card = Card.where(user_id: 1).first
    if @set_card.blank?
    else
      Payjp.api_key =ENV["PAYJP_ACCESS_KEY"]
      customer = Payjp::Customer.retrieve(@set_card.customer_id)
      customer.delete
      @set_card.delete
    end
      redirect_to action: "new"
  end

  def show 
    # card = Card.where(user_id: 1).first
    if @set_card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key =ENV["PAYJP_ACCESS_KEY"]
      customer = Payjp::Customer.retrieve(@set_card.customer_id)
      @default_card_information = customer.cards.retrieve(@set_card.card_id)
    end
  end

  private

  def set_card
    @set_card = Card.where(user_id: 1).first
  end
end