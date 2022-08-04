class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_purchaser = OrderPurchaser.new
  end

  def create
  end
end
