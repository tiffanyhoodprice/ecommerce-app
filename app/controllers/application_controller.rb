class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def discounts
    params[:view] == "discounted"
    @product = Product.where("price < ?", 50)
  end
  
  def random
    params[:view] == "random"
    rand_id = rand(Product.count)
    rand_record = Product.first(:conditions => [ "id >= ?", rand_id])
  end


end
