class Admin::GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
    redirect_to admin_genres_path
    else
    flash[:notice] = '登録が失敗しました'
    redirect_to admin_genres_path

    end
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end


  def edit
    @genre = Genre.find(params[:id])
    render :edit
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
