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
# Unique methods should be put underneath private for when you can't use model methods (which have to use instance methods or class methods)
private

  def calculate_subtotal(carted_products)
    subtotal = 0
    carted_products.each do |carted_product|
    subtotal += (carted_product.product.price * carted_product.quantity)
    end
    return subtotal
  end

  def calculate_tax(carted_products)
    tax = 0
    carted_products.each do |carted_product|
      tax += (carted_product.product.tax * carted_product.quantity)
    end
    return tax
  end

  def authenticate_admin!
    flash[:danger] = "Try again!"    
    redirect_to "/" unless current_user && current_user.admin?
  end

end
