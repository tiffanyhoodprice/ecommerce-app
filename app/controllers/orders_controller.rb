class OrdersController < ApplicationController

 def create #for each action, must have a function in the controller (create, and show)
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i #because this is coming from a form, remember that it has to be converted to an integer even though the data type is marked as an integer
    subtotal = quantity * product.price
    tax = quantity * product.tax
    total = subtotal + tax
    order = Order.create(user_id: current_user.id, product_id: product.id, quantity: quantity, subtotal: subtotal, tax: tax, total: total)
    flash[:success] = "Order Completed"
    redirect_to "/orders/#{order.id}"
  end

  def show
    id = params[:id]
    @order = Order.find_by(id: id)
    @product = Product.find_by(id: @order.product_id) #Need to review this some more.
  end

end