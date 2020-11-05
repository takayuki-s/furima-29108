class OrdersController < ApplicationController
  before_action :move_to_login
  before_action :item_user_check
  before_action :set_item

  def index
    @order_info = OrderInfo.new
    set_item
  end

  def create
    @order_info = OrderInfo.new(order_params)
    set_item
      if @order_info.valid?
        pay_item
        @order_info.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def order_params
    params.require(:order_info).permit(:post_number, :prefecture_id, :municipalities, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
    )
  end

  def move_to_login
    redirect_to user_session_path unless user_signed_in?
  end

  def item_user_check
    set_item
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
