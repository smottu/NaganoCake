class Public::CustomersController < ApplicationController
  
  

  def unsubscribe
   @customer = current_customer

  end

  def withdrawal
   @customer = current_customer
   @customer.update(is_deleted: true)
   reset_session
  end
end
