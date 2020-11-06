class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit]
  

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :category_id, :condition_id, :postage_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
