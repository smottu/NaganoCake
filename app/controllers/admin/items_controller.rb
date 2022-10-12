class Admin::ItemsController < ApplicationController


  def new
    @item = Item.new
    # @genres = Genre.all
    set_genre
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item.id)
    else
     render :new
    end
  end

  def index
    @items = Item.all.page(params[:page])

  end

  def show
    @item = Item.find(params[:id])

  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id, :is_active)
  end

  def set_genre
  @genres = Genre.all
  end

end
