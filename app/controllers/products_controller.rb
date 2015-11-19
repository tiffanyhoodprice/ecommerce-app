class ProductsController < ApplicationController

  def index
    if params[:view] == "discounted"
      @product_list = Product.where("price < ?", 50)
    else
      @product_list = Product.all
    end
  end
  # def index
  #  @product_list = Product.all


  # end

  def new
  end

  def create
    item = params[:name]
    size = params[:size]
    price = params[:price]
    description = params[:description]
    image = params[:image]
    shoe = Product.create(name: item, size: size, price: price, description: description, image: image)
    flash[:success] = "Shoe Created"
    redirect_to "/products/#{shoe.id}"
  end

  def show
    id = params[:id]
    @product = Product.find_by(id: id)
  end

  def edit
    id = params[:id]
    @product = Product.find_by(id: id)
  end

  def update
    id = params[:id]
    product = Product.find_by(id: id)

    item = params[:product_name]
    size = params[:size]
    price = params[:price]
    description = params[:description]
    image = params[:image]
    product.update(name: item, size: size, price: price, description: description, image: image)
    flash[:success] = "#{product.name} has been updated." #Flash is special to Rails. This is a hash. Assigning value 'shoe updated' to 'key of success'
    redirect_to "/products/#{product.id}"
  end

  def destroy
    id = params[:id]
    product = Product.find_by(id: id)

    # item = params[:name]
    # size = params[:size]
    # price = params[:price]
    # description = params[:description]
    # image = params[:image]
    product.destroy
    flash[:danger] = "#{product.name} has been deleted."
    redirect_to "/products"
  end


end
