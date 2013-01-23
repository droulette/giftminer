class HomeController < ApplicationController
  def index
    @new_products = Product.sorteddesc.limit(8)
  end
end
