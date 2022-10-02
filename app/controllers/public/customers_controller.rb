class Public::CustomersController < ApplicationController


  def mypage
   @customer = current_customer
  end


  def unsubscribe
   @customer = current_customer

  end

  def withdraw
   @customer = current_customer
   @customer.update(is_deleted: true)
   reset_session
   flash[:notice] = "退会処理を実行いたしました"
   redirect_to root_path
  end
end
