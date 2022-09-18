class Public::MypageController < ApplicationController

  def show
    @customer = current_customer
    
  end
end
