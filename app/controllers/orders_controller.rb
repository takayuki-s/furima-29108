class OrdersController < ApplicationController
  def index
    @order_info = OrderInfo.new
  end

  def create
    @order_info = OrderInfo.new(order_params)
      if @order_info.valid?
        @order_info.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def order_params
    params.require(:order_info).permit(:post_number, :prefecture_id, :municipalities, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id] )
  end
end
