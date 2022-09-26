class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm

  end

  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
  end
end
