class Pos::StocksController < ApplicationController
  before_filter :current_ability

  def index
    @products = current_department.products.search(params[:q])
  end

  def history
  end
end
