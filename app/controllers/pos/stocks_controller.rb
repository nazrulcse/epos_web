class Pos::StocksController < ApplicationController

  def index
    @products = current_department.products.search(params[:q])
  end

  def history
  end
end
