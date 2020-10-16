class ItemsController < ApplicationController
  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :price,:category_id, :days_to_ship_id, :delivery_char_id, :shipment_source_id, :status_id, :image).merge(user_id: current_user.id)
  end
end
