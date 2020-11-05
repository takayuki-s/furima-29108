class OrdersController < ApplicationController
  before_action :move_to_login
  before_action :item_user_check
  before_action :set_item, only: [:index, :create]
  before_action :order_check

  def index
    @order_info = OrderInfo.new
  end

  def create
    @order_info = OrderInfo.new(order_params)
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
    params.require(:order_info).permit(:post_number, :prefecture_id, :municipalities, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
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
    redirect_to root_path if current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_check
    @orders = Order.all
    @orders.each do |order|
      if order.item_id == @item.id
        redirect_to root_path
        return
      end
    end
  end
end
