class CartedProductsController < ApplicationController

  def create #for each action, must have a function in the controller (create, and show)
    @product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i #because this is coming from a form, remember that it has to be converted to an integer even though the data type is marked as an integer
    @carted_product = CartedProduct.new(user_id: current_user.id, product_id: @product.id, quantity: quantity, status: "carted")
    if @carted_product.save
      flash[:success] = "Items have been placed in your shopping cart"
      redirect_to "/carted_products"
    else
      flash[:danger] = "Your item was not placed in your cart. Be sure to enter the quantity of items desired. Please try again."
      render template: "products/show" #This isn't a redirect.
    end
  end

  def index
    if current_user && current_user.carted_products.where(status: "carted").any?
    @carted_products = current_user.carted_products.where(status: "carted") #CartedProduct.all shows all user data and all carted products regardless of their status
    @subtotal = calculate_subtotal(@carted_products)
    @tax = calculate_tax(@carted_products)
    @total = @subtotal + @tax
    else
    redirect_to "/"
    end
  end


  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    if carted_product.save
      flash[:warning] = "#{carted_product.quantity} #{carted_product.product.name}(s) has been removed from your shopping cart."
    else
      flash[:danger] = "Product not removed from cart!"
    end
    redirect_to "/carted_products"
   
  end


  
end
