class GiftCardsController < ApplicationController
  def index
    @order_id = SecureRandom.uuid
    @customer_name = '김토스'
  end

  def success
    options = {
      headers: {
        Authorization: "Basic " + Base64.strict_encode64("test_sk_jkYG57Eba3G5j9yPkalrpWDOxmA1:"),
        "Content-Type": "application/json"
      },
      body: {
        orderId: params['orderId'],
        amount: params['amount']
      }.to_json
    }

    begin
      res = HTTParty.post("https://api.tosspayments.com/v1/payments/" + params['paymentKey'], options).parsed_response
      # TODO: 구매 완료 비즈니스 로직 구현

      @title = '성공적으로 구매했습니다.'
      @amount = res['totalAmount']
      @receipt_url = res['receiptUrl']
    rescue
      redirect_to fail_path(res)
    end
  end

  def fail
    @message = params['message'] || "실패 하였습니다."
    @code = params['code'] || "전달받은 Code"
  end
end
