class CommoditiesController < ApplicationController
  before_action :set_product,  only: [:edit, :update, :destroy]

  def index
    @commodities = Commodity.all.order(sales_status_id: "DESC", id: "ASC")
    @last_commodities = @commodities.last(3)
  end

  def new
    @commodity = Commodity.new
    @commodity.images.new
    @category_select = ["選択して下さい"]
    Category.where(ancestry: nil).each do |parent|
      @category_select << parent.name
    end 
  end

  def category_children 
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find_by(id: "#{params[:child_name]}").children
  end

  def create
    @commodity = Commodity.new(commodity_params)
    if @commodity.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def update
    if @commodity.update(commodity_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @commodity = Commodity.find(params[:id])
    # コメントを表示するためデータ取得
    @comments = @commodity.comments.includes(:user).all
    @comment = Comment.new
  end

  def destroy
    @commodity = Commodity.find(params[:id])
    if commodity.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def commodity_params
    params.require(:commodity).permit(:name, :text, :category_id, :clothe, :brand, :condition, :shipping_charge, :shipping_method_id, 
    :prefecture_id, :day_to_ship, :price, :sales_status_id, images_attributes: [:image, :_destroy, :id])
    .merge(exhibition_commodity_id: current_user.id)
  end

  def set_item
    @commodity = Commodity.find(params[:id])
  end
  
end
