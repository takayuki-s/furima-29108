class OrdersController < ApplicationController
  def index
    @order_info = OrderInfo.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_info = OrderInfo.new(order_params)
    @item = Item.find(params[:item_id])
      if @order_info.valid?
        pay_item
        @order_info.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def order_params
    params.require(:order_info).permit(:post_number, :prefecture_id, :municipalities, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def pay_item
    Payjp.api_key = "sk_test_9fdd24ea9c55e54c8745024b"
    Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
    )
  end
end
