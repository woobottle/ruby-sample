class VirtualAccountsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:callback]

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
    @message = "해당 계좌로 입금하시면 결제 완료 됩니다."
  end

  def fail
    @message = params['message'] || "실패 하였습니다."
    @code = params['code'] || "전달받은 Code"
  end

  def callback
    if params.dig("data", "status") == "DONE"
      # 승인된 경우, 승인 된 주문 업데이트
    else 
      # 문제가 생긴 경우, 승인된 주문 취소하고 사용자에게 알맞은 액션 처리
    end
  end
end
