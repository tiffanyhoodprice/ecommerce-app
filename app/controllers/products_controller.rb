class ProductsController < ApplicationController

  def index
    if params[:view] == "discounted"
      @product_list = Product.where("price < ?", 50)
    elsif
      params[:view] == "order_by_price"
      @product_list = Product.order(:price)
    elsif
      params[:view] == "order_by_price_desc"
      @product_list = Product.order(price: :desc)
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
    if params[:id] = "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: id)
    end
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

  def search
    search_term = params[:search]
    @product_list = Product.where("name LIKE ? OR description LIKE ?", "%#{search_term}%", "%#{search_term}%")
    render :index
  end

end
