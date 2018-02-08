class Pos::StocksController < ApplicationController

  def index
    @products = current_department.products
  end

  def history
  end
end
