class OrdersController < ApplicationController
  def create
    Notifier.order_submitted(params[:order]).deliver
  end
end