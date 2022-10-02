class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer
    @cart_items = current_customer.cart_items
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
  	elsif params[:order][:select_address] == "1"
  	  @address = Address.find(params[:order][:address_id])
		  @order.postal_code = @address.postal_code
			@order.address = @address.address
			@order.name = @address.name
     elsif params[:order][:select_address] == "2"
		  @order.postal_code = params[:order][:postal_code]
		  @order.address = params[:order][:address]
		  @order.name = params[:order][:name]
    end
   end


  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item.id
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.quantity = cart_item.amount
      @order_detail.making_status = 0
      @order_detail.save
    end
    CartItem.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders

  end

  def show
    @order = Order.find(params[:id])


  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :amount_money)
  end

end