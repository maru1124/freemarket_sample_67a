class DetailPagesController < ApplicationController
  def index
    @commodity_detail = Commodity.find(params[:id])
  end
end
