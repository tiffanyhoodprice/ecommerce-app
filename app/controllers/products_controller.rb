class ProductsController < ApplicationController

  def products
    @product_list = Product.all
  end

end
