class SuppliersController < ApplicationController

  def new
    @supplier = Supplier.new
  end

  def create
    name = params[:name]
    email = params[:email]
    phone = params[:phone]
    supplier = Supplier.create(name: name, email: email, phone: phone)
  end

  def show
    id = params[:id]
    @supplier = Product.find_by(id: id)
  end

end
