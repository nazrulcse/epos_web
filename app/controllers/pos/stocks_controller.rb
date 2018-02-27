class Pos::StocksController < ApplicationController
  before_filter :current_ability

  def index
    @products = current_department.products.search(params[:q])
    @stock_summary = Pos::Stock.summary(current_department.products)
  end

  def history
  end
end
