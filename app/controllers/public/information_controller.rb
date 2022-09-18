class Public::InformationController < ApplicationController
  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(params)
    redirect_to customers_mypage_path
  end
end
