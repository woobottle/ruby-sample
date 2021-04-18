class PaymentsController < ApplicationController
  
  def index
    @order_id = SecureRandom.uuid
    @customer_name = '김토스'
  end
  
end
