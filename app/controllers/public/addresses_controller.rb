class Public::AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
    render :edit
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
   @address = Address.find(params[:id])
   @address.destroy
   redirect_to addresses_path
  end
end


private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end