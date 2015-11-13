class ProductsController < ApplicationController

  def index
    @product_list = Product.all
  end

  def new
  end

  def create
    item = params[:name]
    size = params[:size]
    price = params[:price]
    description = params[:description]
    image = params[:image]
    Product.create(name: item, size: size, price: price, description: description, image: image)
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

    item = params[:name]
    size = params[:size]
    price = params[:price]
    description = params[:description]
    image = params[:image]
    product.update(name: item, size: size, price: price, description: description, image: image)
  end

  def destroy
    id = params[:id]
    product = Product.find_by(id: id)

    item = params[:name]
    size = params[:size]
    price = params[:price]
    description = params[:description]
    image = params[:image]
    product.destroy
  end

end
