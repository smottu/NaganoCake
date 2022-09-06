class Admin::ItemsController < ApplicationController

  
  def new
    @item = Item.new
    @genre = @item.genre.id.find(params[:id])
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
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id)
  end
  
  def set_genre
   @genres = Genre.all
  end
  
end
