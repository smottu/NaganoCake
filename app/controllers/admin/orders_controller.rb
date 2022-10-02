class Admin::OrdersController < ApplicationController


  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path
  end



private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
