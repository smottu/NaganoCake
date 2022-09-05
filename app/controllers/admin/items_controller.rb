class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genre = 
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
    @item = Item.find(params[:id])
    @genre = Genre.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    
  end

  def edit
  end

private
  def item_params
    params.permit(:name, :introduction, :image, :price)
  end
end