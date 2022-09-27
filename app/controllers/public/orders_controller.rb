class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer
    @order.save
    redirect_to orders_confirm_path
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
    @order.customer_id = current_customer
    @orders = Order.all
  end
end

  private
  def Order_params
    params.require(:Order).permit(:payment_method, :postal_code, :address, :name)
  end

